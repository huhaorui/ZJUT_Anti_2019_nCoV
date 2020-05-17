package model;

@Model("collage")
public class Collage extends Department {

    public Collage(String id, String name) {
        super(id, name);
    }

    @Override
    public String toString() {
        return "Collage{} " + super.toString();
    }
}
