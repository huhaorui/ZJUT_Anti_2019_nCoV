package model;

public class Student extends Person {
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

}
