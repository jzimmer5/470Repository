import processing.serial.*;
import processing.sound.*;

Serial myPort;
SoundFile file;
int val;

void setup() {
  size(640, 360);
  background(255);
  
  //chhane this to what serial  port you are using
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "byrkkh.WAV");
  //file.play();
}

void serialEvent(Serial myPort) {
  val = myPort.read();
}

void draw() {
  //if the resistance is greater than 450 loop the sound file
  val = myPort.read();
  if(val > 450) {
    file.loop();
  } else {
   file.stop();
  }
}
