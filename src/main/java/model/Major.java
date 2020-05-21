package model;

import java.text.MessageFormat;

@Model("major")
public class Major extends Department {

    @Field("collage")
    @ForeignKey("id")
    private Collage collage;

    public Major() {
    }

    public Major(Integer id, String name, Collage collage) {
        super(id, name);
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
        return MessageFormat.format("Major'{'collage={0}'}' {1}", collage, super.toString());
    }
}
