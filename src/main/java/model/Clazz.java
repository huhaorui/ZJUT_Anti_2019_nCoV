package model;

import java.text.MessageFormat;

@Model("class")
public class Clazz extends Department {
    @Field("major")
    @ForeignKey("id")
    private Major major;

    public Clazz() {
    }

    public Clazz(Integer id, String name, Major major) {
        super(id, name);
        this.major = major;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    @Override
    public String toString() {
        return MessageFormat.format("Clazz'{'major={0}'}' {1}", major, super.toString());
    }
}
