#include "otherSensors.h"

int line[5];
int lineRaw[5];
int lineMed[5][lineMedian];
int lineLastMed = 0;

int flame[5];
int flameRaw[5];
int flameMed[5][flameMedian];
int flameLastMed = 0;

void initSensors() {
    for(int i = 0; i < 5; i++) line[i] = 0;
    for(int i = 0; i < 5; i++) flame[i] = 0;
}

void runSensors() {
    lineRaw[0] = analogRead(line0Pin);
    lineRaw[1] = analogRead(line1Pin);
    lineRaw[2] = analogRead(line2Pin);
    lineRaw[3] = analogRead(line3Pin);
    lineRaw[4] = analogRead(line4Pin);

    flameRaw[0] = analogRead(IR0Pin);
    flameRaw[1] = analogRead(IR1Pin);
    flameRaw[2] = analogRead(IR2Pin);
    flameRaw[3] = analogRead(IR3Pin);
    flameRaw[4] = analogRead(IR4Pin);
    int i;
    for (i = 0; i < 5; i++) {
        flameMed[i][flameLastMed] = flameRaw[i];
        flameLastMed = (flameLastMed + 1) % flameMedian;
        if (median(flameMed[i], flameMedian) > flameLimit[i]) {
          flame[i] = 1;
        }
        else {
          flame[i] = 0;
        }
    }

    for (i = 0; i < 5; i++) {
        lineMed[i][lineLastMed] = lineRaw[i];
        lineLastMed = (lineLastMed + 1) % lineMedian;
        if (median(lineMed[i], lineMedian) < whiteThreshold) {
          line[i] = 1;
        }
        else if (median(lineMed[i], lineMedian) > blackThreshold[i]) {
          line[i] = 0;
        }
    }

    runUltra();
    //printSensors();
}

void printSensors() {
    Serial.print(line[0]);
    Serial.print(";");
    Serial.print(line[1]);
    Serial.print(";");
    Serial.print(line[2]);
    Serial.print(";");
    Serial.print(line[3]);
    Serial.print(";");
    Serial.print(line[4]);
//    Serial.print("LineRaw:\t");
//    Serial.print(lineRaw[0]);
//    Serial.print("\t");
//    Serial.print(lineRaw[1]);
//    Serial.print("\t");
//    Serial.print(lineRaw[2]);
//    Serial.print("\t");
//    Serial.print(lineRaw[3]);
//    Serial.print("\t");
//    Serial.print(lineRaw[4]);
    Serial.print("|");
    Serial.print(flame[0]);
    Serial.print(";");
    Serial.print(flame[1]);
    Serial.print(";");
    Serial.print(flame[2]);
    Serial.print(";");
    Serial.print(flame[3]);
    Serial.print(";");
    Serial.print(flame[4]);
    Serial.print("|");
    Serial.print(USdis[0]);
    Serial.print(";");
    Serial.print(USdis[1]);
    Serial.print(";");
    Serial.print(USdis[2]);
    Serial.print("|");
    Serial.print(USdis[3]);
    Serial.println();
}

