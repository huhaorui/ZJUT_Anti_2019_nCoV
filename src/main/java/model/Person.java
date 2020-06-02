package model;

import java.text.MessageFormat;
import java.util.Objects;

@Model("view_person")
public class Person {
    @Field("id")
    @PrimaryKey
    private String uid;

    @Field("name")
    private String name;

    @Field("person_id")
    private String personId;

    @Field("collage")
    @ForeignKey("id")
    private Collage collage;

    @Field("major")
    @ForeignKey("id")
    private Major major;

    @Field("class")
    @ForeignKey("id")
    private Clazz clazz;

    @Field("type")
    private Integer type;

    public Person() {
    }

    public Person(String uid, String name, String personId) {
        this.uid = uid;
        this.name = name;
        this.personId = personId;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collage getCollage() {
        return collage;
    }

    public void setCollage(Collage collage) {
        this.collage = collage;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return Objects.equals(uid, person.uid) &&
                Objects.equals(name, person.name) &&
                Objects.equals(personId, person.personId);
    }

    @Override
    public String toString() {
        return MessageFormat.format("Person'{'uid=''{0}'', name=''{1}'', personId=''{2}'', collage={3}, major={4}, clazz={5}, type=''{6}'''}'", uid, name, personId, collage, major, clazz, type == 0 ? "学生" : "教师");
    }
}