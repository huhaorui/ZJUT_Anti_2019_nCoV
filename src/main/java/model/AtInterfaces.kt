package model

import java.lang.annotation.Inherited

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.ANNOTATION_CLASS, AnnotationTarget.CLASS)
@Inherited
internal annotation class Model(val value: String)

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.FIELD)
@Inherited
internal annotation class Field(val value: String)

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.FIELD)
@Inherited
internal annotation class ForeignKey(val value: String)

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.FIELD)
@Inherited
internal annotation class PrimaryKey

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.FIELD)
@Inherited
internal annotation class AutoInc

@kotlin.annotation.Retention(AnnotationRetention.RUNTIME)
@Target(AnnotationTarget.FIELD)
@Inherited
internal annotation class View

interface SQLAble<T> {
    fun insert() : Boolean
    fun query(pair : Pair<String, Any>?) : T
    fun delete(pair : Pair<String, Any>?) : Long
    fun update(obj: T): Boolean
}