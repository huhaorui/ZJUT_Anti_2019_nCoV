package model;

import kotlin.Pair;

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
    private Integer collage;

    @Field("major")
    private Integer major;

    @Field("class")
    private Integer clazz;

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
        return new SQL().query(Collage.class, new Pair<String, Integer>("id", collage));
    }

    public void setCollage(Collage collage) {
        this.collage = collage.getId();
    }

    public Major getMajor() {
        return new SQL().query(Major.class, new Pair<String, Integer>("id", major));
    }

    public void setMajor(Major major) {
        this.major = major.getId();
    }

    public Clazz getClazz() {
        return new SQL().query(Clazz.class, new Pair<String, Integer>("id", clazz));
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz.getId();
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
        return Objects.equals(uid, person.uid);
    }

    @Override
    public String toString() {
        return MessageFormat.format("Person'{'uid=''{0}'', name=''{1}'', personId=''{2}'', collage={3}, major={4}, clazz={5}, type=''{6}'''}'", uid, name, personId, collage, major, clazz, type == 0 ? "学生" : "教师");
    }
}