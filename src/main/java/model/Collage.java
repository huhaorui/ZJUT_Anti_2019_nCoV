package model;

import java.text.MessageFormat;

@Model("collage")
public class Collage extends Department {

    public Collage(Integer id, String name) {
        super(id, name);
    }

    public Collage() { }

    @Override
    public String toString() {
        return MessageFormat.format("Collage{0}", super.toString());
    }
}
