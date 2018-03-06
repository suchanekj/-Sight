#include "raspberry.h"

//String inputString = "";

void initUSB() {
//  inputString.reserve(200);
  Serial.begin(9600);
}

void executeOrder() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
    if(inChar == "0") digitalWrite(fanPin, LOW);
    if(inChar == "1") digitalWrite(fanPin, HIGH);
    // add it to the inputString:
//    inputString += inChar;
    // if the incoming character is a newline, set a flag so the main loop can
    // do something about it:
//    if (inChar == '\n') {
//      stringComplete = true;
//    }
  }
}

