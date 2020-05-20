package model;

@Model("class")
public class Clazz extends Department {
    @Field("major")
    private Major major;

    public Clazz() { }

    public Clazz(Integer id, String name, Major major) {
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
