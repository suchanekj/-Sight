#ifndef STARSIGHT_UTRASENSORS_H
#define STARSIGHT_UTRASENSORS_H

#include "Arduino.h"

#include "config.h"
#include "helperFunctions.h"

extern int USdis[4];
extern unsigned long UStime[4];
extern int US[8];

void initUltra();
void runUltra();
void US0();
void US1();
void US2();
void US3();

#endif //STARSIGHT_UTRASENSORS_H
