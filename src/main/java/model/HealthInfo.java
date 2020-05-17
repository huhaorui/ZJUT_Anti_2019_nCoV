package model;

@Model("health_info")
public class HealthInfo {
    public HealthInfo(Person person, String tel, boolean danger14, boolean abroad14, boolean touchIllness14, boolean ill, int status) {
        this.person = person;
        this.tel = tel;
        this.danger14 = danger14;
        this.abroad14 = abroad14;
        this.touchIllness14 = touchIllness14;
        this.ill = ill;
        this.status = new Status(status);
    }

    @Field("uid")
    private Person person;

    @Field("tel")
    private String tel;

    @Field("if_danger_14")
    private boolean danger14;

    @Field("if_abroad_14")
    private boolean abroad14;

    @Field("if_touch_illness_14")
    private boolean touchIllness14;

    @Field("if_ill")
    private boolean ill;

    @Field("status")
    private Status status;

    public CodeColor getCodeColor() {
        var codeColor = CodeColor.GREEN;
        var abnormalCount = getStatus().getAbnormalCount();

        if (danger14 || abroad14 || abnormalCount == 1) {
            codeColor = CodeColor.YELLOW;
        }

        if (touchIllness14 || ill || abnormalCount >= 2) {
            codeColor = CodeColor.RED;
        }

        return codeColor;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public boolean isDanger14() {
        return danger14;
    }

    public void setDanger14(boolean danger14) {
        this.danger14 = danger14;
    }

    public boolean isAbroad14() {
        return abroad14;
    }

    public void setAbroad14(boolean abroad14) {
        this.abroad14 = abroad14;
    }

    public boolean isTouchIllness14() {
        return touchIllness14;
    }

    public void setTouchIllness14(boolean touchIllness14) {
        this.touchIllness14 = touchIllness14;
    }

    public boolean isIll() {
        return ill;
    }

    public void setIll(boolean ill) {
        this.ill = ill;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}

class Status {
    private boolean fever = false;
    private boolean weak = false;
    private boolean cough = false;
    private boolean stuffyNose = false;
    private boolean runnyNose = false;
    private boolean soreThroat = false;
    private boolean diarrhea = false;

    public Status(int status) {
        if ((status & 0b1000000) == 0b1000000) fever = true;

        if ((status & 0b0100000) == 0b0100000) weak = true;

        if ((status & 0b0010000) == 0b0010000) cough = true;

        if ((status & 0b0001000) == 0b0001000) stuffyNose = true;

        if ((status & 0b0000100) == 0b0000100) runnyNose = true;

        if ((status & 0b0000010) == 0b0000010) soreThroat = true;

        if ((status & 0b0000001) == 0b0000001) diarrhea = true;
    }

    public int getAbnormalCount() {
        int count = 0;
        if (fever) count++;
        if (weak) count++;
        if (cough) count++;
        if (stuffyNose) count++;
        if (runnyNose) count++;
        if (soreThroat) count++;
        if (diarrhea) count++;

        return count;
    }
}

enum CodeColor {
    RED(255, 0, 0), YELLOW(255, 255, 0), GREEN(0, 255, 0);

    int r, g, b;

    CodeColor(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }
}

interface HealthCodeTester {
    CodeColor getCodeColor();

    HealthInfo getHealthInfo();

    PunchRecord[] getPunchRecords();
}