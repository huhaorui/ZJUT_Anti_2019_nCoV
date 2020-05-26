package util

import com.google.gson.Gson
import conn.DatabaseProvider
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.File

class Import(val file: File) {
    private val admins: Pair<List<String>, List<List<String>>>?
    private val classes: Pair<List<String>, List<List<String>>>?
    private val teachers: Pair<List<String>, List<List<String>>>?
    private val students: Pair<List<String>, List<List<String>>>?

    init {
        val workbook: Workbook? = try {
            when {
                file.name.endsWith(".xlsx") -> XSSFWorkbook(file.inputStream())
                file.name.endsWith(".xls") -> HSSFWorkbook(file.inputStream())
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

        if (classes?.first?.containsAll(setOf("学院", "专业", "班级")) != true) {
            return error(10000, "班级表不符合要求")
        } else if (admins?.first?.containsAll(setOf("工号", "系统管理员", "系统管理员", "校级管理员", "院级管理员", "健康码管理员", "管理对象", "邮箱", "密码")) != true) {
            return error(10000, "管理员表不符合要求")
        } else if (teachers?.first?.containsAll(setOf("姓名", "身份证号", "工号", "学院")) != true) {
            return error(10000, "教师表不符合要求")
        } else if (students?.first?.containsAll(setOf("姓名", "身份证号", "学号", "学院", "专业", "班级")) != true) {
            return error(10000, "学生表不符合要求")
        }

        val indexCollage = classes.first.indexOf("学院")
        val indexMajor = classes.first.indexOf("专业")
        val indexClass = classes.first.indexOf("班级")
        val deptSet: HashMap<String, HashMap<String, List<String>>> = HashMap()
        classes.second.groupBy { it[indexCollage] }.forEach { key, value ->
            val map = value.groupBy { it[indexCollage] }

        }




        classes.let { pair ->
            val columns = pair.first



            val ps = conn.prepareStatement("insert into class (id, major, name) values (?, ?, ?)")
        }

        conn.close()
        
        TODO()
    }


    companion object {
        fun Sheet.columnToValues(): Pair<List<String>, List<List<String>>> {
            val data = map { row -> row.map { cell -> cell.stringCellValue } }
            val columns: List<String> = data[0]

            val values: List<List<String>> = data.subList(1, data.size)
            return columns to values
        }

        fun error(code: Int, msg: String): String {
            return Gson().toJson(mapOf("code" to code, "msg" to msg))
        }

    }
}
