int state = 0;

void setup() {
  digitalWrite(ledPin, LOW);
  Serial.begin(38400); // Default communication rate of the Bluetooth module
  //once the arduino is connected to power, the bluetooth module shows up under new bluetooth devices
  //connect phone to bluetooth device from the phone's settings app
}

void loop() {
 if(Serial.available() > 0){ // Checks whether data is comming from the serial port
    state = Serial.read(); // Reads the data from the serial port
 }
 if (state == '0') {
  Serial.println("Sample data"); // Send back, to the phone, the String "Sample data"
  state = 0;
 }
 else if (state == '1') {
  Serial.println("Sample data");;
  state = 0;
 } 
}
