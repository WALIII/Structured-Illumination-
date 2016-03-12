/*
  AnalogReadSerial
  Reads an analog input on pin 0, prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

 This example code is in the public domain.
 */

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
    pinMode(12, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  // print out the value you read:
//  Serial.println(sensorValue);
 if (sensorValue > 200) {
  Serial.println("TRIGGER DETECTED");
    Serial.println("----------------");
//    digitalWrite(2, HIGH);
//
//for (int i=0; i <= 3; i++){
//
//if (i == 1){
//    Serial.println("Aquiring pattern one");
//    }
//    else if (i ==2){
//     Serial.println("Aquiring patten two"); 
//             digitalWrite(2, LOW);
//    }
//      else if (i ==3){
//        Serial.println("Aquiring patten three");
//      }
// 
   delay(6000); // change to 2000
// }

      // Move stage once all patterns are presented
       Serial.println("Moving stage...");
      digitalWrite(12, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(5);              // wait for a second 50ms is 10um
  digitalWrite(12, LOW);
  Serial.println("Done moving stage");
  //
  
 }
  delay(1);        // delay in between reads for stability
}
