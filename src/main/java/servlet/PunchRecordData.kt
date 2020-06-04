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

    fun overViewDataByAdmin(admin: Admin, collage: Collage? = null, date: SqlDate = SqlDate(System.currentTimeMillis())): List<OverView> {
        val overViews = ArrayList<OverView>()
        val collages = availableCollage(admin)
        if (collage == null) {
            collages.forEach {
                overViews.addAll(overViewData(it, date))
            }
        } else if (collage in availableCollage(admin)) {
            overViews.addAll(overViewData(collage))
        }
        return overViews
    }

    @JvmStatic
    fun overViewDataByAdmin(admin: Admin?, collage: Collage? = null): List<OverView> {
        if (admin == null) {
            return ArrayList()
        }
        val overViews = ArrayList<OverView>()
        val collages = availableCollage(admin)
        if (collage == null) {
            collages.forEach {
                overViews.addAll(overViewData(it))
            }
        } else if (collage in availableCollage(admin)) {
            overViews.addAll(overViewData(collage))
        }
        return overViews
    }

    @JvmStatic
    fun availableCollage(admin: Admin?): ArrayList<Collage> {
        if (admin == null) {
            return ArrayList()
        }
        val fullTarget = admin.fullTarget
        when (fullTarget.level) {
            FullTarget.Level.SYSTEM, FullTarget.Level.SCHOOL -> {
                return SQL().queryList(Collage::class.java)
            }
            FullTarget.Level.COLLAGE -> {
                val list = ArrayList<Collage>()
                val collage = admin.fullTarget.target
                if (collage != null) {
                    list.add(collage)
                }
                return list
            }
            FullTarget.Level.NULL -> {
                return ArrayList()
            }
        }
    }

    class OverView(val person: Person, val healthInfo: HealthInfo?, val punchRecord: PunchRecord?)
}