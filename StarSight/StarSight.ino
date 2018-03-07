#include <math.h>
//#include <Arduino.h>

#include "StarSight.h"

int state;

void setup() {
    //set pins as output

    //normal motors
//    pinMode(leftPower, OUTPUT);
//    pinMode(rightPower, OUTPUT);
//    pinMode(leftDir, OUTPUT);
//    pinMode(rightDir, OUTPUT);

    //fan
    pinMode(fanPin, OUTPUT);
    digitalWrite(fanPin, LOW);


    //input analog

    //IR candle from right to left
    pinMode(IR0Pin, INPUT);
    pinMode(IR1Pin, INPUT);
    pinMode(IR2Pin, INPUT);


    //input digital

    //ultra sound from
    pinMode(US0inPin, INPUT);
    pinMode(US0outPin, OUTPUT);
    pinMode(US1inPin, INPUT);
    pinMode(US1outPin, OUTPUT);
    pinMode(US2inPin, INPUT);
    pinMode(US2outPin, OUTPUT);
    pinMode(US3inPin, INPUT);
    pinMode(US3outPin, OUTPUT);

    //IR line from right to left
    pinMode(line0Pin, INPUT);
    pinMode(line1Pin, INPUT);
    pinMode(line2Pin, INPUT);
    pinMode(line3Pin, INPUT);
    pinMode(line4Pin, INPUT);

    //switch
    pinMode(powerPin, INPUT_PULLUP);
  
    //battery
    pinMode(battPin1, INPUT);
    pinMode(battPin2, INPUT);

    //led
    pinMode(ledPin, OUTPUT);

    initUSB();

    initSensors();
    initUltra();

//    printSensors();
    for(int i = 0; i < lineMedian; i++) runSensors();
//    printSensors();
//    for(int i = 0; i < 5; i++) line[i] = 0;
//    printSensors();
    digitalWrite(fanPin, LOW);

    digitalWrite(ledPin, HIGH);
}

int go(float l, float angle) {
    int finished;
    float right;
    float left;

      int lSpeed;
      int rSpeed;

      long time;

//    long lineDelay = lineBaseDelay;

    left = l - d * angleConst * M_PI * angle / 180;
    right = l + d * angleConst * M_PI * angle / 180;

    right > 0 ? digitalWrite(rightDir, LOW) : digitalWrite(rightDir, HIGH);
    left > 0 ? digitalWrite(leftDir, LOW) : digitalWrite(leftDir, HIGH);


    right = abs(right);
    left = abs(left);

      if(right > left)
      {
          rSpeed = speedMod;
          lSpeed = speedMod * leftSpeedMod * left / right;
      }
      else
      {
          rSpeed = speedMod * right / left;
          lSpeed = speedMod * leftSpeedMod;
      }

      time = right / rSpeed * timeMod;

      long bTime = millis();

      analogWrite(leftPower, lSpeed);
      analogWrite(rightPower, rSpeed);
    while (bTime + time >= millis()) {

//        if (lineDelay <= 0) {
            runSensors();
            finished = terminate();
            if(finished)
            {
              //Serial.println("termnating");
                analogWrite(leftPower, 0);
                analogWrite(rightPower, 0);
              return finished;
            }

//            lineDelay = lineBaseDelay;
//        }
    }
      analogWrite(leftPower, 0);
      analogWrite(rightPower, 0);
      return 0;
}

int go(int l) {
    return go(l, 0);
}

int time;
void loop() {
//    switch(state)
//    {
//        case FINDCANDLE:
//            state = findCandle();
//            break;
//        case METWALL:
//            state = metWall();
//            break;
//        case METLINE:
//            state = metLine();
//            break;
//        case GOALONGLINE:
//            state = goAlongLine();
//            break;
//        case SOLVECANDLE:
//            state = solveCandle();
//            break;
//        case GOAHEAD:
//            state = goAhead();
//            break;
//        case KILL:
//            state = kill();
//            break;
//        case ADJUSTCANDLE:
//            state = adjustCandle();
//            break;
//        case GOBACK:
//            state = goBack();
//            break;
//        case METWALLSOLVE:
//            state = metWallSolve();
//            break;
//        case GOAROUND:
//            state = goAround();
//            break;
//        default:
//            state = GOAHEAD;
//            break;
//    }
//    go(20);
//    delay(1000);

    //findCandle();
    runSensors();
    printSensors();
    executeOrder();
    if(batt[0] < 10800 && batt[0] > 8500 || batt[0] < 7100) digitalWrite(ledPin, HIGH);
    else if(batt[1] < 10800 && batt[1] > 8500 || batt[1] < 7100) digitalWrite(ledPin, HIGH); 
    else digitalWrite(ledPin, LOW);
    
////    go((1 + 2)/180.0*5, (-1 + 2) / (2*M_PI)*1);
//    analogWrite(leftPower, 255);
//    analogWrite(rightPower, 255);
//    delay(500);
//    digitalWrite(leftDir, HIGH);
//    digitalWrite(rightDir, HIGH);
//    go(0, 180);
//    delay(5000);
//    go(50, 90);
//    delay(5000);

    //go(20, 0);
    //Serial.println("aasdasd");
//    delay(5000);
//    digitalWrite(leftDir, LOW);
//    digitalWrite(rightDir, LOW);
//    analogWrite(leftPower, 0);
//    analogWrite(rightPower, 0);
//    delay(1000);
//    analogWrite(leftPower, 50);
//    analogWrite(rightPower, 50);
//    delay(2000);
//    analogWrite(leftPower, 150);
//    analogWrite(rightPower, 150);
//    delay(2000);
//    analogWrite(leftPower, 255);
//    analogWrite(rightPower, 255);
//    delay(4000);
//    digitalWrite(leftDir, HIGH);
//    digitalWrite(rightDir, HIGH);
//    analogWrite(leftPower, 0);
//    analogWrite(rightPower, 0);
//    delay(1000);
//    analogWrite(leftPower, 50);
//    analogWrite(rightPower, 50);
//    delay(2000);
//    analogWrite(leftPower, 150);
//    analogWrite(rightPower, 150);
//    delay(2000);
//    analogWrite(leftPower, 255);
//    analogWrite(rightPower, 255);
//    delay(4000);
}

