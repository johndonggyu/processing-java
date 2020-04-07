float y = 20.0; //<>//
float y2 = 250.0;
float targetY = 200.0;
float easing = 0.04;
int direction = 1;

void setup() {
  size(400, 400);
  strokeWeight(2);
  smooth();
  frameRate(15);
}
void bg() {
  background(1, 33, 77); 
  pushMatrix();
  translate(200, 200);
  fill(#098668);
  ellipse(0, 150, 530, 150);
  fill(#9c6b16);
  rect(-60, 40, 10, 50);
  rect(-150, 50, 10, 50);
  rect(60, 40, 10, 50);
  rect(150, 50, 10, 50);
  fill(#036b64);
  arc(-55, 40, 40, 100, PI, TWO_PI);
  arc(-145, 50, 40, 100, PI, TWO_PI);
  arc(65, 40, 40, 100, PI, TWO_PI);
  arc(155, 50, 40, 100, PI, TWO_PI);
  popMatrix();
}
void stars() {
  if (y > 0) {
    fill(#63d7f3, random(150));
    for (int i=0; i<20; i++)
      ellipse(random(0, width), random(0, height/2), 5, 5);
  }
}
void sheep(float t) {
  pushMatrix();
  translate(200, t);
  fill(255);
  ellipse(8, 40, 55, 30);
  fill(#748687);
  arc(0, 30, 40, 50, PI, TWO_PI);
  fill(255);
  pushMatrix();
  scale(0.3);
  translate(-18, -22);
  ellipse(-15, 30, 45, 45);
  ellipse(55, 28, 50, 60);
  ellipse(20, 30, 80, 80);
  popMatrix();
  fill(255);
  ellipse(-5, 18, 8, 11);
  ellipse(10, 18, 8, 11);
  fill(0);
  ellipse(-5, 18, 3, 5); 
  ellipse(10, 18, 3, 5);
  fill(#748687);
  ellipse(-25, 15, 18, 8);
  ellipse(25, 15, 18, 8);
  fill(#748687);
  rect(-10, 50, 5, 10);
  rect(-17, 45, 5, 10);
  rect(10, 50, 5, 10);
  rect(17, 50, 5, 10);
  popMatrix();
}
void spaceship(float t) {
  fill(#cdeff9);
  pushMatrix();
  translate(200, t);
  ellipse(0, -2, 100, 52);
  fill(#afd8e6);
  ellipse(-8, -1, 80, 50);
  fill(#faffff);
  popMatrix();
  pushMatrix();
  translate(200, t-5);
  beginShape();
  vertex(-42, 0);
  for (int i=0; i<=15; i++)
    vertex(-35+i, 0-i);
  vertex(-27, -13);
  vertex(-29, -12);
  vertex(-31, -11);
  vertex(-33, -10);
  vertex(-34, -9);
  vertex(-36, -8);
  for (int i=0; i<6; i++)
    vertex(-37-i, -7+i);
  endShape();
  popMatrix();
  pushMatrix();
  translate(200, t);
  fill(#35bbb4);
  ellipse(0, 18, 200, 50);
  fill(#62c3c1);
  ellipse(0, 21, 200, 43);
  fill(random(100, 165), random(200, 250), random(220, 250));
  ellipse(-80, 20, 13, 8);
  ellipse(-50, 13, 13, 8);
  ellipse(-20, 10, 13, 8);
  fill(random(100, 165), random(200, 250), random(220, 250));
  ellipse(15, 10, 13, 8);
  ellipse(50, 13, 13, 8);
  ellipse(80, 20, 13, 8);
  fill(#027f79);
  ellipse(0, 30, 135, 22);
  fill(#a6c27b);
  ellipse(0, 33, 54, 16);
  fill(#fae296);
  ellipse(0, 33, 48, 13);
  fill(#01a59c);
  beginShape();
  for (int i=0; i<=4; i++)
    vertex(i-52, -i);
  for (int i=1, j=1; i<=6; i++, j+=6)
    vertex(25+j, -6+i);
  endShape();
  popMatrix();
}
void flash(float t) {
  translate(244, t+160);
  pushMatrix();
  translate(-64, -130);
  fill(#f9e395, 100);
  quad(0, 0, 40, 0, 100, 120, -60, 120);
  popMatrix();
}
void draw() {
  bg();
  stars();
  float d = dist(200, y, 0, targetY);
  if (y > -100) {
    if (d>1.0) {
      y += (targetY - y) * easing * direction;
    }
    //when spaceship is near goat
    if (y>targetY-10) {
      direction = -direction;
    }
    fill(100, 130, 0);

    //sheep
    if (y2 > 180 && direction == 1)
      sheep(y2);

    //spaceship
    spaceship(y);
    if (y >= targetY-50) {
      flash(y);
      y2-=2;
    }
  } else {
    fill(#ffc000);
    PFont font = loadFont("Arial-Black-48.vlw");
    textFont(font);
    text("The End", 100, 100);
    text("Madeby KDG", 35, 150);
  }
}
