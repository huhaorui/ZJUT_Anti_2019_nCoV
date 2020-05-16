package model;

import java.sql.Date;
import java.sql.Time;

public class PunchRecord {
    private Person person;
    private Date date;
    private Time time;
    private Status status;

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
