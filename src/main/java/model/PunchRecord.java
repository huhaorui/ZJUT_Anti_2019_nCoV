package model;

import java.sql.Date;
import java.sql.Time;

@Model("punch_record")
public class PunchRecord {

    @Field("uid")
    private Person person;

    @Field("date")
    private Date date;

    @Field("time")
    private Time time;

    @Field("status")
    private Status status;

    public PunchRecord() {

    }

    public PunchRecord(Person person, Date date, Time time, int status) {
        this.person = person;
        this.date = date;
        this.time = time;
        this.status = new Status(status);
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
