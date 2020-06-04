package model;

import kotlin.Pair;

import java.text.MessageFormat;

@Model("class")
@Cached
public class Clazz {
    @Field("id")
    @PrimaryKey
    private Integer id;

    @Field("name")
    private String name;

    @Field("major")
//    @ForeignKey("id")
    private Integer major;

    public Clazz() {
    }

    public Clazz(Integer id, String name, Major major) {
        this.id = id;
        this.name = name;
        this.major = major.getId();
    }

    public Major getMajor() {
        return new SQL().query(Major.class, new Pair<String, Integer>("id", major));
    }

    public void setMajor(Major major) {
        this.major = major.getId();
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

    @Override
    public String toString() {
        return MessageFormat.format("Clazz'{'id={0}, name=''{1}'', major={2}'}'", id, name, major);
    }
}
