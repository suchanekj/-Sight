#ifndef STARSIGHT_OTHERSENSORS_H
#define STARSIGHT_OTHERSENSORS_H

#include "Arduino.h"

#include "config.h"

#include "otherSensors.h"
#include "ultraSensors.h"
#include "states.h"
#include "helperFunctions.h"

extern int line[5];
extern int flame[5];
extern bool bmp[2];

void initSensors();

void runSensors();

void printSensors();

#endif //STARSIGHT_OTHERSENSORS_H
