#include "math.h"
#include "states.h"
#include "Arduino.h"

int candleAngle;
//int corners = 0;

int met[5] = {0};

int terminate() {
    if(state != FINDCANDLE and state != SOLVECANDLE and state != ADJUSTCANDLE and state != KILL and (flame[0] or flame[1] or flame[2] or flame [3] or flame[4])) return FINDCANDLE;
    switch(state) {
        case ADJUSTCANDLE:
        case FINDCANDLE:
            if(flame[2]) return SOLVECANDLE;
            break;
            
        case METWALL:
            if(line[0] or line[2] or line[4]) return METLINE;
            break;
            
        case METLINE:
            if(line[0] + line[1] + line[2] + line[3] + line[4] >= 2) return 1;
            break;
            
        case GOALONGLINE:
            
            break;
            
        case SOLVECANDLE:
            if(line[0] or line[2] or line[4]) return KILL;
            if(!flame[2]) return ADJUSTCANDLE;
            break;
            
        case METWALLSOLVE:
        case GOAHEAD:
            if(line[0]or line[2] or line[4]) return METLINE;
            if(USdis[1] < 30 or USdis[2] < 30) return METWALL;
            break;
        case KILL:

            break;
        case GOBACK:

            break;
        case GOAROUND:
            if(USdis[1] < 30 or USdis[2] < 30) return METWALL;
            break;
    }
    return 0;
}

int goAlongLine() {
    Serial.println("Going along line");
    digitalWrite(fanPin, LOW);
    go(-2);
    int angle = 0;
//    delay(1000);
    if (line[0] + line[1] + line[2] + line[3] + line[4] >= 2) {
        if(line[0] and line[1]) angle += 50;
        else if(line[0] and line[2]) angle += 35;
        else if(line[0] and line[3]) angle += 15;
        else if(line[1] and line[2]) angle += 25;
        else if(line[1] and line[4]) angle += -15;
        else if(line[2] and line[3]) angle += -25;
        else if(line[2] and line[4]) angle += -35;
        else if(line[3] and line[4]) angle += -50;
    } else {
        if(met[0] and met[1]) angle += 50;
        if(met[0] and met[2]) angle += 35;
        if(met[0] and met[3]) angle += 15;
        if(met[1] and met[2]) angle += 25;
        if(met[1] and met[4]) angle += -15;
        if(met[2] and met[3]) angle += -25;
        if(met[2] and met[4]) angle += -35;
        if(met[3] and met[4]) angle += -50;
        angle /= 2;
    }
    go(0, angle);
//    delay(1000);
    go(-7);
    go(0, 180);
    go(18);
//    delay(1000);
    go(0, 90);
    return GOAHEAD;
}

int goAhead() {
    Serial.println("Going ahead");
    digitalWrite(fanPin, LOW);
    return go(600);
}

int metLine() {
    Serial.println("Met line");
    digitalWrite(fanPin, LOW);
    for(int i = 0; i < 5; i++) met[i] = 0;
    int metNum = 0;
    float right = 0;
    float left = 0;
    runSensors();
    go(-7);
    while(metNum < 2) {
      for(int i = 0; i < 5; i++) {
        if(line[i] and !met[i]) {
          met[i] = 1;
            metNum++;
        }
      }
      if (go(1) == 1) return GOALONGLINE;
    }
    /*
    if(met[0] == 0 and met[1] == 1) go(0, 50);
    else if(met[0] == 0 and met[1] == 2) go(0, 35);
    else if(met[0] == 0 and met[1] == 3) go(0, 15);
    else if(met[0] == 1 and met[1] == 2) go(0, 25);
    else if(met[0] == 1 and met[1] == 4) go(0, -15);
    else if(met[0] == 2 and met[1] == 3) go(0, -25);
    else if(met[0] == 2 and met[1] == 4) go(0, -35);
    else if(met[0] == 3 and met[1] == 4) go(0, -50);
    /*while(line[0] + line[1] + line[2] + line[3] + line[4] < 2)
    {
        runSensors();
        go(1, 0);
    }
    if(line[0] and line[1]) go(0, 60);
    else if(line[0] and line[2]) go(0, 45);
    else if(line[0] and line[3]) go(0, 15);
    else if(line[1] and line[2]) go(0, 30);
    else if(line[1] and line[4]) go(0, -15);
    else if(line[2] and line[3]) go(0, -30);
    else if(line[2] and line[4]) go(0, -45);
    else if(line[3] and line[4]) go(0, -60);*/

    return GOALONGLINE;
}

int findCandle() {
    Serial.println("Finding candle");
    digitalWrite(fanPin, LOW);
    int angle;
    if(flame[0]) candleAngle = 80;
    else if(flame[1]) candleAngle = 30;
    else if(flame[3]) candleAngle = -30;
    else if(flame[4]) candleAngle = -80;
    else candleAngle = 0;
    if (flame[0] or flame[1])
    {
        angle = -360;
    }
    else if(flame[3] or flame[4])
    {
        angle = 360;
    }
    runSensors();
    if(!flame[2])
    {
        if(!go(0, angle)) return GOAHEAD;
    }
    return SOLVECANDLE;
}

int solveCandle() {
    Serial.println("Solving candle");
    digitalWrite(fanPin, LOW);
    int terminate;
    return go(420);
}

int kill() {
    Serial.println("Killing candle");
    digitalWrite(fanPin, HIGH);
    go(-5);
    go(1);
    delay(3000);
    for(int i = 0; i < 20; i++) {
        go(0, 2);
        delay(30);
    }
    for(int i = 0; i < 40; i++) {
        go(0, -2);
        delay(30);
    }
    go(0, 20);
    digitalWrite(fanPin, LOW);
    delay(1000);
    return GOBACK;
}

int metWall() {
    Serial.println("Met wall");
    digitalWrite(fanPin, LOW);
    go(0, -90);
    return METWALLSOLVE;
}

int metWallSolve() {
    Serial.println("Met wall solving");
    digitalWrite(fanPin, LOW);
    while(USdis[0] < 60) go(10);
    go(10);
    go(0,90);
    go(100);
    go(0, 90);
    return GOAHEAD;
}

int adjustCandle() {
    Serial.println("Adjust candle");
    digitalWrite(fanPin, LOW);
    int end;
    end = go(20, 0);
    if(end) return end;
    for(int i = 0; i < 8; i++)
    {
        end = go(0, (i % 2) ? pow(2, i) : -pow(2,i));
        if(end) return end;
    }
    return GOAHEAD;
}

int goBack()
{
    Serial.println("Going back");
    digitalWrite(fanPin, LOW);
    go(-7);
    switch(candleAngle) {
        case 80:
            go(-20);
            go(0, 140);
            go(20);
            break;
        case 30:
            go(0, 60);
            go(30);
            break;
        case 0:
            go(0, -90);
            return GOAROUND;
            break;
        case -80:
            go(-20);
            go(0, -140);
            go(20);
            break;
        case -30:
            go(0, -60);
            go(30);
            break;
    }

    return GOAHEAD;
}

int goAround()
{
    Serial.println("Going around");
    digitalWrite(fanPin, LOW);
    go(30);
    go(0, 90);
    return GOAHEAD;
}

/*
void goAlongLine() {
    Serial.println("Going along line");
    corners++;
    if (corners < 6) {
        go(0, 180);
        go(50, -90);
    } else {
        go(0, 135);
        go(360);
    }
    go(360);
}

void metLine() {
    Serial.println("Met line");
    int pairs = 0;
    int angle = 0;

    for (int a = 0; a < 4; a++) {
        for (int b = a + 1; b < 5; b++) {
            if (line[a] and line[b]) {
                angle = angleToLine(a, b);
                pairs++;
            }
        }
    }

    angle = angle / pairs;

    findCandle();
}

void findCandle() {
    Serial.println("Finding candle");
    go(0, 360);
    go(360);
    goAlongLine();
}

//solves a Candle once it is in reach of the sensors
void solveCandle() {
    Serial.println("Solving candle");
    int angle = 0;
    runSensors();
    if (flame[0] > 0) angle = -75;
    if (flame[1] > 0) angle = -25;
    if (flame[2] > 0) angle = 0;
    if (flame[3] > 0) angle = 25;
    if (flame[4] > 0) angle = 75;

    go(0, angle);

    bool foundLine = 0;

    int rBaseDelay = mDelay;
    int lBaseDelay = mDelay;

    int rDelay = mDelay;
    int lDelay = mDelay;

    long lineDelay = lineBaseDelay;

    bool rHigh = 1;
    bool lHigh = 1;

    while (!foundLine) {

        int actDelay = min(rDelay, lDelay);
        rDelay -= actDelay;
        lDelay -= actDelay;
        lineDelay -= actDelay;

        if (rDelay <= 0) {
            if (rHigh) {
                digitalWrite(rightStepPin, HIGH);
            } else {
                digitalWrite(rightStepPin, LOW);
            }
            rDelay = rBaseDelay;
            rHigh = !rHigh;
        }

        if (lDelay <= 0) {
            if (lHigh) {
                digitalWrite(leftStepPin, HIGH);
            } else {
                digitalWrite(leftStepPin, LOW);
            }
            lDelay = lBaseDelay;
            lHigh = !lHigh;
        }

        if (lineDelay <= 0) {
            runSensors();

            if (line[0] or line[1] or line[2] or line[3] or line[4]) foundLine = 1;
            if (flame[1] > 0) rBaseDelay = mDelay * wheelRatio, lBaseDelay = mDelay;
            if (flame[3] > 0) rBaseDelay = mDelay, lBaseDelay = mDelay * wheelRatio;
            if (flame[2] > 0) rBaseDelay = mDelay, lBaseDelay = mDelay;

            if (USdis[1] < 40) rBaseDelay = mDelay, lBaseDelay = mDelay * wheelRatio;
            if (USdis[2] < 40) rBaseDelay = mDelay * wheelRatio, lBaseDelay = mDelay;

            lineDelay = lineBaseDelay;
        }

        delayMicroseconds(actDelay);
    }

    digitalWrite(fanPin, HIGH);

    runSensors();
    while (flame[1] or flame[2] or flame[3]) {
        delayMicroseconds(500000);
        go(0, 10);
        go(0, -20);
        go(0, 10);
        runSensors();
    }
    digitalWrite(fanPin, LOW);

    go(0, 180);
    go(360);
}

void metWall() {
    Serial.println("Met wall");
    /////////////////////////////////////////////////////////////////////////////////////
    // find angle to miss the obstacle

    digitalWrite(rightDirPin, HIGH);
    digitalWrite(leftDirPin, LOW);

    bool foundWall = 1;

    bool rHigh = 1;
    bool lHigh = 1;

    long lineDelay = lineBaseDelay;

    while (foundWall) {
        int actDelay = mDelay;
        lineDelay -= actDelay;

        if (rHigh) {
            digitalWrite(rightStepPin, HIGH);
        } else {
            digitalWrite(rightStepPin, LOW);
        }
        rHigh = !rHigh;


        if (lHigh) {
            digitalWrite(leftStepPin, HIGH);
        } else {
            digitalWrite(leftStepPin, LOW);
        }
        lHigh = !lHigh;


        if (lineDelay <= 0) {
            runSensors();

            //if (line[0] or line[1] or line[2] or line[3] or line[4]) metLine();
            if (flame[0] or flame[1] or flame[2] or flame[3] or flame[4]) solveCandle();
            if (USdis[1] > wallLimit + 10) foundWall = 0;

            lineDelay = lineBaseDelay;
        }

        delayMicroseconds(actDelay);
    }

    //TODO: find right const
    //go(0, -6);


    /////////////////////////////////////////////////////////////////////////////////////
    // approach the wall

    int rBaseDelay = mDelay;
    int lBaseDelay = mDelay;

    int rDelay = mDelay;
    int lDelay = mDelay;

    lineDelay = lineBaseDelay;

    rHigh = 1;
    lHigh = 1;

    digitalWrite(rightDirPin, HIGH);
    digitalWrite(leftDirPin, HIGH);

    while (!foundWall) {

        int actDelay = min(rDelay, lDelay);
        rDelay -= actDelay;
        lDelay -= actDelay;
        lineDelay -= actDelay;

        if (rDelay <= 0) {
            if (rHigh) {
                digitalWrite(rightStepPin, HIGH);
            } else {
                digitalWrite(rightStepPin, LOW);
            }
            rDelay = rBaseDelay;
            rHigh = !rHigh;
        }

        if (lDelay <= 0) {
            if (lHigh) {
                digitalWrite(leftStepPin, HIGH);
            } else {
                digitalWrite(leftStepPin, LOW);
            }
            lDelay = lBaseDelay;
            lHigh = !lHigh;
        }

        if (lineDelay <= 0) {
            runSensors();

            if (line[0] or line[1] or line[2] or line[3] or line[4]) metLine();
            if (flame[0] or flame[1] or flame[2] or flame[3] or flame[4]) solveCandle();

            if (USdis[1] < wallLimit) metWall();
            if (USdis[2] < 40) rBaseDelay = mDelay * wheelRatio, lBaseDelay = mDelay;
            if (USdis[3] < 100) foundWall = 1;

            lineDelay = lineBaseDelay;
        }

        delayMicroseconds(actDelay);
    }

    /////////////////////////////////////////////////////////////////////////////////////
    // along the wall

    rHigh = 1;
    lHigh = 1;

    lineDelay = lineBaseDelay;

    digitalWrite(rightDirPin, HIGH);
    digitalWrite(leftDirPin, HIGH);

    while (foundWall) {

        int actDelay = min(rDelay, lDelay);
        rDelay -= actDelay;
        lDelay -= actDelay;
        lineDelay -= actDelay;

        if (rDelay <= 0) {
            if (rHigh) {
                digitalWrite(rightStepPin, HIGH);
            } else {
                digitalWrite(rightStepPin, LOW);
            }
            rDelay = rBaseDelay;
            rHigh = !rHigh;
        }

        if (lDelay <= 0) {
            if (lHigh) {
                digitalWrite(leftStepPin, HIGH);
            } else {
                digitalWrite(leftStepPin, LOW);
            }
            lDelay = lBaseDelay;
            lHigh = !lHigh;
        }

        if (lineDelay <= 0) {
            runSensors();

            if (line[0] or line[1] or line[2] or line[3] or line[4]) metLine();
            if (flame[0] or flame[1] or flame[2] or flame[3] or flame[4]) solveCandle();
            if (USdis[1] < 150) metWall(); //found another wall on left
            if (USdis[2] < 40) metWall();
            if (USdis[3] < 50) rBaseDelay = mDelay, lBaseDelay = mDelay * wheelRatio;
            else if (USdis[3] > 500) foundWall = 0;
            else if (USdis[3] > 60) rBaseDelay = mDelay * wheelRatio, lBaseDelay = mDelay;
            else rBaseDelay = mDelay, lBaseDelay = mDelay;

            lineDelay = lineBaseDelay;
        }

        delayMicroseconds(actDelay);
    }

    go(360);
}*/
