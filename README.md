# NoiseDetection

### Prototype 1.0
Connecting an _electret microphone breakout_ to a _ESP8266_ module:
* Gets the sensor signal raw data on analog input.
* Blinks led on noise level, according to threshold and delay parameters.
* Schematic:
<img src="https://github.com/USIMakers/NoiseDetection/blob/master/prototypes/1.0/sketch_1_0.png" width="600" style="text-align: center">

Simple data analytics can be performed using the [Processing Software IDE](https://processing.org/), such that the Java code:
* Plots the data from the serial port in a graph.
* Outputs a CSV file with all the raw signal data (time based) such that it can be analysed using R.

<img src="https://github.com/USIMakers/NoiseDetection/blob/master/prototypes/1.0/NoiseDetection_graph/graph_1_0.png" width="800" style="text-align: center">
