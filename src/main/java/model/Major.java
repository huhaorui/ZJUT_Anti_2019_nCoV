package model;

@Model("major")
public class Major extends Department {

    @Field("collage")
    private Collage collage;

    public Major(String id, String name, Collage collage) {
        super(id, name);
        this.collage = collage;
    }

    public Collage getCollage() {
        return collage;
    }

    public void setCollage(Collage collage) {
        this.collage = collage;
    }
}
