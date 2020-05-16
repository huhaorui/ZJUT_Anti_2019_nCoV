package model;

public class Person implements HealthCodeTester {
    private String uid;
    private String name;
    private String PersonId;

    public Person(String uid, String name, String personId) {
        this.uid = uid;
        this.name = name;
        PersonId = personId;
    }

    public String getPersonId() {
        return PersonId;
    }

    public void setPersonId(String personId) {
        PersonId = personId;
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
        if (this instanceof Student) {

        } else if (this instanceof Teacher) {

        } else {

        }
        return new PunchRecord[0];
    }
}
