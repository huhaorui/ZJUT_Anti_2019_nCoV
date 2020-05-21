package model

import conn.DatabaseProvider
import java.sql.*
import java.sql.Date
import java.util.*
import kotlin.collections.ArrayList

class SQL {
    fun <T, K> query(clazz: Class<T>, pair: Pair<String, K>?): T? {
        val table = clazz.model() ?: return null
        val model = table.first
        val fields = table.second
        val col = pair?.first
        val value = pair?.second

        if (col != null && value != null && col !in fields.map { it.second }) return null

        var instance: T? = null
        try {
            val ps = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ? limit 1").apply { setObject(1, value) }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model limit 1")
            }
            val rs = ps.executeQuery()
            if (rs.next())
                instance = instance(clazz, fields, rs)

            rs.close()
            ps.close()

            return instance
        } catch (e: SQLException) {
            e.printStackTrace()
        }
        return null
    }

    fun <T, K> queryList(clazz: Class<T>, pair: Pair<String, K>?): ArrayList<T> {
        val list = ArrayList<T>()

        val table = clazz.model() ?: return list
        val model = table.first
        val fields = table.second
        val col = pair?.first
        val value = pair?.second

        if (col != null && value != null && col !in fields.map { it.second }) return list

        try {
            val ps: PreparedStatement = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?").apply { setObject(1, value) }
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
                type.type.extends(Person::class.java) -> clazz.fk(Person::class.java)?.let { query(type.type, it.first to rs.getString(name)) }
                type.type.extends(Department::class.java) -> clazz.fk(Department::class.java)?.let { query(type.type, it.first to rs.getInt(name)) }
                else -> rs.getObject(name)
            })
        }
        return instance
    }

    private fun <T> Class<T>.model(): Pair<String, List<Pair<java.lang.reflect.Field, String?>>>? {
        val models = getAnnotationsByType(Model::class.java)
        if (models.isEmpty()) return null

        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        return model to fields
    }

    private fun <T> Class<T>.fk(model: Class<*>): Pair<String, Class<*>>? {
        val fields = this.fields()
        for (field in fields) {
            if (field.type == model) {
                val fks = field.getAnnotationsByType(ForeignKey::class.java)
                val ref = fks.firstOrNull()?.let { it.value to model }
                if (ref != null) return ref
            }
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

    private fun Class<*>.extends(clazz2: Class<*>): Boolean {
        var clazz: Class<*>? = this
        while (clazz != null && clazz != Any::class.java) {
            if (clazz == clazz2) return true
            clazz = clazz.superclass
        }
        return false
    }
}