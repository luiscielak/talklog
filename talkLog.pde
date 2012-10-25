import processing.opengl.*;
import processing.pdf.*;


Bubble[] bubbles;
float theta = 0;

//int rptprd = 201003;
int rptprd;

PFont font;

int plotX1, plotY1, plotX2, plotY2;

String[] phase_nm = {
  "jun'10", "aug'10", "oct'10", "dec'10", "feb'11", "apr'11", "jun'11", "aug'11", "oct'11"
};

float[] rptprd_nm = { 
  201001, 201002, 201003, 201004, 201005, 201006, 201007, 201008, 201009, 201010, 201011, 201012
};


PVector mouse;

void setup() {
  //  background(100);
  size(1024, 768);

  smooth();



  mouse = new PVector(width/2, height/2);

  plotX1 = 10;
  plotY1 = 10;      // plotX1 = 90
  plotX2 = width-plotX1;
  plotY2 = height-plotY1;

  font = createFont("TrebuchetMS", 48, true);

  // load text file as an array of strings
  String[] data = loadStrings("tl_voice.csv");

  bubbles = new Bubble[data.length];

  for (int i = 0; i < bubbles.length; i++) {
    float[] values = float(split(data[i], ","));


    //    bubbles[i] = new Bubble(values[3], values[5], values[6], values[7]);  

    bubbles[i] = new Bubble(values[4], values[6], values[7], values[8]);
    //  parms    Bubble(float mins_, float rptprd_, float rpthr_, float callIn_) {
    //  "Number","Date","Time","Destination","Minutes","Call Type","RptPrd","RptHr","inCall","outCall"
    //  "123-456-7890","2012-05-06","00:22:00","INCOMING CL","2","M2AM","201205","0","1","0"
  }

  frameRate(30);
}

void draw() {
  background(255);

  mouse.x = mouseX;
  mouse.y = mouseY;





  // x-axis label
  textFont(font, 14);
  textAlign(CENTER, BOTTOM);
  for (int i = 0; i < 8; i++) {
    fill(250, 100);
    //       text(phase_nm[i], i*100 + 50, height-5);
  }




  // Show the plot area as a white box  
  fill(254, 250);
  rectMode(CORNERS);
  noStroke();
  rect(0, 0, width, height);





  // display bubbles
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].display();
    if (bubbles[i].rollover(mouseX, mouseY) && mousePressed) {
      bubbles[i].drift();
    }
  }
}



boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overEllipse(float x, float y, float d) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < d/2) {
    return true;
  } 
  else {
    return false;
  }
}




int rptprd_curr;    // @todo fix default
boolean filterDown;
boolean filterUp;
int filterSize;

void mousePressed() {

  rptprd_curr = (rptprd_curr + 1) % rptprd_nm.length;     //rptprd_curr++;
}

void keyPressed() {


  if (key == CODED) {
    if (keyCode == RIGHT) {
      rptprd_curr = (rptprd_curr + 1) % rptprd_nm.length;     //rptprd_curr++;
    }
  } 
  if (keyCode == LEFT) {
    // if index = 0 set to array length
    if (rptprd_curr == 0) {
      rptprd_curr = rptprd_nm.length;
    }
    rptprd_curr = (rptprd_curr - 1) % rptprd_nm.length;  //  rptprd_curr--;
  }

  if (keyCode == DOWN) {
    // filter by rpoject size

    //    filterSize = true;
    for (int i=0; i < bubbles.length; i++) {
      bubbles[i].update();
      bubbles[i].display();


      //      y += (y.targetY - y) * easing;
    };
  }

  else if (keyCode == UP) {
    // filter by rpoject size

    //    filterUp = true;
    //    y += (targetY - y) * easing;
  }

  // write to PDF
  if (key == 'b') {
    beginRecord(PDF, "talkLog_0_2_###.pdf");
    println(">> record start");
  } 
  else if (key == 'e') {
    endRecord();
    exit();
  }



  rptprd = int(rptprd_nm[rptprd_curr]);
}

// ------ print frames ------

void keyReleased() {
  if (key == 's' || key == 'S') {
    saveFrame(timestamp()+"_##.png");
    println(">> saved frame");
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
} 


