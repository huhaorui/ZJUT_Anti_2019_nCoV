package util

import com.google.gson.Gson
import conn.DatabaseProvider
import model.Admin
import model.Teacher
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook

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

    fun insert(): String {
        val conn = DatabaseProvider.getConn()

        //region 检查表格字段名
        if (classes?.first?.containsAll(setOf("学院", "专业", "班级")) != true) {
            return error(10000, "班级表不符合要求")
        } else if (admins?.first?.containsAll(setOf("工号", "系统管理员", "校级管理员", "院级管理员", "健康码访问权限", "管理对象", "邮箱", "密码")) != true) {
            return error(10000, "管理员表不符合要求")
        } else if (teachers?.first?.containsAll(setOf("姓名", "身份证号", "工号", "学院")) != true) {
            return error(10000, "教师表不符合要求")
        } else if (students?.first?.containsAll(setOf("姓名", "身份证号", "学号", "学院", "专业", "班级")) != true) {
            return error(10000, "学生表不符合要求")
        }
        //endregion

        //region 生成学院专业班级数据
        val indexCollage = classes.first.indexOf("学院")
        val indexMajor = classes.first.indexOf("专业")
        val indexClass = classes.first.indexOf("班级")
        val deptSet: HashMap<String, HashMap<String, Set<String>>> = HashMap()
        classes.second.groupBy { list: List<String> -> list[indexCollage] }.forEach { (collage, u) ->
            deptSet[collage] = HashMap()
            u.groupBy { majors -> majors.elementAtOrNull(indexMajor) }.forEach { (major, clazz) ->
                if (major != null && clazz.isNotEmpty()) {
                    deptSet[collage]?.set(major,
                            clazz[0].elementAtOrNull(indexClass)?.split(" ")?.filter { it.isNotBlank() }?.toSet()
                                    ?: setOf())
                } else if (major != null) {
                    deptSet[collage]?.set(major, setOf())
                } else {
                    deptSet[collage]?.set("", setOf())
                }
            }
        }
        //endregion

        //region 生成管理员表和数据以及校验
        val adminList = ArrayList<Admin>()
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
            val target: String
            var level = when {
                isSystem == "是" -> 8
                isSchool == "是" -> 4
                isCollage == "是" -> 2
                else -> 0
            }
            if (withHealthCodeAccess == "是") level++

            target = when {
                ((level shr 1) and 1) == 1 -> it.elementAtOrNull(indexAdminTarget) ?: ""
                else -> ""
            }
            adminList.add(Admin(it[indexAdminId], level, target, it[indexAdminPassword], it[indexAdminEmail]))
        }

        val adminError = ArrayList<Pair<Pair<Int, String>, Admin>>()

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
        val indexTeacherCollage =  teachers.first.indexOf("学院")
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
        studentList.groupBy { it.id }.forEach {
            studentError.add(10005 to "学号为${it.key}的学生重复" to it.value[0])
        }

        studentList.filter { deptSet[it.collage]?.get(it.major)?.contains(it.clazz) != true }.forEach {
            studentError.add(10006 to "学号为${it.id}的学生的学院专业班级不存在" to it)
        }

        //endregion

        conn.close()

        TODO()
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

        fun error(code: Int, msg: String): String {
            return Gson().toJson(mapOf("code" to code, "msg" to msg))
        }

        data class RawTeacher(val id: String, val name: String, val personId: String, val collage: String)
        data class RawStudent(val id: String, val name: String, val personId: String, val collage: String, val major: String, val clazz: String)
    }
}
