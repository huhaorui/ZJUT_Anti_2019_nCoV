package model;

import java.sql.Date;
import java.sql.Time;

public class Record {
    private String id;


    private Date date;


    private Time time;


    private Integer status;


    private String color;

    public Record(String id, Date date, Time time, Integer status, String color) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.status = status;
        this.color = color;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
