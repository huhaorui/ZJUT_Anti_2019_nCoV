package model;

import java.text.MessageFormat;

@Model("teacher")
public class Teacher extends Person {
    @Field("collage")
    private Collage collage;

    public Teacher() { }

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

    @Override
    public String toString() {
        return MessageFormat.format("Teacher'{'collage={0}'}' {1}", collage, super.toString());
    }
}
