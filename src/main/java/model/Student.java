package model;

@Model("student")
public class Student extends Person {
    @Field("class")
    private Clazz clazz;

    @Field("major")
    private Major major;


    @Field("collage")
    private Collage collage;

    public Student(String uid, String name, String personId, Clazz clazz) {
        super(uid, name, personId);
        this.clazz = clazz;
        this.major = clazz.getMajor();
        this.collage = major.getCollage();
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
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
