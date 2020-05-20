package model

import conn.DatabaseProvider
import java.sql.Date
import java.sql.PreparedStatement
import java.sql.SQLException
import java.sql.Time
import java.util.*
import kotlin.collections.ArrayList

class SQL {
    enum class TYPE(type: Class<*>) {
        STRING(String::class.java), INT(Int::class.java), DATE(Date::class.java), TIME(Time::class.java), BOOLEAN(Boolean::class.java), ANY(ANY::class.java);
    }

    fun Class<*>.type() = when (this) {
        String::class.java -> TYPE.STRING
        Boolean::class.java -> TYPE.BOOLEAN
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
                        type.type == Boolean::class.java -> rs.getInt(name) != 0
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        type.type == Status::class.java -> Status(rs.getInt(name))
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

    fun <T> query(clazz: Class<T>, col: String, value: Int): T? {
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
            ps.setInt(1, value)
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
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
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
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
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
                val constructor = clazz.getConstructor()
                constructor.isAccessible = true
                val instance = constructor.newInstance()
                for (field in fields) {
                    val type = field.first
                    type.isAccessible = true
                    val name = field.second
                    type.set(instance, when {
                        type.type == String::class.java -> rs.getString(name)
                        type.type == Int::class.java -> rs.getInt(name)
                        type.type == Date::class.java -> rs.getDate(name)
                        type.type == Time::class.java -> rs.getTime(name)
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        else -> rs.getObject(name)
                    })
                }
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

    fun <T> queryWithString(clazz: Class<T>, col: String? = null, value: String? = null): ArrayList<T> {
        val list = ArrayList<T>()
        val models = clazz.getAnnotationsByType(Model::class.java)

        if (models.isEmpty()) {
            return list
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col != null && col !in fields.map { it.second }) {
            return list
        }

        try {
            val ps: PreparedStatement = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?").apply { setString(1, value) }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model")
            }
            val rs = ps.executeQuery()
            while (rs.next()) {
                val constructor = clazz.getConstructor()
                constructor.isAccessible = true
                val instance = constructor.newInstance()
                for (field in fields) {
                    val type = field.first
                    type.isAccessible = true
                    val name = field.second
                    type.set(instance, when {
                        type.type == String::class.java -> rs.getString(name)
                        type.type == Int::class.java -> rs.getInt(name)
                        type.type == Date::class.java -> rs.getDate(name)
                        type.type == Time::class.java -> rs.getTime(name)
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        else -> rs.getObject(name)
                    })
                }
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

    fun <T> queryWithInt(clazz: Class<T>, col: String? = null, value: Int? = null): ArrayList<T> {
        val list = ArrayList<T>()
        val models = clazz.getAnnotationsByType(Model::class.java)

        if (models.isEmpty()) {
            return list
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col != null && col !in fields.map { it.second }) {
            return list
        }

        try {
            val ps: PreparedStatement = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?").apply { setInt(1, value) }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model")
            }
            val rs = ps.executeQuery()
            while (rs.next()) {
                val constructor = clazz.getConstructor()
                constructor.isAccessible = true
                val instance = constructor.newInstance()
                for (field in fields) {
                    val type = field.first
                    type.isAccessible = true
                    val name = field.second
                    type.set(instance, when {
                        type.type == String::class.java -> rs.getString(name)
                        type.type == Int::class.java -> rs.getInt(name)
                        type.type == Date::class.java -> rs.getDate(name)
                        type.type == Time::class.java -> rs.getTime(name)
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        else -> rs.getObject(name)
                    })
                }
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

    fun <T> queryWithDate(clazz: Class<T>, col: String? = null, value: Date? = null): ArrayList<T> {
        val list = ArrayList<T>()
        val models = clazz.getAnnotationsByType(Model::class.java)

        if (models.isEmpty()) {
            return list
        }
        val model: String = models[0].value

        val fields: List<Pair<java.lang.reflect.Field, String?>> = clazz.fields().map { it to it.getAnnotationsByType(Field::class.java).firstOrNull()?.value }.filter { it.second != null }

        if (col != null && col !in fields.map { it.second }) {
            return list
        }

        try {
            val ps: PreparedStatement = if (col != null && value != null) {
                DatabaseProvider.getConn().prepareStatement("select * from $model where $col = ?").apply { setDate(1, value) }
            } else {
                DatabaseProvider.getConn().prepareStatement("select * from $model")
            }
            val rs = ps.executeQuery()
            while (rs.next()) {
                val constructor = clazz.getConstructor()
                constructor.isAccessible = true
                val instance = constructor.newInstance()
                for (field in fields) {
                    val type = field.first
                    type.isAccessible = true
                    val name = field.second
                    type.set(instance, when {
                        type.type == String::class.java -> rs.getString(name)
                        type.type == Int::class.java -> rs.getInt(name)
                        type.type == Date::class.java -> rs.getDate(name)
                        type.type == Time::class.java -> rs.getTime(name)
                        type.type.isPerson() -> query(type.type, "id", rs.getString(name))
                        type.type.isDepartment() -> query(type.type, "id", rs.getString(name))
                        else -> rs.getObject(name)
                    })
                }
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