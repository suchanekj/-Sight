#ifndef STARSIGHT_MAIN_HH_H
#define STARSIGHT_MAIN_HH_H

#include "config.h"
#include "otherSensors.h"
#include "ultraSensors.h"
#include "states.h"
#include "raspberry.h"

extern int state;

//l in cm (possitive forward), angle in degrees (mathematical direction)
int go(float l, float angle);

//go straight
int go(int l);


#endif //STARSIGHT_MAIN_HH_H
