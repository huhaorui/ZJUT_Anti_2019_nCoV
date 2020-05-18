package model;

@Model("collage")
public class Collage extends Department {

    public Collage(String id, String name) {
        super(id, name);
    }

    public Collage() { }

    @Override
    public String toString() {
        return super.toString();
    }
}
