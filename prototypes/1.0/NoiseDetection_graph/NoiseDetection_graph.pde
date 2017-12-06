import processing.serial.*;

Serial myPort;        // Serial port
int xCoord = 0;         // Graph x-axis coordinate
float inputData = 0;
PrintWriter output;

void setup () {
  
  // Window size
  size(800, 200);      

  // Available ports for input
  println(Serial.list());   

  // Open Serial.list()[select_serial_port(0,1,...)].
  myPort = new Serial(this, Serial.list()[1], 9600);

  // set inital background:
  background(0);
  
  output = createWriter("output.csv");
}

void draw () {
  
  // draw the line:
  stroke(255, 255, 255);
  line(xCoord, height, xCoord, height - inputData);

  // Repeat graph plotting
  if (xCoord >= width) {
    xCoord = 0;
    background(0);
  } else {
    xCoord++;
  }
}

void serialEvent (Serial myPort) {
  
  // ASCII string from serial port.
  String inString = myPort.readStringUntil('\n');
  int h = hour();
  int m = minute();
  int s = second();

  if (inString != null && output != null) {
    
    // trim off any whitespace.
    inString = trim(inString);
    
    // convert to an int and map to the screen height:
    inputData = float(inString);
    
    println(inputData + " " + h + ":" + m);
    
    // Generates raw CSV data.
    output.println(inputData + "," + h + ":" + m + ":" + s);
    output.flush();
    
    inputData = map(inputData, 580, 800, 0, height);
  }
}