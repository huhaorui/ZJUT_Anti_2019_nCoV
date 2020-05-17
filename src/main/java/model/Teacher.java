package model;

public class Teacher extends Person {
    @Field("collage")
    private Collage collage;

    public Teacher(String uid, String name, String personId, Collage collage) {
        super(uid, name, personId);
        this.collage = collage;
    }

    public Collage getCollage() {
        return collage;
    }

    public void setCollage(Collage collage) {
        this.collage = collage;
    }
}
