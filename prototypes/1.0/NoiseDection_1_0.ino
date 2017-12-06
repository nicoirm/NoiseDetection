const int knockSensor = A0; // Data input pin A0
const int threshold = 600;  

int sensorReading = 0;      // Initialization of input data
int ledState = LOW;         // Initialization LED status

void setup() {
  pinMode(LED_BUILTIN, OUTPUT); 
  Serial.begin(9600);       // Serial port used
}

void loop() {
  
  sensorReading = analogRead(knockSensor);

  if (sensorReading >= threshold) {
    
    ledState = !ledState;
    digitalWrite(LED_BUILTIN, ledState);
    
    Serial.println(sensorReading);
  }

  delay(0);
}  