package util

import com.google.gson.Gson
import conn.DatabaseProvider
import model.*
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.sql.SQLException
import java.sql.Statement
import java.sql.Types

class Import(stream: MultipleForm.Stream) {
    private val admins: Pair<List<String>, List<List<String>>>?
    private val classes: Pair<List<String>, List<List<String>>>?
    private val teachers: Pair<List<String>, List<List<String>>>?
    private val students: Pair<List<String>, List<List<String>>>?

    init {
        val workbook: Workbook? = try {
            when {
                stream.filename.endsWith(".xlsx") -> XSSFWorkbook(stream.inputStream)
                stream.filename.endsWith(".xls") -> HSSFWorkbook(stream.inputStream)
                else -> null
            }
        } catch (e: Exception) {
            null
        }

        //collage major class name
        classes = workbook?.getSheet("班级")?.columnToValues()
        admins = workbook?.getSheet("管理员")?.columnToValues()
        teachers = workbook?.getSheet("教师")?.columnToValues()
        students = workbook?.getSheet("学生")?.columnToValues()
    }

    fun insert(): ArrayList<Pair<Pair<Int, String>, Any?>> {
        val conn = DatabaseProvider.getConn()
        val sql = SQL()

        //region 检查表格字段名
        if (classes?.first?.containsAll(setOf("学院", "专业", "班级")) != true) {
            return arrayListOf(10000 to "班级表不符合要求" to null)
        } else if (admins?.first?.containsAll(setOf("工号", "系统管理员", "校级管理员", "院级管理员", "健康码访问权限", "管理对象", "邮箱", "密码")) != true) {
            return arrayListOf(10000 to "管理员表不符合要求" to null)
        } else if (teachers?.first?.containsAll(setOf("姓名", "身份证号", "工号", "学院")) != true) {
            return arrayListOf(10000 to "教师表不符合要求" to null)
        } else if (students?.first?.containsAll(setOf("姓名", "身份证号", "学号", "学院", "专业", "班级")) != true) {
            return arrayListOf(10000 to "学生表不符合要求" to null)
        }
        //endregion

        //region 生成学院专业班级数据
        val deptSet: HashMap<String, HashMap<String, Set<String>>> = HashMap()
        val indexCollage = classes.first.indexOf("学院")
        val indexMajor = classes.first.indexOf("专业")
        val indexClass = classes.first.indexOf("班级")
        classes.second.groupBy { list: List<String> -> list[indexCollage] }.forEach { (collage, u) ->
            deptSet[collage] = HashMap()
            u.groupBy { majors -> majors.elementAtOrNull(indexMajor) }.forEach { (major, clazz) ->
                if (!major.isNullOrBlank() && clazz.isNotEmpty()) {
                    deptSet[collage]?.set(major, clazz[0].elementAtOrNull(indexClass)?.split(" ")?.filter { it.isNotBlank() }?.toSet()
                            ?: setOf())
                } else if (!major.isNullOrEmpty()) {
                    deptSet[collage]?.set(major, setOf())
                }
            }
        }
        //endregion

        //region 生成管理员表和数据以及校验
        val adminList = ArrayList<RawAdmin>()
        val indexAdminId = admins.first.indexOf("工号")
        val indexAdminIsSystem = admins.first.indexOf("系统管理员")
        val indexAdminIsSchool = admins.first.indexOf("校级管理员")
        val indexAdminIsCollage = admins.first.indexOf("院级管理员")
        val indexAdminWithHealthCodeAccess = admins.first.indexOf("健康码访问权限")
        val indexAdminTarget = admins.first.indexOf("管理对象")
        val indexAdminEmail = admins.first.indexOf("邮箱")
        val indexAdminPassword = admins.first.indexOf("密码")
        admins.second.map {
            val isSystem = it[indexAdminIsSystem]
            val isSchool = it[indexAdminIsSchool]
            val isCollage = it[indexAdminIsCollage]
            val withHealthCodeAccess = it[indexAdminWithHealthCodeAccess]
            val target: String?
            var level = when {
                isSystem == "是" -> 8
                isSchool == "是" -> 4
                isCollage == "是" -> 2
                else -> 0
            }
            if (withHealthCodeAccess == "是") level++

            target = when {
                ((level shr 1) and 1) == 1 -> it.elementAtOrNull(indexAdminTarget)
                else -> null
            }
            adminList.add(RawAdmin(it[indexAdminId], level, target, it[indexAdminPassword], it[indexAdminEmail]))
        }

        val adminError = ArrayList<Pair<Pair<Int, String>, RawAdmin>>()

        adminList.filter { ((it.level shr 1) and 1) == 1 && it.target !in deptSet.keys }.forEach {
            adminError.add(10001 to "院级管理员${it.id}的管理对象${it.target}不存在" to it)
        }

        adminList.groupBy { it.id }.filter { it.value.count() > 1 }.forEach {
            adminError.add(10002 to "工号为${it.key}的管理员重复" to it.value[0])
        }
        //endregion

        //region 生成教师数据
        val indexTeacherId = teachers.first.indexOf("工号")
        val indexTeacherName = teachers.first.indexOf("姓名")
        val indexTeacherPersonId = teachers.first.indexOf("身份证号")
        val indexTeacherCollage = teachers.first.indexOf("学院")
        val teacherList = teachers.second.map {
            RawTeacher(it[indexTeacherId], it[indexTeacherName], it[indexTeacherPersonId], it[indexTeacherCollage])
        }
        val teacherError = ArrayList<Pair<Pair<Int, String>, RawTeacher>>()
        teacherList.groupBy { it.id }.filter { it.value.count() > 1 }.forEach {
            teacherError.add(10003 to "工号为${it.key}的教师重复" to it.value[0])
        }

        teacherList.filter { it.collage !in deptSet.keys }.forEach {
            teacherError.add(10004 to "教师${it.id}的所属学院不存在" to it)
        }
        //endregion

        //region 生成学生数据
        val indexStudentId = students.first.indexOf("学号")
        val indexStudentName = students.first.indexOf("姓名")
        val indexStudentPersonId = students.first.indexOf("身份证号")
        val indexStudentCollage = students.first.indexOf("学院")
        val indexStudentMajor = students.first.indexOf("专业")
        val indexStudentClass = students.first.indexOf("班级")
        val studentList = students.second.map {
            RawStudent(it[indexStudentId], it[indexStudentName], it[indexStudentPersonId], it[indexStudentCollage], it[indexStudentMajor], it[indexStudentClass])
        }

        val studentError = ArrayList<Pair<Pair<Int, String>, RawStudent>>()
        studentList.groupBy { it.id }.filter { it.value.count() > 1 }.forEach {
            studentError.add(10005 to "学号为${it.key}的学生重复" to it.value[0])
        }

        studentList.filter { deptSet[it.collage]?.get(it.major)?.contains(it.clazz) != true }.forEach {
            studentError.add(10006 to "学号为${it.id}的学生的学院专业班级不存在" to it)
        }
        //endregion


        val errors = ArrayList<Pair<Pair<Int, String>, Any?>>()
        errors.apply { addAll(adminError) }.apply { addAll(teacherError) }.apply { addAll(studentError) }
        if (errors.isNotEmpty()) return errors

        //region 删库
        try {
            conn.createStatement().apply { execute("truncate table password_reset") }.close()
            conn.createStatement().apply { execute("truncate table captcha") }.close()
            conn.createStatement().apply { execute("truncate table health_info") }.close()
            conn.createStatement().apply { execute("truncate table health_code_token") }.close()
            conn.createStatement().apply { execute("truncate table punch_record") }.close()
            conn.createStatement().apply { execute("truncate table student") }.close()
            conn.createStatement().apply { execute("truncate table teacher") }.close()
            conn.createStatement().apply { execute("truncate table admin") }.close()
            conn.createStatement().apply { execute("delete from class where 1=1") }.close()
            conn.createStatement().apply { execute("delete from major where 1=1") }.close()
            conn.createStatement().apply { execute("delete from collage where 1=1") }.close()
        } catch (e: SQLException) {
            e.printStackTrace()
            errors.add(20000 to "删除数据库记录出现异常" to null)
        }
        //endregion

        val depts = HashMap<Collage, HashMap<Major, HashSet<Clazz>>>()

        //region 插入学院专业班级
        try {
            val insertCollage = conn.prepareStatement("insert into collage (name) values (?);")
            val insertMajor = conn.prepareStatement("insert into major (collage, name) values (?, ?)")
            val insertClass = conn.prepareStatement("insert into class (major, name) values (?, ?)")
            deptSet.forEach { (collage, majors) ->
                insertCollage.clearParameters()
                insertCollage.setString(1, collage)
                insertCollage.execute()
                sql.query(Collage::class.java, "name" to collage)?.let { collage1 ->
                    val m = HashMap<Major, HashSet<Clazz>>()
                    majors.forEach { (major, classes) ->
                        insertMajor.clearParameters()
                        insertMajor.setInt(1, collage1.id)
                        insertMajor.setString(2, major)
                        insertMajor.execute()
                        sql.query(Major::class.java, "collage" to collage1.id, "name" to major)?.let { major1 ->
                            val c = HashSet<Clazz>()
                            classes.forEach { clazz ->
                                insertClass.clearParameters()
                                insertClass.setInt(1, major1.id)
                                insertClass.setString(2, major + clazz)
                                insertClass.execute()
                                sql.query(Clazz::class.java, "major" to major1.id, "name" to major + clazz)?.let { clazz1 -> c.add(clazz1) }
                            }
                            m[major1] = c
                        }
                    }
                    depts[collage1] = m
                }
            }
            insertClass.close()
            insertMajor.close()
            insertCollage.close()
        } catch (e: SQLException) {
            e.printStackTrace()
            errors.add(20001 to "插入学院专业班级失败" to null)
        }
        //endregion

        //region 插入管理员
        try {
            val insertAdmin = conn.prepareStatement("insert into admin (id, level, target, password, email) values (?, ?, ?, ?, ?)")
            adminList.forEach {
                val target = if ((it.level shr 1) and 1 == 1) {
                    depts.keys.firstOrNull { collage -> collage.name == it.target }?.id
                } else null
                insertAdmin.clearParameters()
                insertAdmin.setString(1, it.id)
                insertAdmin.setInt(2, it.level)
                if (target != null) {
                    insertAdmin.setInt(3, target)
                } else {
                    insertAdmin.setNull(3, Types.INTEGER)
                }

                insertAdmin.setString(4, Admin.saltMD5(it.password, "wcfnb"))
                insertAdmin.setString(5, it.email)
                insertAdmin.execute()
            }
            insertAdmin.close()
        } catch (e: SQLException) {
            e.printStackTrace()
            errors.add(30000 to "插入管理员时出错" to null)
        }
        //endregion

        //region 插入学生
        try {
            val insertStudent = conn.prepareStatement("insert into student (id, class, name, person_id) values (?, ?, ?, ?)")
            studentList.forEach { student ->
                val collage = depts.keys.firstOrNull { collage -> collage.name == student.collage }
                val major = depts[collage]?.keys?.firstOrNull { major -> major.name == student.major }
                val clazz = depts[collage]?.get(major)?.firstOrNull { clazz -> clazz.name == student.major + student.clazz }

                if (clazz == null) {
                    errors.add(40001 to "学生${student.id}的班级不存在" to student)
                } else {
                    insertStudent.clearParameters()
                    insertStudent.setString(1, student.id)
                    insertStudent.setInt(2, clazz.id)
                    insertStudent.setString(3, student.name)
                    insertStudent.setString(4, student.personId)
                    insertStudent.execute()
                }
            }
            insertStudent.close()
        } catch (e: SQLException) {
            e.printStackTrace()
            errors.add(40000 to "插入学生时出错" to null)
        }
        //endregion

        //region 插入教师
        try {
            val insertTeacher = conn.prepareStatement("insert into teacher (id, collage, name, person_id) values (?, ?, ?, ?)")
            teacherList.forEach { teacher ->
                val collage = depts.keys.firstOrNull { collage -> collage.name == teacher.collage }
                if (collage == null) {
                    errors.add(50001 to "教师${teacher.id}的学院不存在" to teacher)
                } else {
                    insertTeacher.clearParameters()
                    insertTeacher.setString(1, teacher.id)
                    insertTeacher.setInt(2, collage.id)
                    insertTeacher.setString(3, teacher.name)
                    insertTeacher.setString(4, teacher.personId)
                    insertTeacher.execute()
                }
            }
            insertTeacher.close()
        } catch (e: SQLException) {
            e.printStackTrace()
            errors.add(50000 to "插入教师时出错" to null)
        }
        //endregion

        conn.close()

        errors.apply { addAll(adminError) }.apply { addAll(teacherError) }.apply { addAll(studentError) }
        if (errors.isNotEmpty()) return errors

        return arrayListOf(0 to "导入成功" to null)
    }


    companion object {
        fun Sheet.columnToValues(): Pair<List<String>, List<List<String>>> {
            val size = this.first().count()
            val data = map { row ->
                val tuple = ArrayList<String>()
                for (i in 0 until size) {
                    tuple.add(row.getCell(i, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).stringCellValue.trim())
                }
                tuple
            }
            val columns: List<String> = data[0]
            val values: List<List<String>> = data.subList(1, data.size)
            return columns to values
        }

        data class RawTeacher(val id: String, val name: String, val personId: String, val collage: String)
        data class RawStudent(val id: String, val name: String, val personId: String, val collage: String, val major: String, val clazz: String)
        data class RawAdmin(val id: String, val level: Int, val target: String?, val password: String, val email: String)
    }
}
