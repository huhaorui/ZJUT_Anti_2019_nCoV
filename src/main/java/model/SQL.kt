package model

import conn.DatabaseProvider
import java.sql.Date
import java.sql.SQLException
import java.sql.Time
import java.util.*

class SQL {
    internal enum class TYPE(type: Class<*>) {
        STRING(String::class.java), INT(Int::class.java), DATE(Date::class.java), TIME(Time::class.java)
    }

    fun <T> query(clazz: Class<T>, col: String, value: String): T? {
        // FIXME
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value
        val fields = clazz.fields().map { it.getAnnotationsByType(Field::class.java) }.filter { it.isNotEmpty() }.map { it[0].value }
        if (col !in fields) {
            return null
        }
        try {
            val ps = DatabaseProvider.getConn().prepareStatement("select * from ? where ? = ?")
            ps.setString(1, model)
            ps.setString(2, col)
            ps.setString(3, value)
            val rs = ps.executeQuery()
            if (rs.next()) {
                for (field in fields) {

                }
            }
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    fun <T> query(clazz: Class<T>, col: String, value: Int): T? {
        // FIXME
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value
        val fields = clazz.fields().map { it.getAnnotationsByType(Field::class.java) }.filter { it.isNotEmpty() }.map { it[0].value }
        if (col !in fields) {
            return null
        }
        try {
            val ps = DatabaseProvider.getConn().prepareStatement("select * from ? where ? = ?")
            ps.setString(1, model)
            ps.setString(2, col)
            ps.setInt(3, value)
            val rs = ps.executeQuery()
            if (rs.next()) {
                for (field in fields) {

                }
            }
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    private fun Class<*>.fields(): HashSet<java.lang.reflect.Field> {
        var clazz = this
        val fields = HashSet<java.lang.reflect.Field>()
        while (clazz != Any::class.java) {
            fields.addAll(listOf(*clazz.declaredFields))
            clazz = clazz.superclass
        }
        return fields
    }

    fun Class<*>.isPerson(): Boolean {
        var clazz = this
        while (clazz != Any::class.java) {
            if (clazz == Person::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }

    fun Class<*>.isDepartment(): Boolean {
        var clazz = this
        while (clazz != Any::class.java) {
            if (clazz == Department::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }
}