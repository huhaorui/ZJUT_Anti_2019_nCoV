package model;

public class Status {
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
