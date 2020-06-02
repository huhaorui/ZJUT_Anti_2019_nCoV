package model

class FullTarget(level: Int, target: Int?) {
    val level: Level
    val healthCode: Boolean
    val target: Collage?

    init {
        this.level = when {
            level and 0b1000 == 0b1000 -> Level.SYSTEM
            level and 0b0100 == 0b0100 -> Level.SCHOOL
            level and 0b0010 == 0b0010 -> Level.COLLAGE
            else -> Level.NULL
        }
        healthCode = level and 0b0001 == 0b0001
        if (target != null) {
            this.target = SQL().query(Collage::class.java, "id" to target)
        } else {
            this.target = null
        }
    }

    enum class Level {
        SYSTEM, SCHOOL, COLLAGE, NULL
    }
}