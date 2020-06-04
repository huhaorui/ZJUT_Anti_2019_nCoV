package model;

import java.text.MessageFormat;

@Model("major")
public class Major {
    @Field("id")
    @PrimaryKey
    private Integer id;

    @Field("name")
    private String name;

    @Field("collage")
    @ForeignKey("id")
    private Collage collage;

    public Major() {
    }

    public Major(Integer id, String name, Collage collage) {
        this.id = id;
        this.name = name;
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
        return MessageFormat.format("Major'{'id={0}, name=''{1}'', collage={2}'}'", id, name, collage);
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
