//creates all the image variables for the app GUI
PImage time;
PImage homeButton;
PImage home;
PImage stress;
PImage bar;
PImage homeBar;
PImage outline;
PImage outlineBreathing;
PImage outlineHome;
PImage progress;
PImage activity;
PImage menu;
PImage settings;

//booleans to detect which screen is currently opened
boolean menuOn = false;
boolean homeOn = true;
boolean progressOn = false;
boolean stressOn = true;
boolean activityOn = false;
boolean practiceOn = false;
boolean settingsOn = false;

//sets the size of the circles for the breathing exercise
float circleSize = 50;

//creates variables for the fonts used
PFont quicksand;
PFont quicksandSmall;

int breathingRate = 15;  //sets the breathing rate sample data 
float stressLevel = map(breathingRate, 12, 30, 0, 10);  //converts the breathing rate to a stress level
float barX = map(stressLevel, 0, 10, 0, 600);  //variable to decide what the data bars should show depending on the breathing rate


void setup() {
  size(750,1624);  //size of the phone screen
  background(100);
  strokeWeight(0);

  //bottom code loads in all the image files
  time = loadImage("Time.png");
  homeButton = loadImage("HomeButton.png");
  home = loadImage("Home.png");
  stress = loadImage("Stress.png");
  bar = loadImage("Bar.png");
  homeBar = loadImage("HomeBar.png");
  outline = loadImage("Outline.png");
  outlineBreathing = loadImage("OutlineBreathing.png");
  outlineHome = loadImage("OutlineHome.png");
  progress = loadImage("Progress.png");
  activity = loadImage("Activity.png");
  menu = loadImage("Menu.png");
  settings = loadImage("Settings.png");
  
  //loads in the font files
  quicksand = createFont("Quicksand-Medium.ttf", 40);
  quicksandSmall = createFont("Quicksand-Medium.ttf", 30);
}

void draw() {
  if (homeOn) {  //if the home screen is on this will be shown
    if (breathingRate >= 22) {  //if the breathing rate is over 21 a message is shown at the top of the home screen
      home = loadImage("HomeStressed.png"); 
    }
    else {
      home = loadImage("Home.png"); 
    }
    
    //adds the bar at the bottom of the page showing the breathing rate
    image(home, 0, 0, width, height);
    image(homeBar, barX, 0, width, height);
    image(outlineHome, 0, 0, width, height);
    fill(100);
    textFont(quicksandSmall);
    text(breathingRate, barX + 62, height -120); 
    
    if (!practiceOn) {  //if the user is now starting an exercise, the exercise circles will still be shown
      fill(95, 106, 248, 51);
      ellipse(width/2, height/2, 568, 568);
      fill(95, 106, 248, 102);
      ellipse(width/2, height/2, 520, 520);
      fill(95, 106, 248, 153);
      ellipse(width/2, height/2, 478, 478);
      fill(95, 106, 248, 204);
      ellipse(width/2, height/2, 420, 420);
      fill(95, 106, 248, 255);
      ellipse(width/2, height/2, 364, 364);
      
      textFont(quicksand);
      textAlign(CENTER);
      fill(255);
      text("Start", width/2, height/2 - 35); 
      text("breathing", width/2, height/2 + 10); 
      text("exercise", width/2, height/2 + 55); 
    }
  }
  
  if (progressOn) {  //if the progress screen is on this is shown
    if (stressOn) {  //depending on the current open tab, this is for when the stess tab is on
      image(stress, 0, 0, width, height);
      image(bar, barX, 0, width, height);
      image(outline, 0, 0, width, height);
      fill(100);
      textFont(quicksandSmall);
      text(round(stressLevel), barX + 75, 584); 
      activityOn = false;
    }
    else {  //this is for when the breathing tab has been pressed
      image(progress, 0, 0, width, height);
      image(bar, barX, 0, width, height);
      image(outlineBreathing, 0, 0, width, height);
      fill(100);
      textFont(quicksandSmall);
      text(breathingRate, barX + 75, 584); 
    }
    
    if (activityOn) {  //if user pressed on bar chart in breathing tab, it will allow them to input an activity with this
      image(activity, 0, 0, width, height);
    }
  }
  
  if (settingsOn) {  //this shows up if the settings screen is on
    image(settings, 0, 0, width, height);
  }
  
  if (menuOn) {  //the menu shows up if menuOn is true
    image(menu, 0, 0, width, height);
    fill(80,80,100,180);
    rect(467,0,283,height);
    //the bottom three if statements check what screen the user is on while the menu is open, to highlight that choice in the menu
    if (homeOn) {
      fill(95,106,248,51);
      rect(0,665,467,111);
    }
    if (progressOn) {
      fill(95,106,248,51);
      rect(0,776,467,106);
    }
    if (settingsOn) {
      fill(95,106,248,51);
      rect(0,988,467,106);
    }
  }
  
  //adds the homebutton and time to make it look more like an actual iPhone screen
  image(homeButton, 0, 0, width, height);
  image(time, 0, 0, width, height);
}

void mouseReleased() {  //this checks if the mouse was pressed and released over certain parts in the app, to load the different screens
  //the bottom code opens and closes the menu, by checking if the user has pressed the menu button, and then the "x" button
  if (!menuOn) {
    if (mouseX >= 57 && mouseX <= 107 && mouseY >= 118 && mouseY <= 144) {
      menuOn = true;
    }
  }
  else {
    if (mouseX >= 57 && mouseX <= 91 && mouseY >= 114 && mouseY <= 148) {
      menuOn = false;
    }
    if (mouseX >= 467 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
      menuOn = false;
    }
  }
  
  //this checks where on the menu the user has pressed, to load up the different pages
  if (menuOn) {
    if (mouseX >= 0 && mouseX <= 467 && mouseY >= 665 && mouseY <= 776) {  //goes to home screen
      progressOn = false;
      activityOn = false;
      settingsOn = false;
      homeOn = true;
    }
    if (mouseX >= 0 && mouseX <= 467 && mouseY >= 776 && mouseY <= 882) {  //goes to progress screen
      homeOn = false;
      settingsOn = false;
      progressOn = true;
    }
    if (mouseX >= 0 && mouseX <= 467 && mouseY >= 988 && mouseY <= 1094) {  //goes to settings screen
      progressOn = false;
      activityOn = false;
      homeOn = false;
      settingsOn = true;
    }
  }
  
  //if on the progress page
  if (progressOn) {
    //if the breathing exercise button is pressed
    if (mouseX >= 54 && mouseX <= 695 && mouseY >= 1370 && mouseY <= 1552) {
      progressOn = false;
      activityOn = false;
      homeOn = true;
    }
    //if the bar chart is pressed while on the breathing page, the "input activity" bubble appears
    if (stressOn) {
      activityOn = false;
    }
    else if (mouseX >= 54 && mouseX <= 695 && mouseY >= 870 && mouseY <= 1220) {
      activityOn = true;
    }
    
    //these next two if statements checks if the user is on the stress or on the breathing tab in the progress page
    if (mouseX >= 54 && mouseX <= 376 && mouseY >= 280 && mouseY <= 356) {
      stressOn = true;
    }
    if (mouseX >= 376 && mouseX <= 698 && mouseY >= 280 && mouseY <= 356) {
      stressOn = false;
    }
  }
  
  //this checks if the breathing exercise area if pressed
  if (!practiceOn && homeOn) {
    if (mouseX >= 91 && mouseX <= 659 && mouseY >= 528 && mouseY <= 1096) {
      //practiceOn = true;
    }
  }
}
