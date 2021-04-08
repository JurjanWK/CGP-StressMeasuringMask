// which analog pin to connect
int thermistorPin = A0;
// resistance at 25 degrees C
int thermistorNominal = 10000;
// temp. for nominal resistance (almost always 25 C)
int temperatureNominal = 25;   
// The beta coefficient of the thermistor
int bCoefficient = 3950;
// the value of the other resistor
int seriesResistor = 10000;
// takes the reading of the pin
float thermistorReading;
// after the resistance is converted we get the following temperature
float temperatureReading;

void setup() {
  // as the arduino AdaFruit Flora does not use 5V but 3.3V, the analog readings
  // need to be adjusted using the following line
  analogReference(EXTERNAL);
}

void loop() {
  //this reads the value of the thermistor
  thermistorReading = analogRead(thermistorPin);

  //this converts the reading to resistance
  thermistorReading = 1023 / thermistorReading - 1;
  thermistorReading = seriesResistor / thermistorReading;

  temperatureReading = thermistorReading / thermistorNominal;     // (R/Ro)
  temperatureReading = log(temperatureReading);                  // ln(R/Ro)
  temperatureReading /= bCoefficient;                   // 1/B * ln(R/Ro)
  temperatureReading += 1.0 / (temperatureNominal + 273.15); // + (1/To)
  temperatureReading = 1.0 / temperatureReading;                 // Invert
  temperatureReading -= 273.15;                         // convert absolute temp to C
}
