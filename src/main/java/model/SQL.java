package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.Collectors;

@SuppressWarnings("rawtypes")
public class SQL {
    public <T> T query(Class<T> clazz, String id) {
        var models = clazz.getAnnotationsByType(Model.class);
        if (models.length == 0) {
            return null;
        }
        var model = models[0].value();

        var fields = getFields(clazz).stream()
                .map(field -> field.getAnnotationsByType(Field.class))
                .filter(fields1 -> fields1.length > 0)
                .map(fields1 -> fields1[0].value())
                .collect(Collectors.toList());

        return null;
    }

    HashSet<java.lang.reflect.Field> getFields(Class clazz) {
        var fields = new HashSet<java.lang.reflect.Field>();
        while (clazz != Object.class) {
            fields.addAll(Arrays.asList(clazz.getDeclaredFields()));
            clazz = clazz.getSuperclass();
        }

        return fields;
    }

    boolean isPerson(Class clazz) {
        while (clazz != Object.class) {
            if (clazz == Person.class) return true;
            clazz = clazz.getSuperclass();
        }
        return false;
    }

    boolean isDepartment(Class clazz) {
        while (clazz != Object.class) {
            if (clazz == Department.class) return true;
            clazz = clazz.getSuperclass();
        }
        return false;
    }
}
