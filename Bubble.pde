// bubble class
class Bubble {
  float x, y;
  float x_, y_;
  float diameter, diameter2;
  float radius;
  float speed;
  float r, g, b, alph;
  boolean mouse;
  float phase;
  float id;


  float mins;
  float rptprd;
  float rpthr; 
  float callIn;


  float time = 0.0;
  float increment = 0.01;

  // easing
  float easing = 0.2;
  float targetX, targetY, targetD;



  // constructor
  Bubble(float mins_, float rptprd_, float rpthr_, float callIn_) {

    //    x = random(plotX1+diameter, plotX2+ random(rptprd/1000)+diameter);
    x = random(plotX1+mins_, plotX2-mins_); // @todo: set to date field
    y = random(plotY1+mins_, plotY2-mins_);       //  + (rpthr *10 +100)
    y_ = y;
    x_ = x;
    r = callIn;
    g = 120;
    b = 100;
    diameter = 1;
    radius = mins_/2;

    mouse = false;
    rpthr = rpthr_;
    rptprd = rptprd_;
    mins = mins_;
    callIn = callIn_;

    //    // easing
    targetX = random(x-.5, x+.5) *(diameter*.01);  

    targetY = plotY2 - diameter;

    targetD = mins;
  }

  void update() {

    theta+= 0.01;


    // DOWN
    if (keyCode == 40) {

      //         y += (targetY - y) * easing;
      y = map(mins,1,256,10,height-10);
    }

    // UP
    if (keyCode == 38 || keyCode == 44) {
      //      y += (height/2 -y) * easing;
      //      y += (plotY1-y) * easing;
      //      y += ((plotY1 - y) *rpthr%24*100) * easing;

      y +=  (plotY1 + rpthr *(plotY1+plotY2)/24 - y) * easing;

      //      textSize(200);
      //      text("aaa",width/2,height/2);


      //      y -= plotY1;
    }

    // RIGHT
    if (keyCode == 39 || keyCode == 44) {
      x +=  (plotX1 + plotX1 + rptprd%12 *(plotX1+plotX2)/12 - x) * easing;

      //      x += (plotX1 +*(plotX1+plotX2) - x) * easing;
      //      (rptprd);
    }


    // LEFT
    if (keyCode== 37) {

      if (callIn == 1) {
        x += (width/4 - x) * easing;
      }

      if (callIn == 0) {
        x += (width-width/4 - x) * easing;
      }
    }

    // SPACE BAR
    if (keyCode == 32) {
      // reset
      y += (y_ - y) * easing;   // y += (target - y) * easing
      x += (x_ - x) * easing;
    }


    diameter += (targetD - diameter) * easing;
  }


  // display the bubble
  void display() {

    labels();


    noStroke();

    // on mouse over
    if (mouse) {

      stroke(r, callIn*100, 0, 130);
      strokeWeight(3);
    }




    fill(r, callIn*100, b, 130);    //    fill(r, g, 0, 130);
    ellipse(x, y, diameter, diameter);
  }



  // move the bubble
  void drift() {
    //    y += random(-3, -0.1);
    //    x += random(-1, 1);  
    //    if (y < -diameter*2) {
    //      y = height + diameter*2;
    //    }

    //    scale(0.5, 1.3);

    //    diameter += 0.2;
  }

  boolean rollover(int mx, int my) {
    if (dist(mx, my, x, y) < diameter/2) {
      mouse = true;
      return true;
    } 
    else { 
      mouse = false;
      return false;
    }
  }

  // labels
  void labels() {

    // tooltip with value
    if (mouse) {
      noStroke();
      fill(110, 110, 110, 100);
      rectMode(CORNER);
      rect(pmouseX+10, pmouseY+5, 105, 60);
      fill(255);    // 175, 120
      textFont(font, 14);
      textAlign(CORNER);
      text("mins: "+nf(mins, 1, 0)+
        "\nrptprd: "+nf(rptprd, 1, 0)+
        "\nhr:  "+nf(rpthr, 1, 0), pmouseX+20, pmouseY+20);
    }
  }
}

