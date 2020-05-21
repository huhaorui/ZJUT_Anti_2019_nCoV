package model;

import java.text.MessageFormat;

@Model("admin")
public class Admin {
    @Field("id")
    private String id;

    @Field("level")
    private String level;

    @Field("target")
    private String target;

    @Field("password")
    private String password;

    @Field("email")
    private String email;

    public Admin() { }

    @Override
    public String toString() {
        return MessageFormat.format("Admin'{'id=''{0}'', level=''{1}'', target=''{2}'', password=''{3}'', email=''{4}'''}'", id, level, target, password, email);
    }

    public Admin(String id, String level, String target, String password, String email) {
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
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
