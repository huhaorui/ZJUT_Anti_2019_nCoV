package model;

@Model("class")
public class Clazz extends Department {
    @Field("major")
    private Major major;

    @Field("collage")
    private Collage collage;

    public Clazz() { }

    public Clazz(String id, String name, Major major) {
        super(id, name);
        this.major = major;
        this.collage = major.getCollage();
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Collage getCollage() {
        return collage;
    }

    public void setCollage(Collage collage) {
        this.collage = collage;
    }
}
