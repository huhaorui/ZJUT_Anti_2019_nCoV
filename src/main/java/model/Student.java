package model;

import com.google.zxing.qrcode.decoder.Mode;

import java.lang.annotation.Annotation;

@Model("student")
public class Student extends Person implements Queryable {
    @Field("class")
    private Clazz clazz;

    public Student(String uid, String name, String personId, Clazz clazz) {
        super(uid, name, personId);
        this.clazz = clazz;
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    @Override
    public Person getById(String id) {
        Annotation[] annotations = Student.class.getAnnotations();
        return null;
    }
}
