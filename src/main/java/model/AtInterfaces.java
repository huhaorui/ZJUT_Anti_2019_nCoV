package model;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
@Inherited
@interface Model {
    String value();
}

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
@Inherited
@interface Field {
    String value();
}