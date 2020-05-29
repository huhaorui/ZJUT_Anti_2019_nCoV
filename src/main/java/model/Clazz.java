package model;

import java.text.MessageFormat;
import java.util.Formatter;

@Model("class")
public class Clazz {
    @Field("id")
    private Integer id;

    @Field("name")
    private String name;

    @Field("major")
    @ForeignKey("id")
    private Major major;

    public Clazz() {
    }

    public Clazz(Integer id, String name, Major major) {
        this.id = id;
        this.name = name;
        this.major = major;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
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
