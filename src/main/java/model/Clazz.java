package model;

@Model("class")
public class Clazz extends Department {
    private Major major;

    @Field("major")
    private String majorId;

    @Field("collage")
    private String collageId;

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
