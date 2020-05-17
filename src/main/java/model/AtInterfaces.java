package model;

import java.lang.annotation.Inherited;

@interface Model {
    String value();
}

@Inherited
@interface Field {
    String value();
}

class SQL<T> {
    T get(String id) {
        
        return null;
    }
}
