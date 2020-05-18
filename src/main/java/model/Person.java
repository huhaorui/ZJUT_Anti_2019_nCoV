package model;

public class Person implements HealthCodeTester {
    @Field("id")
    private String uid;
    @Field("name")
    private String name;
    @Field("person_id")
    private String personId;

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

    @Override
    public CodeColor getCodeColor() {
        // TODO: 2020/5/17

        var healthInfo = getHealthInfo();

        var cardColor = healthInfo.getCodeColor();
        var punchRecords = getPunchRecords();

        for (var record : punchRecords) {

        }

        return null;
    }

    @Override
    public HealthInfo getHealthInfo() {
        // TODO: 2020/5/17

        return null;
    }

    @Override
    public PunchRecord[] getPunchRecords() {
        // TODO: 2020/5/17
        return new PunchRecord[0];
    }

    public Boolean login(String id, String name, String password) {
        if (this instanceof Student) {

        } else if (this instanceof Teacher) {

        } else {

        }

        return false;
    }

    @Override
    public String toString() {
        return "Person{" +
                "uid='" + uid + '\'' +
                ", name='" + name + '\'' +
                ", personId='" + personId + '\'' +
                '}';
    }
}