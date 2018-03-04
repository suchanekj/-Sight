#ifndef MAIN_STATES_H
#define MAIN_STATES_H


#include "StarSight.h"
#include "helperFunctions.h"
#include "otherSensors.h"
#include "ultraSensors.h"
#include "config.h"

int terminate();

int goAlongLine();
int goAhead();
int metLine();
int metWall();
int metWallSolve();

int findCandle();
int solveCandle();
int adjustCandle();
int kill();
int goBack();
int goAround();



#endif //MAIN_STATES_H
