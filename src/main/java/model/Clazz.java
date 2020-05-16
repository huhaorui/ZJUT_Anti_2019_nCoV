package model;

public class Clazz extends Department {

    private Major major;

    public Clazz(String id, String name, Major major) {
        super(id, name);
        this.major = major;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }
}
