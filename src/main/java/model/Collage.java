package model;

import java.text.MessageFormat;

@Model("collage")
@Cached
public class Collage {
    @Field("id")
    @PrimaryKey
    private Integer id;

    @Field("name")
    private String name;

    public Collage(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Collage() {
    }

    @Override
    public String toString() {
        return MessageFormat.format("Collage'{'id={0}, name=''{1}'''}'", id, name);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
