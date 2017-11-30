const int knockSensor = A0;		// Analog signal on pin 0
const int threshold = 40;		// Threshold value of the detected sound

int sensorReading = 0;			// Variable to store the value read from the sensor pin

void setup() {
  pinMode(LED_BUILTIN, OUTPUT); 
  Serial.begin(9600);       	// Serial port
}

void loop() {

  sensorReading = analogRead(knockSensor);		// Store value of the sensor 
  
  if (sensorReading >= threshold) {

    Serial.println(sensorReading); 
    ledState =! ledState;
    digitalWrite(LED_BUILTIN, ledState);		// Update the LED status

  }

  delay(1);  									// Delay for sensor capture
}
