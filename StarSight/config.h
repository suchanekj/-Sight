#ifndef STARSIGHT_CONFIG_H
#define STARSIGHT_CONFIG_H

//#include "Arduino.h"

//constants
const float stepsPerCm = 27;
const int d = 18.5; //wheel to wheel
const float angleConst = 0.4242; //turning constant
const int pi = 3.141592;

const int mDelay = 700;
const long int lineBaseDelay = 500;

//TODO: constant to try
const float wheelRatio = 1.2;


const float leftSpeedMod = 1;
const float timeMod = 8000;
const int speedMod = 255;

const int flameLimit[5] = {900, 0, 800, 800, 800}; //0(FIRE)-1024(DARKNESSS)
#define flameMedian 5 //number of last values to make median of

#define wallLimit 50

//line detection config
#define lineMedian 9 //number of last values to make median of
const int lineAvgLng = lineMedian; //number of last values to make average of
const int whiteThreshold = 80; //the lower, the whiter
const int blackThreshold[5] = {200, 200, 200, 200, 200}; //the higher, the darker
const int blackWhiteDiff = 150; //the higher, the darker


//ultra sound config
#define UStocm 57
#define USwaitlow 50000 //micros to wait for echo
#define USwaithigh 500000 //micros to wait for echo
#define USmedian 9 //number of last values to make median of


//states
#define FINDCANDLE 1
#define METWALL 2
#define METLINE 3
#define GOALONGLINE 4
#define SOLVECANDLE 5
#define GOAHEAD 6
#define KILL 7
#define ADJUSTCANDLE 8
#define GOBACK 9
#define METWALLSOLVE 10
#define GOAROUND 11

//output

//normal motors
#define leftPower 7
#define rightPower 11
#define leftDir 6
#define rightDir 13

//fan
#define fanPin 34

//input analog

//IR candle from right to left
#define IR0Pin A10
#define IR1Pin A11
#define IR2Pin A12
#define IR3Pin A13
#define IR4Pin A14

//input digital

//ultra sound from right to left
#define US0inPin 21
#define US0outPin 22
#define US1inPin 20
#define US1outPin 24
#define US2inPin 19
#define US2outPin 26
#define US3inPin 18
#define US3outPin 28

//IR line from right to left
#define line0Pin A1
#define line1Pin A2
#define line2Pin A3
#define line3Pin A4
#define line4Pin A5

//switch
#define powerPin 32

//battery
#define battPin1 A6
#define battPin2 A7

#endif //STARSIGHT_CONFIG_H
