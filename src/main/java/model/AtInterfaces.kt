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