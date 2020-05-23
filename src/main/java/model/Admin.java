package model;

import java.text.MessageFormat;
import java.util.Objects;

@Model("admin")
public class Admin {
    @Field("id")
    private String id;

    @Field("level")
    private int level;

    @Field("target")
    private String target;

    @Field("password")
    private String password;

    @Field("email")
    private String email;

    public Admin() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Admin admin = (Admin) o;
        return level == admin.level &&
                Objects.equals(id, admin.id) &&
                Objects.equals(target, admin.target) &&
                Objects.equals(password, admin.password) &&
                Objects.equals(email, admin.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, level, target, password, email);
    }

    @Override
    public String toString() {
        return MessageFormat.format("Admin'{'id=''{0}'', level=''{1}'', target=''{2}'', password=''{3}'', email=''{4}'''}'", id, level, target, password, email);
    }

    public Admin(String id, int level, String target, String password, String email) {
        this.id = id;
        this.level = level;
        this.target = target;
        this.password = password;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
