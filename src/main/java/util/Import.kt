package util

import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.File

class Import(val file: File) {
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

        val collages = workbook?.getSheet("学院")?.let { sheet ->
            val data = sheet.map { row -> row.map { cell -> cell.stringCellValue } }
            val columns = data[0]
            val map = ArrayList<HashMap<String, String>>()
            data.takeLast(data.lastIndex).forEach { d ->
                columns.forEachIndexed { index: Int, value: String ->
                    map.add(hashMapOf(value to d[index]))
                }
            }
            return@let map
        }
        val majors = workbook?.getSheet("专业")?.let { sheet ->
            sheet.map { row -> row.map { cell -> cell.stringCellValue } }
        }
        val classes = workbook?.getSheet("班级")?.let { sheet ->
            sheet.map { row -> row.map { cell -> cell.stringCellValue } }
        }
        val admins = workbook?.getSheet("管理员")?.let { sheet ->
            sheet.map { row -> row.map { cell -> cell.stringCellValue } }
        }
        val teachers = workbook?.getSheet("教师")?.let { sheet ->
            sheet.map { row -> row.map { cell -> cell.stringCellValue } }
        }
        val students = workbook?.getSheet("学生")?.let { sheet ->
            sheet.map { row -> row.map { cell -> cell.stringCellValue } }
        }


    }


}