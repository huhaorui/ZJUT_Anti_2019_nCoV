package model

import java.text.MessageFormat

@Model("health_info")
class HealthInfo {
    constructor(person: Person, tel: String, danger14: Boolean, abroad14: Boolean, touchIllness14: Boolean, ill: Boolean, status: Int) {
        this.person = person.personId
        this.tel = tel
        isDanger14 = danger14
        isAbroad14 = abroad14
        isTouchIllness14 = touchIllness14
        isIll = ill
        this.status = status
    }

    @Field("uid")
    var person: String = ""

    @Field("tel")
    var tel: String = ""

    @Field("if_danger_14")
    var isDanger14 = false

    @Field("if_abroad_14")
    var isAbroad14 = false

    @Field("if_touch_illness")
    var isTouchIllness14 = false

    @Field("if_ill")
    var isIll = false

    @Field("status")
    private var status: Int = 0

    @Field("color")
    var color: String = CodeColor.RED.toString()

    constructor() {}

    val codeColor: CodeColor
        get() {
            var codeColor = CodeColor.GREEN
            val abnormalCount = getStatus().abnormalCount
            if (isDanger14 || isAbroad14 || abnormalCount == 1) {
                codeColor = CodeColor.YELLOW
            }
            if (isTouchIllness14 || isIll || abnormalCount >= 2) {
                codeColor = CodeColor.RED
            }
            return codeColor
        }

    fun getStatus() = Status(status)

    fun getPerson() = SQL().query(Person::class.java, "uid" to person)

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is HealthInfo) return false

        if (person != other.person) return false

        return true
    }

    override fun hashCode(): Int {
        return person.hashCode()
    }

    override fun toString(): String {
        return "HealthInfo(person='$person', tel='$tel', isDanger14=$isDanger14, isAbroad14=$isAbroad14, isTouchIllness14=$isTouchIllness14, isIll=$isIll, status=$status, color='$color')"
    }

}