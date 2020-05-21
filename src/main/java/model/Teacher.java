package model;

import java.text.MessageFormat;

@Model("teacher")
public class Teacher {
    @Field("id")
    private String id;

    @Field("name")
    private String name;

    @Field("person_id")
    private String personId;

    @Field("collage")
    @ForeignKey("id")
    private Collage collage;

    public Teacher() { }

    public Teacher(String id, String name, String personId, Collage collage) {
        this.id = id;
        this.name = name;
        this.personId = personId;
        this.collage = collage;
    }

    public Collage getCollage() {
        return collage;
    }

    public void setCollage(Collage collage) {
        this.collage = collage;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    @Override
    public String toString() {
        return MessageFormat.format("Teacher'{'id=''{0}'', name=''{1}'', personId=''{2}'', collage={3}'}'", id, name, personId, collage);
    }
}
