//import //<>// //<>//
import java.util.Stack;

//global phase
int phase = 1;
int sec = second();
boolean hint = false; //help(hint) box clicked or not
boolean PM = false; //phaseMessage appeared or not

/////////////phase 1
//intro page
PFont font1;
PFont ding1;
PImage img1;
String welcome = "W elcome to visit SOHWAGHAENG.KR";
int w = 440;
int i = 0;
int j = 50;
int cnt = 0;
boolean intro = false;
boolean admin = false;

//////////////////////
///////////////phase 2
Stack<Integer> arr2 = new Stack<Integer>();
int again = 0; //password error try it again!
int moveX=0, moveY=0, dragX=0, dragY=0;
boolean crack = false; //password crack enable/disable
//////////////////////
//////////////phase 3
int[][] numlist = new int[26][26];
int f = 0;
PImage img2;
//////////////////////
//////////////phase 4


void setup() {
  size(1920, 1080);
  smooth();
  noStroke();
  font1 = loadFont("Arial-Black-48.vlw");
  ding1 = loadFont("AristotelicaIcons-Regular-48.vlw");
  img1 = loadImage("intro.jpg");

  //phase 3
  for (int i=0; i<numlist.length; i++)
    for (int j=0; j<numlist[i].length; j++)
      numlist[i][j] = 9;
  img2 = loadImage("phase3.jpg");

  //phase 4

}
void draw() {
  if (phase == 1) {
    phase1();
  } else if (phase == 2) {
    phase2();
    if (phase == 3)
      hint = false;
  } else if (phase == 3) {
    phase3();
    if (phase == 4)
      hint = false;
  } else if (phase == 4) {
    phase4();
    if (phase == 5)
      hint = false;
  } else if (phase == 5) {
    phase5();
    if (phase == 6)
      hint = false;
  }
}

void mouseMoved() {
  if (phase == 2) {
    if (crack == false) {
      moveX = mouseX;
      moveY = mouseY;
    }
  }
  cursor(ARROW);
  ///////base
  //hint box
  if ((mouseX >= 1812 && mouseX <= 1912) && (mouseY >= 0 && mouseY <= 50) && (hint == false)) {
    cursor(HAND); //on the hint box
  }
  ///////phase 1
  if (phase == 1) {
    //rect circle to phase 2
    if ((mouseX >= 1180 && mouseX <= 1250) && (mouseY >= 430 && mouseY <= 630)) {
      cursor(HAND);
    } else if ((intro == false) && (mouseX >= 815 && mouseX <= 895) && (mouseY >= 0 && mouseY <= 50)) {
      cursor(HAND); //on the intro
    } else if ((mouseX >= 815 && mouseX <= 915) && (mouseY >= 100 && mouseY <= 150) && admin == false && intro == true) {
      cursor(HAND); //on the admin after clicked intro
    } else {
      cursor(ARROW);
    }
  }
  /////////phase 4
  if (phase == 4){
   if ((mouseX >= 620 && mouseX <= 780) && (mouseY >= 560 && mouseY <= 640)){
      cursor(HAND);
   }
   if ((mouseX >= 1010 && mouseX <= 1210) && (mouseY >= 560 && mouseY <= 640)){
      cursor(HAND);
   }
  }
}
void mouseDragged() {
  //phase 2 drag password cracker
  if (phase == 2) {
    dragX = mouseX;
    dragY = mouseY;
  }
}
void mouseClicked() {
  /////////////base
  //help box appears
  if ((mouseX >= 1812 && mouseX <= 1912) && (mouseY >= 0 && mouseY <= 50)) {
    if (hint == false) hint = true;
  }
  //////////////phase 1
  if (phase == 1) {
    //rect circle on the image, let go to phase 2
    if ((mouseX >= 1180 && mouseX <= 1250) && (mouseY >= 430 && mouseY <= 630)) {
      hint = false;
      phase = 2; ///////////////////////////////go to phase 2
    }
    //url /intro interacts
    if ((mouseX >= 765 && mouseX <= 845) && (mouseY >= 0 && mouseY <= 50)) {
      if (intro == false ) intro = true;
    }
    if ((mouseX >= 765 && mouseX <= 865) && (mouseY >= 100 && mouseY <= 150)) { //admin clicked
      admin = true;
    }
  }
  //////////////phase 3
  if (phase == 3) {
    if ((mouseX >= 760 && mouseX <= 1260) && (mouseY >= 310 && mouseY <= 820)) {
      for (int i=0, a=0; i<500; i+=20, a++) {
        for (int j=0, b=0; j<500; j+=20, b++) {
          if ((mouseX >= 760+i && mouseX <= 760+i+20) && (mouseY >= 310+j && mouseY <= 310+j+20)) {
            if (numlist[a][b] != 0)
              numlist[a][b]--;
          }
        }
      }
    }
  }
  //////////////phase 4
  if (phase == 4){
   //rect(800,560,170,90);
   if ((mouseX >= 800 && mouseX <= 970) && (mouseY >= 560 && mouseY <= 650)){
      phase = 5; 
   }
  }
}
void mouseReleased() {
  if (phase == 2) {
    if (dragX != 0 && (mouseX >= 885 && mouseX <= 1085) && (mouseY >= 390 &&  mouseY <= 420)) {
      crack = true;
    }
  }
}
void keyPressed() {
  //phase 2
  if (phase == 2) {
    if (arr2.size() < 4) {
      if (key == '1') arr2.push(1);
      if (key == '2') arr2.push(2);
      if (key == '3') arr2.push(3);
      if (key == '4') arr2.push(4);
      if (key == '5') arr2.push(5);
      if (key == '6') arr2.push(6);
      if (key == '7') arr2.push(7);
      if (key == '8') arr2.push(8);
      if (key == '9') arr2.push(9);
      if (key == '0') arr2.push(0);
    }
    if (arr2.size() != 0) {
      if (key == BACKSPACE) arr2.pop();
    }
    if (key == ENTER) {
      int n1=0, n2=0, n3=0, n4=0;
      if (arr2.size() < 4) {
        phaseMessage("Try again!");
        again++;
        arr2.clear();
      } else if (arr2.size() == 4) {
        n4 = arr2.pop();
        n3 = arr2.pop();
        n2 = arr2.pop();
        n1 = arr2.pop();
      }
      if (n4 == 7 && n3 == 1 && n2 == 3 && n1 == 0) {
        phaseMessage("PHASE 2 CLEARED");
        hint = false;
        phase = 3;
      } else {
        phaseMessage("Try again!");
        again++;
      }
    }
  }
  if (phase == 3) {
    if (key == ' ') {
      for (int q=0; q<40; q++) {
        float i = random(0, 25);
        float j = random(0, 25);
        int a = int(i);
        int b = int(j);
        if (numlist[a][b] != 0) {
          numlist[a][b]--;
        }
      }
    }
  }
  if (phase == 4) {
    
  }
}
/////////////////////////////////////BASE///////////////////////////
void base() { //url bar, window, status bar
  rect(0, 0, width, height);
  //url bar at intro page
  fill(255);
  stroke(100);
  strokeWeight(10);
  rect(0, 0, width, 50);
  fill(240, 240, 240);
  rect(0, 0, 250, 50);
  //arrow left
  stroke(95, 100, 100);
  strokeWeight(5);
  line(20, 24, 30, 34);
  line(20, 24, 40, 24);
  line(20, 24, 30, 14);
  //arrow right
  line(80, 24, 70, 34);
  line(60, 24, 80, 24);
  line(80, 24, 70, 14);
  //refresh icon
  textFont(ding1);
  fill(95, 100, 100);
  noStroke();
  textSize(40);
  text("r", 95, 39);
  //home icon
  textSize(45);
  text("a", 135, 40);
  //URL:
  textFont(font1);
  textSize(30);
  text("URL", 175, 38);
}
void helpBox(String str) {
  //help box(hint box drawing)
  stroke(95, 100, 100);
  strokeWeight(10);
  fill(255);
  rect(1812, 0, 100, 50);
  textFont(font1);
  textSize(30);
  fill(0);
  text("HELP", 1819, 34);
  //hint box appear (true/false)
  if (hint) { //appears
    fill(255);
    strokeWeight(10);
    rect(1600, 50, 310, 200);
    textFont(font1);
    textSize(20);
    fill(0);
    text(str, 1610, 70, 300, 200);
  }
}
void typeURL(String str) {
  text(str, 260, 38);
}
void cursorBlink(float a, float b) {
  if (second() % 2 == 0) {
    text("|", a, b);
  } else {
    text("", a, b);
  }
}
void phaseMessage(String str) {
  sec = second();
  fill(255);
  stroke(95, 100, 100);
  rect(840, 500, 350, 50);
  fill(0);
  textAlign(CENTER);
  text(str, 850, 520, 350, 50);
  textAlign(LEFT);
  PM = true;
}
////////////////////////////////////PHASES///////////////////////////
void phase1() {
  //phase 1
  //background
  strokeWeight(10);
  // bg with welcome to visit ... blurs
  fill(0, j);
  j-=2;
  if (j <= 0) {
    j = 0;
  }
  base();
  //http://WWW.SOHWAGHAENG.KR/intro
  typeURL("HTTP://WWW.SOHWAGHAENG.KR/");
  fill(255, 50, 50);
  if (admin) {
    text("admin", 820, 37);
    hint = false;
    phase = 2; ////////////////////////go to phase 2
  } else text("intro", 820, 37);
  //intro image
  image(img1, 680, 240, 600, 600);
  //Copyright at Intro site
  textFont(font1);
  textSize(20);
  text("Copyright \u00a9 2019 Kim Dong Gyu. All rights reserved", 700, 900);
  //welcome to visit our site.
  fill(255);
  textSize(48);
  if (cnt != 2) {
    if (i < welcome.length() ) {
      text(welcome.charAt(i), w, 200);
      w += 35; 
      i++;
      if (i == welcome.length()) {
        i = 0;
        w = 440;
        cnt++;
      }
    }
  }
  helpBox("If you want to go to next step, you should find the Easter egg from this web site! \nHints: Red Colored Text or Image");
  if (intro) { //appears
    fill(255);
    strokeWeight(10);
    rect(805, 50, 125, 90);
    fill(255, 0, 0);
    if (admin) fill(0);
    textFont(font1);
    textSize(30);
    text("/intro", 815, 90);
    fill(0);
    if (admin) fill(255, 0, 0);
    text("/admin", 815, 120);
  }
}
void phase2() { //1920 x 1080
  if (PM) { //if there is phaseMessage appeared, wait for several seconds
    delay(1000);
    PM = false;
  }
  //phase 2
  //background
  strokeWeight(10);
  base();
  //http://WWW.SOHWAGHAENG.KR/intro
  typeURL("HTTP://WWW.SOHWAGHAENG.KR/Phase2");

  //login form
  fill(255);
  textFont(font1);
  text("LOGIN", 900, 300);
  stroke(95, 100, 100);
  rect(885, 340, 200, 30); //ID Form
  rect(885, 390, 200, 30); //PW Form
  textSize(25);
  fill(255);
  text("ID", 830, 367);
  text("PW", 820, 417);
  fill(255, 0, 0);
  text("201710895", 890, 367);
  //cursor blinking
  cursorBlink(890, 412);
  for (int i=0, j = 0; i<arr2.size(); i++, j+=14) {
    text(arr2.get(i), 890+j, 417);
  }
  //password cracker
  if (again >= 3) {
    fill(255);
    stroke(95, 100, 100);
    if (crack == false) {
      rect(dragX, dragY, 280, 40);
      fill(255, 0, 0);
      text("Password Cracker", dragX+10, dragY+10, 300, 50);
    }
    if (crack == true) {
      if ((dragX >= 885 && dragX <= 1085) && (dragY >= 390 &&  dragY <= 430)) {
        if (dragX != 885) {
          if (dragX > 885) {
            dragX--;
          }
          if (dragX < 885)
            dragX++;
        }
        if (dragY != 430) {
          if (dragY > 430) {
            dragY--;
          } 
          if (dragY < 430)
            dragY++;
        }
        rect(dragX, dragY, 280, 40);
        fill(0, 0, 255);
        text("Password Cracking", dragX+10, dragY+10, 300, 50);
      }
      if (dragX == 885 && dragY == 430) {
        arr2.clear();
        arr2.push(0);
        arr2.push(3);
        arr2.push(1);
        arr2.push(7);
      }
    }
  }
  helpBox("ID is already given for you, you just have to guess what the password is. Hints: 4 digits. And if you miss 3times, I will give you a tool to crack the password for once."); //at the last
}
void phase3() {
  int result = 0;
  if (PM) { //if there is phaseMessage appeared, wait for several seconds
    delay(1000);
    PM = false;
  }
  //phase 3

  //background
  strokeWeight(10);
  base();
  //http://WWW.SOHWAGHAENG.KR/intro
  typeURL("HTTP://WWW.SOHWAGHAENG.KR/Phase3");

  //encryption tables
  fill(0);
  stroke(95, 100, 100);
  strokeWeight(1);
  rect(760, 310, 500, 500);
  textFont(font1);
  fill(255);
  text("PRESS SPACE KEY or MOUSE LEFT BUTTON", 400, 900);
  textSize(10);
  for (int i=0, a=0; i<500; i+=20, a++) {
    for (int j=0, b=0; j<500; j+=20, b++) {
      switch(numlist[a][b]) {
      case 9: 
        f = 0; 
        break;
      case 8: 
        f = 50;
        break;
      case 7: 
        f = 75; 
        break;
      case 6: 
        f = 190; 
        break;
      case 5: 
        f = 125;
        break;
      case 4: 
        f = 150;
        break;
      case 3: 
        f = 175;
        break;
      case 2: 
        f = 200; 
        break;
      case 1: 
        f = 225; 
        break;
      case 0: 
        f = 255;
        break;
      }
      fill(f);
      rect(760+i, 310+j, 20, 20);
      fill(255);
      text(str(numlist[a][b]), 768+i, 322+j);
      result += numlist[a][b];
    }
  }
  //helpBox
  helpBox("You should decrpyt the encryption. You can either click it or press space to decrpyt it."); //at the last
  if (result == 0) {
    image(img2, 760, 310, 500, 500);
    textSize(25);
    pushMatrix();
    translate(0, -300);
    phaseMessage("PHASE 3 CLEARED");
    popMatrix();
    phase = 4;
  }
}
void phase4() {
  if (PM) { //if there is phaseMessage appeared, wait for several seconds
    delay(3000);
    PM = false;
  }
  //phase 4
  //background
  strokeWeight(10);
  base();
  //http://WWW.SOHWAGHAENG.KR/intro
  typeURL("HTTP://WWW.SOHWAGHAENG.KR/Phase4");

  textFont(font1);
  textSize(120);
  fill(255);
  text("Who Are You?", 500, height/2);
  textSize(100);
  text("He OR She", 630, height/2+100);
  
  //helpBox
  helpBox("Pick the one answer. Hints: cursor with hand is not always means buttons."); //at the last
}
void phase5(){
  strokeWeight(10);
  base();
  typeURL("HTTP://WWW.SOHWAGHAENG.KR/TheEnd");
  fill(255);
  stroke(95, 100, 100);
  rect(540, 500, 850, 50);
  fill(0);
  textAlign(CENTER);
  text("Enjoy Analysing Vulnerabilities!", 550, 520, 850, 50);
  textAlign(LEFT);
  //helpBox
  helpBox("That's all. This is the end of page. Thank you for visit our site."); //at the last
}
