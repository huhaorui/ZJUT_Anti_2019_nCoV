package servlet

import model.*
import org.apache.poi.ss.usermodel.Color
import org.apache.poi.ss.usermodel.IndexedColors
import org.apache.poi.xssf.usermodel.DefaultIndexedColorMap
import org.apache.poi.xssf.usermodel.XSSFColor
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.sql.Date as SqlDate

object PunchRecordData {
    private val sql = SQL()

    fun allGroupCollage(date: SqlDate = SqlDate(System.currentTimeMillis())): Map<Collage, List<PunchRecord>> {
        return sql.queryList(PunchRecord::class.java, "date" to date)
                .groupBy { it.getPerson()?.collage ?: Collage() }
    }

    fun allGroupType(collage: Collage, date: SqlDate = SqlDate(System.currentTimeMillis())): Map<Int, List<PunchRecord>> {
        return sql.queryList(PunchRecord::class.java, "date" to date)
                .filter { it.getPerson()?.collage == collage }
                .groupBy { it.getPerson()?.type ?: -1 }
    }

    fun majorOfCollage(collage: Int): ArrayList<Major> {
        return sql.queryList(Major::class.java, "collage" to collage)
    }

    fun classOfMajor(major: Int): ArrayList<Clazz> {
        return sql.queryList(Clazz::class.java, "major" to major)
    }

    fun studentOfClass(clazz: Int): ArrayList<Student> {
        return sql.queryList(Student::class.java, "class" to clazz)
    }

    fun teacherOfCollage(collage: Int): ArrayList<Teacher> {
        return sql.queryList(Teacher::class.java, "collage" to collage)
    }

    fun healthViewAll(): List<HealthView> {
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java).apply { sortBy { it.uid } }.apply { sortBy { it.uid } }
        return persons.map { HealthView(it, healthInfos.firstOrNull { info -> info.person == it.uid }) }
    }

    fun punchViewAll(date: SqlDate = SqlDate(System.currentTimeMillis())): List<PunchView> {
        val punchRecords = sql.queryList(PunchRecord::class.java, "date" to date)
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java).apply { sortBy { it.uid } }
        return persons.map { PunchView(it, healthInfos.firstOrNull { info -> info.person == it.uid }, punchRecords.firstOrNull { record -> record.person == it.uid }) }
    }

    fun healthViewByCollage(collage: String): List<HealthView> {
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java, "collage" to collage.toIntOrDefault()).apply { sortBy { it.uid } }
        return persons.map { HealthView(it, healthInfos.firstOrNull { info -> info.person == it.uid }) }
    }

    fun punchViewByCollage(collage: String, date: SqlDate = SqlDate(System.currentTimeMillis())): List<PunchView> {
        val punchRecords = sql.queryList(PunchRecord::class.java, "date" to date)
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java, "collage" to collage.toIntOrDefault()).apply { sortBy { it.uid } }
        return persons.map { PunchView(it, healthInfos.firstOrNull { info -> info.person == it.uid }, punchRecords.firstOrNull { record -> record.person == it.uid }) }
    }

    fun healthViewByCollage(collage: Collage): List<HealthView> {
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java, "collage" to collage.id)
        return persons.map {
            HealthView(it, healthInfos.firstOrNull { info -> info.person == it.uid })
        }
    }

    @JvmStatic
    fun availableCollage(admin: Admin?): List<Collage> {
        when (admin?.fullTarget?.level) {
            FullTarget.Level.SYSTEM, FullTarget.Level.SCHOOL -> return SQL().queryList(Collage::class.java)
            FullTarget.Level.COLLAGE -> admin.fullTarget.target?.let { return listOf(it) } ?: return arrayListOf()
            FullTarget.Level.NULL, null -> return ArrayList()
        }
    }

    fun List<HealthView>.healthInfo(): List<Map<String, String>> {
        return map {
            val person = it.person
            val healthInfo = it.healthInfo
            val collage = person.collage
            val uid = person.uid
            val name = person.name
            val code = healthInfo?.codeColor?.toString() ?: "lightgray"
            val info = when {
                healthInfo == null -> "未申报"
                code == "green" -> "已经是绿码"
                else -> "健康状况异常"
            }
            mapOf("collage" to collage.name, "uid" to uid, "name" to name, "code" to code, "info" to info)
        }
    }

    fun List<PunchView>.punchInfo(): List<Map<String, String>> {
        return map {
            val person = it.person
            val punchRecord = it.punchRecord
            val healthInfo = it.healthInfo
            val collage = person.collage
            val uid = person.uid
            val name = person.name
            var code = punchRecord?.color
            val info = when {
                healthInfo == null -> {
                    code = "lightgray"
                    "未申报"
                }
                healthInfo.codeColor == CodeColor.GREEN -> {
                    code = "aquamarine"
                    "已经是绿码"
                }
                punchRecord == null -> {
                    code = "wheat"
                    "当天未打卡"
                }
                punchRecord.color != "green" -> "当天健康状况异常"
                else -> "当天健康状况正常"
            }
            mapOf("collage" to collage.name, "uid" to uid, "name" to name, "code" to code.toString(), "info" to info)
        }
    }

    fun List<PunchView>.exportPunchView(): XSSFWorkbook {
        val map = punchInfo()
        val header = listOf("collage" to "学院", "uid" to "工号/学号", "name" to "姓名", "code" to "打卡状况", "info" to "备注")
        val workbook = XSSFWorkbook()
        val sheet = workbook.createSheet("数据")
        sheet.createRow(0).let {
            header.forEachIndexed { index, value ->
                it.createCell(index).setCellValue(value.second)
            }
        }

        for (index in 1..size) {
            val row = map[index - 1]
            sheet.createRow(index).let {
                header.forEachIndexed { index, value ->
                    if (value.first == "code") {
                        it.createCell(index).also {
                            when (row[value.first]) {
                                "red" -> it.setCellValue("红色")
                                "yellow" -> it.setCellValue("黄色")
                                "green" -> it.setCellValue("绿色")
                                "wheat" -> it.setCellValue("未打卡")
                                "lightgray" -> it.setCellValue("未申报")
                                "aquamarine" -> it.setCellValue("无需打卡")
                                else -> it.setCellValue("其他")
                            }
                        }
                    } else {
                        it.createCell(index).also { it.setCellValue(row[value.first]) }
                    }
                }
            }
        }

        sheet.defaultColumnWidth = 30

        return workbook
    }

    fun List<HealthView>.exportHealthView(): XSSFWorkbook {
        val map = healthInfo()
        val header = listOf("collage" to "学院", "uid" to "工号/学号", "name" to "姓名", "code" to "健康码颜色", "info" to "备注")
        val workbook = XSSFWorkbook()
        val sheet = workbook.createSheet("数据")
        sheet.createRow(0).let {
            header.forEachIndexed { index, value ->
                it.createCell(index).setCellValue(value.second)
            }
        }

        for (index in 1..size) {
            val row = map[index - 1]
            sheet.createRow(index).let {
                header.forEachIndexed { index, value ->
                    if (value.first == "code") {
                        it.createCell(index).also {
                            when (row[value.first]) {
                                "red" -> it.setCellValue("红色")
                                "yellow" -> it.setCellValue("黄色")
                                "green" -> it.setCellValue("绿色")
                                "wheat" -> it.setCellValue("未打卡")
                                "lightgray" -> it.setCellValue("未申报")
                                "aquamarine" -> it.setCellValue("无需打卡")
                                else -> it.setCellValue("其他")
                            }
                        }
                    } else {
                        it.createCell(index).also { it.setCellValue(row[value.first]) }
                    }

                }
            }
        }

        sheet.defaultColumnWidth = 30

        return workbook
    }

    class HealthView(val person: Person, val healthInfo: HealthInfo?)

    class PunchView(val person: Person, val healthInfo: HealthInfo?, val punchRecord: PunchRecord?)

    fun String.toIntOrDefault(value: Int = -1): Int {
        return toIntOrNull() ?: value
    }

}