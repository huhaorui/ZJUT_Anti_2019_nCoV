package model;

import java.text.MessageFormat;

@Model("student")
public class Student extends Person {
    @Field("class")
    private Clazz clazz;

    public Student() { }

    @Override
    public String toString() {
        return MessageFormat.format("Student'{'clazz={0}'}' {1}", clazz, super.toString());
    }

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

}
