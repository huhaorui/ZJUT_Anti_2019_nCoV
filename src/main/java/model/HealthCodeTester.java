package model;

interface HealthCodeTester {
    CodeColor getCodeColor();

    HealthInfo getHealthInfo();

    PunchRecord[] getPunchRecords();
}
