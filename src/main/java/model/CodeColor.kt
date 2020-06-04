package model

enum class CodeColor(var r: Int, var g: Int, var b: Int) {
    RED(255, 0, 0), YELLOW(255, 255, 0), GREEN(0, 255, 0);

    override fun toString(): String = when(this) {
        RED -> "red"
        YELLOW -> "yellow"
        GREEN -> "green"
    }
}