package model;

import java.text.MessageFormat;
import java.util.Objects;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Collage collage = (Collage) o;

        return Objects.equals(id, collage.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
