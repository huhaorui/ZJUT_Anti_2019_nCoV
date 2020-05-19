package model

import conn.DatabaseProvider
import java.sql.Date
import java.sql.SQLException
import java.sql.Time
import java.util.*

class SQL {
    enum class TYPE(type: Class<*>) {
        STRING(String::class.java), INT(Int::class.java), DATE(Date::class.java), TIME(Time::class.java), ANY(ANY::class.java);
    }

    fun Class<*>.type() = when (this) {
        String::class.java -> TYPE.STRING
        Int::class.java -> TYPE.INT
        Date::class.java -> TYPE.DATE
        Time::class.java -> TYPE.TIME
        else -> TYPE.ANY
    }

    fun <T> query(clazz: Class<T>, col: String, value: String): T? {
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value
//        val fields = clazz.fields()
//                .map { it.getAnnotationsByType(Field::class.java) }
//                .filter { it.isNotEmpty() }
//                .map { it[0].value }

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col !in fields.map { it.second }) {
            return null
        }

        var instance: T? = null
        try {
            val ps = DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?")
            ps.setString(1, value)
            val rs = ps.executeQuery()
            if (rs.next()) {
                val constructor = clazz.getConstructor()
                constructor.isAccessible = true
                instance = constructor.newInstance()
                for (field in fields) {
                    val type = field.first
                    type.isAccessible = true
                    val name = field.second
                    type.set(instance, when {
                        type.type == String::class.java -> rs.getString(name)
                        type.type == Int::class.java -> rs.getInt(name)
                        type.type == Date::class.java -> rs.getDate(name)
                        type.type == Time::class.java -> rs.getTime(name)
                        type.type.isPerson() -> query(type.type, "uid", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        else -> rs.getObject(name)
                    })
                }
            }

            rs.close()
            ps.close()

            return instance
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

//    fun <T> query(clazz: Class<T>, col: String, value: Int): T? {
//        // FIXME
//        val models = clazz.getAnnotationsByType(Model::class.java)
//        if (models.isEmpty()) {
//            return null
//        }
//        val model: String = models[0].value
//        val fields = clazz.fields().map { it.getAnnotationsByType(Field::class.java) }.filter { it.isNotEmpty() }.map { it[0].value }
//        if (col !in fields) {
//            return null
//        }
//        try {
//            val ps = DatabaseProvider.getConn().prepareStatement("select * from ? where ? = ?")
//            ps.setString(1, model)
//            ps.setString(2, col)
//            ps.setInt(3, value)
//            val rs = ps.executeQuery()
//            if (rs.next()) {
//                for (field in fields) {
//
//                }
//            }
//        } catch (e: SQLException) {
//            e.printStackTrace()
//        }
//        return null
//    }

    private fun Class<*>.fields(): HashSet<java.lang.reflect.Field> {
        var clazz = this
        val fields = HashSet<java.lang.reflect.Field>()
        while (clazz != Any::class.java) {
            fields.addAll(listOf(*clazz.declaredFields))
            clazz = clazz.superclass
        }
        return fields
    }

    private fun Class<*>.isPerson(): Boolean {
        var clazz = this
        while (clazz != Any::class.java) {
            if (clazz == Person::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }

    private fun Class<*>.isDepartment(): Boolean {
        var clazz = this
        while (clazz != Any::class.java) {
            if (clazz == Department::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }
}