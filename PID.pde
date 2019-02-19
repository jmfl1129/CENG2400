/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int[] val=new int[100];      // Data received from the serial port
int[] valR=new int[100];      // Data received from the serial port

char valid;

void setup() 
{
  size(1200, 800);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  //String portName = Serial.list()[0];
  //String portName = Serial.list()[1];
  //myPort = new Serial(this, portName, 115200);
  background(0);
  stroke(255,255,255); 
  line(100,700,1100,700);
  line(100,100,100,700);
  stroke(0,255,0);
  line(100,300,1100,300);
  stroke(0,0,255);
  line(200,100,200,700);
  line(300,100,300,700);
  line(400,100,400,700);
  line(500,100,500,700);
  line(600,100,600,700);
  line(700,100,700,700);
  line(800,100,800,700);
  line(900,100,900,700);
  line(1000,100,1000,700);
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 115200);
  //myPort = new Serial(this, portName, 57600);
}

void draw()
{
  int i;
  
  delay(100);
  myPort.write(112);
  delay(8000);
  while(val[0]!=13) {
    val[0]=myPort.read();
  }
  
  
  for(i=0;i<100;i++) {
    val[i]=myPort.read();
    valR[i]=myPort.read();
    print(val[i]);
    print(",");
  }
  println("");

  i=0;
  stroke(255,0,0);
  line(100,700,100+i*10,700-val[i]*2);
  for(i=1;i<100;i++) {
    line(100+(i-1)*10,700-val[i-1]*2,100+i*10,700-val[i]*2);
  }
  i=0;
  stroke(255,255,0);
  line(100,700,100+i*10,700-valR[i]*2);
  for(i=1;i<100;i++) {
    line(100+(i-1)*10,700-valR[i-1]*2,100+i*10,700-valR[i]*2);
  }
  delay(100);
}
