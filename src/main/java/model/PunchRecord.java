package model;

import java.sql.Date;
import java.sql.Time;
import java.text.MessageFormat;

@Model("punch_record")
public class PunchRecord {

    @Field("uid")
    @ForeignKey("id")
    @PrimaryKey
    private Person person;

    @Field("date")
    @PrimaryKey
    private Date date;

    @Field("time")
    private Time time;

    @Field("status")
    private Integer status;

    public PunchRecord() { }

    public PunchRecord(Person person, Date date, Time time, Integer status) {
        this.person = person;
        this.date = date;
        this.time = time;
        this.status = status;
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
        return new Status(status);
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return MessageFormat.format("PunchRecord'{'person={0}, date={1}, time={2}, status={3}'}'", person, date, time, new Status(status));
    }
}
