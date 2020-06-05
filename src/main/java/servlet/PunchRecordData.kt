package servlet

import model.*
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


    fun healthViewAll(): List<HealthView> {
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java).apply { sortBy { it.uid } }.apply { sortBy { it.uid } }
        return persons.map { HealthView(it, healthInfos.firstOrNull { info -> info.person == it.uid }) }
    }

    fun healthViewByCollage(collage: String): List<HealthView> {
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java, "collage" to collage.toIntOrDefault()).apply { sortBy { it.uid } }
        return persons.map { HealthView(it, healthInfos.firstOrNull { info -> info.person == it.uid }) }
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
            val code = healthInfo?.codeColor
            val info = when {
                healthInfo == null -> "未进行健康申报"
                code == CodeColor.GREEN -> "已经是绿码"
                else -> ""
            }
            mapOf("collage" to collage.name, "uid" to uid, "name" to name, "code" to code.toString(), "info" to info)
        }
    }

    fun List<PunchView>.punchInfo(): List<Map<String, String>> {
        return map {
            val person = it.person
            val punchRecord = it.punchRecord
            val collage = person.collage
            val uid = person.uid
            val name = person.name
            val code = punchRecord?.color
            val info = when {
                code == "green" -> "已经是绿码"
                punchRecord == null -> "当天未打卡"
                else -> ""
            }
            mapOf("collage" to collage.name, "uid" to uid, "name" to name, "code" to code.toString(), "info" to info)
        }
    }

    class HealthView(val person: Person, val healthInfo: HealthInfo?)

    class PunchView(val person: Person, val punchRecord: PunchRecord?)

    private fun String.toIntOrDefault(value: Int = -1): Int {
        return toIntOrNull() ?: value
    }
}