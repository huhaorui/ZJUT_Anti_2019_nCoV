package model;

import java.text.MessageFormat;

public class Department {
    @Field("id")
    private Integer id;

    @Field("name")
    private String name;

    public Department() {
        super();
    }

    @Override
    public String toString() {
        return MessageFormat.format("'{'id={0}, name=''{1}'''}'", id, name);
    }

    public Department(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
