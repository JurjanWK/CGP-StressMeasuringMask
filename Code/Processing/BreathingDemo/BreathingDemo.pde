//creates variable for the home page image
PImage home;

//creates variable for the font
PFont quicksand;

//variable to check if the user has started the exercise or not
boolean practiceOn = false;

float size = 568;  //sets size of circles
boolean direction = false;  //sets direction of circles, so if they are getting bigger or smaller

int breathingRate = 17;  //input sample breathing rate
float stressLevel = map(breathingRate, 12, 30, 0, 10);  //converts breathing rate to stress level
float barX = map(stressLevel, 0, 10, 0, 600);  //sets the coordinates the breathing and stress bar should be at

void setup() {
  size(750,1624);  //sets size of phone screen
  background(100);
  strokeWeight(0);
  frameRate(120);
  
  home = loadImage("Home.png");  //loads in home image
  
  quicksand = createFont("Quicksand-Medium.ttf", 40);  //loads in font
}

void draw() {
  image(home, 0, 0, width, height);  //loads in home screen image
  
  //bottom code creates the circles using the size variable
  fill(95, 106, 248, 51);
  ellipse(width/2, height/2, size, size);
  fill(95, 106, 248, 102);
  ellipse(width/2, height/2, size - 48, size - 48);
  fill(95, 106, 248, 153);
  ellipse(width/2, height/2, size - 90, size - 90);
  fill(95, 106, 248, 204);
  ellipse(width/2, height/2, size - 148, size - 148);
  fill(95, 106, 248, 255);
  ellipse(width/2, height/2, size - 204, size - 204);
    
  if (!practiceOn) { //if the exercise button has not been pressed yet
    textFont(quicksand);
    textAlign(CENTER);
    fill(255);
    text("Start", width/2, height/2 - 35); 
    text("breathing", width/2, height/2 + 10); 
    text("exercise", width/2, height/2 + 55); 
  }
  else {  //if the exersize button has been pressed the size of the circles change every time the draw function runs, depending on the direction they get bigger or smaller
    println(size);
    if (size >= 398 && !direction) {
      size -= 5.5;
      fill(150);
      text("Breathe out", width/2, height/2 - 400); 
    }
    if (size >= 368 && size <= 398 && !direction) {
      size -= 3;
      fill(150);
      text("Breathe out", width/2, height/2 - 400); 
    }
    if (size < 368) {
      direction = true;
    }
    if (size <= 538 && direction) {
      size += 5.5;
      fill(150);
      text("Breathe In", width/2, height/2 - 400); 
    }
    if (size <= 568 && size >= 538 && direction) {
      size += 3;
      fill(150);
      text("Breathe In", width/2, height/2 - 400); 
    }
    if (size > 568) {
      direction = false;
    }
    
  }
}

//checks if the mouse has been pressed on the exercise button
void mouseReleased() {
  if (mouseX >= 91 && mouseX <= 659 && mouseY >= 528 && mouseY <= 1096) {
    practiceOn = true;
  }
}
