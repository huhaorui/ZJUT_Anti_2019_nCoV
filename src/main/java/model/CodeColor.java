package model;

public enum CodeColor {
    RED(255, 0, 0), YELLOW(255, 255, 0), GREEN(0, 255, 0);

    int r, g, b;

    CodeColor(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }
}
