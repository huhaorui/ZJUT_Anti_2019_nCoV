package model

import java.sql.Date
import java.sql.Time
import java.text.MessageFormat
import java.text.SimpleDateFormat

@Model("punch_record")
class PunchRecord {
    @Field("uid")
    @PrimaryKey
    var person: String = ""

    @Field("date")
    @PrimaryKey
    var date: Date = Date(System.currentTimeMillis())

    @Field("time")
    var time: Time = Time(System.currentTimeMillis())

    @Field("status")
    private var status: Int = 0

    @Field("color")
    var color: String = CodeColor.RED.toString()

    constructor(person: Person, date: Date, time: Time, status: Int, color: String) {
        this.person = person.personId
        this.date = date
        this.time = time
        this.status = status
        this.color = color
    }

    constructor() {}
    constructor(person: Person, date: Date, time: Time, status: Int) {
        this.person = person.personId
        this.date = date
        this.time = time
        this.status = status
    }

    fun getStatus(): Status {
        return Status(status)
    }

    fun setStatus(status: Int) {
        this.status = status
    }

    fun getPerson() = SQL().query(Person::class.java, "uid" to person)

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is PunchRecord) return false

        if (person != other.person) return false
        if (date != other.date) return false

        return true
    }

    override fun hashCode(): Int {
        var result = person.hashCode()
        result = 31 * result + date.hashCode()
        return result
    }

    override fun toString(): String {
        return "PunchRecord(person='$person', date=$date, time=$time, status=$status, color='$color')"
    }

}