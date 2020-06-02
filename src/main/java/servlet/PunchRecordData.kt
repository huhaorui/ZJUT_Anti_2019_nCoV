package servlet

import model.*
import java.sql.Date as SqlDate

object PunchRecordData {
    private val sql = SQL()
    fun byDateAll(date: SqlDate = SqlDate(System.currentTimeMillis())): Map<Collage, List<PunchRecord>> {
        return sql.queryList(PunchRecord::class.java, "date" to date).groupBy { it.person.collage }
    }

    fun byDateAndCollage(collage: Collage, date: SqlDate = SqlDate(System.currentTimeMillis())): Map<Int, List<PunchRecord>> {
        return sql.queryList(PunchRecord::class.java, "date" to date).filter { it.person.collage == collage }.groupBy { it.person.type }
    }

    fun overViewData(collage: Collage, date: SqlDate = SqlDate(System.currentTimeMillis())): List<OverView> {
        val records = sql.queryList(PunchRecord::class.java, "date" to date)
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java).filter { it.collage == collage }
        return persons.map {
            OverView(it, healthInfos.firstOrNull { info -> info.person == it }, records.firstOrNull { record -> record.person == it })
        }
    }

    fun overViewDataAll(date: SqlDate = SqlDate(System.currentTimeMillis())): List<OverView> {
        val records = sql.queryList(PunchRecord::class.java, "date" to date)
        val healthInfos = sql.queryList(HealthInfo::class.java)
        val persons = sql.queryList(Person::class.java)
        return persons.map {
            OverView(it, healthInfos.firstOrNull { info -> info.person == it }, records.firstOrNull { record -> record.person == it })
        }
    }

    class OverView(val person: Person, val healthInfo: HealthInfo?, val punchRecord: PunchRecord?)
}