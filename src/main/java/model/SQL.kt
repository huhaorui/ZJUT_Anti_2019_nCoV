package model

import conn.DatabaseProvider
import java.sql.*
import java.sql.Date
import java.util.*
import kotlin.collections.ArrayList

class SQL {
    enum class TYPE(type: Class<*>) {
        STRING(String::class.java), INT(Int::class.java), INTEGER(Integer::class.java), DATE(Date::class.java), TIME(Time::class.java), BOOLEAN(Boolean::class.java), ANY(ANY::class.java);
    }

    private fun Class<*>.type() = when (this) {
        String::class.java -> TYPE.STRING
        Boolean::class.java -> TYPE.BOOLEAN
        Int::class.java, Integer::class.java -> TYPE.INT
        Date::class.java -> TYPE.DATE
        Time::class.java -> TYPE.TIME
        else -> TYPE.ANY
    }

    @Deprecated("")
    fun <T> query(clazz: Class<T>, col: String, value: String): T? {
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value

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
                instance = instance(clazz, fields, rs)
            }
            rs.close()
            ps.close()

            return instance
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    fun <T, K> query(clazz: Class<T>, pair: Pair<String, K>?): T? {
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        val col = pair?.first
        val value = pair?.second

        if (col != null && value != null && col !in fields.map { it.second }) {
            return null
        }

        var instance: T? = null
        try {
            val ps = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ? limit 1").apply { setObject(1, value) }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model limit 1")
            }
            val rs = ps.executeQuery()
            if (rs.next()) {
                instance = instance(clazz, fields, rs)
            }

            rs.close()
            ps.close()

            return instance
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    @Deprecated("")
    fun <T> query(clazz: Class<T>, col: String, value: Date): T? {
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return null
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col !in fields.map { it.second }) {
            return null
        }

        var instance: T? = null
        try {
            val ps = DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?")
            ps.setDate(1, value)
            val rs = ps.executeQuery()
            if (rs.next()) {
                instance = instance(clazz, fields, rs)
            }
            rs.close()
            ps.close()
            return instance
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    @Deprecated("")
    fun <T> query(clazz: Class<T>): ArrayList<T> {
        val list = ArrayList<T>()
        val models = clazz.getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) {
            return list
        }
        val model: String = models[0].value
        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        try {
            val ps: PreparedStatement = DatabaseProvider.getConn().prepareStatement("select * from $model")
            val rs = ps.executeQuery()
            while (rs.next()) {
                list.add(instance(clazz, fields, rs))
            }
            rs.close()
            ps.close()
            return list
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return list
    }

    fun <T, K> queryList(clazz: Class<T>, pair: Pair<String, K>?): ArrayList<T> {
        val list = ArrayList<T>()
        val models = clazz.getAnnotationsByType(Model::class.java)

        val col = pair?.first
        val value = pair?.second

        if (models.isEmpty()) {
            return list
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col != null && value != null && col !in fields.map { it.second }) {
            return list
        }

        try {
            val ps: PreparedStatement = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?").apply {
                    setObject(1, value)
                }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model")
            }
            val rs = ps.executeQuery()
            while (rs.next()) {
                val instance = instance(clazz, fields, rs)
                list.add(instance)
            }

            rs.close()
            ps.close()

            return list
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return list
    }

    private fun <T> instance(clazz: Class<T>, fields: List<Pair<java.lang.reflect.Field, String?>>, rs: ResultSet): T {
        val constructor = clazz.getConstructor()
        constructor.isAccessible = true
        val instance = constructor.newInstance()
        for (field in fields) {
            val type = field.first
            type.isAccessible = true
            val name = field.second
            type.set(instance, when {
                type.type == String::class.java -> rs.getString(name)
                type.type == Integer::class.java || type.type == Int::class.java -> rs.getInt(name)
                type.type == Date::class.java -> rs.getDate(name)
                type.type == Time::class.java -> rs.getTime(name)
                type.type == Boolean::class.java -> rs.getInt(name) != 0
                type.type.isPerson() -> query(type.type, "id" to rs.getString(name))
                type.type.isDepartment() -> query(type.type, "id" to rs.getInt(name))
                else -> rs.getObject(name)
            })
        }
        return instance
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

    private fun Class<*>.isPerson(): Boolean {
        var clazz: Class<*>? = this
        while (clazz != null && clazz != Any::class.java) {
            if (clazz == Person::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }

    private fun Class<*>.isDepartment(): Boolean {
        var clazz: Class<*>? = this
        while (clazz != null && clazz != Any::class.java) {
            if (clazz == Department::class.java) return true
            clazz = clazz.superclass
        }
        return false
    }
}