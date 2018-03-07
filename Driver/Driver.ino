
/**
 * Created by Olavi Kamppari on 3/19/2016.
 */

/**
 * Demonstrate the capabilities of Vnh2sp30 dual channel motor controller
 *  - shield on Arduino Mega 2560
 *  - repeat for 10 seconds macrosteps lasting 500 ms each
 *    > forward
 *    > turn right
 *    > turn left
 *    > turn in place CW
 *    > turn in place CCW
 *    > backward
 */

#include "Vnh2sp30.h"
 
//              ENA A   B   PWM   CS    inv
Vnh2sp30  mtrL( A0, 7,  8,  5,    A2,   0);             // Left side straight
Vnh2sp30  mtrR( A1, 4,  9,  6,    A3,   1);             // Right side reversed

void setup() {                          // No setup required
  Serial.begin(9600);
}

char inChar;

int right = 0, left = 0, val = 0, neg = 1, mot = 0, state = 0;

void loop() {
  while (Serial.available()) {
    // get the new byte:
    inChar = (char)Serial.read();
    if(state == 1) {
      if(inChar == '-') {
        neg = -1;
        state++;
        continue;
      }
      else neg = 1;
      state++;
    }
    if(state == 2) {
      if(inChar < 48 || inChar > 57) {
        if(mot == 0) {
          left = val * neg;
          if(left) mtrL.run(left);
          else mtrL.stop();
        }
        else {
          right = val * neg;
          if(right) mtrR.run(right);
          else mtrR.stop();
        }
        state = 0;
        continue;
      }
      else {
        val *= 10;
        val += inChar - 48;
      }
    }
    if(state == 0) {
      if(inChar == 'L') mot = 0;
      else mot = 1;
      val = 0;
      state++;
    }
  }

  Serial.println(right);
  Serial.println(left);

}
