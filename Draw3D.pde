import processing.vr.*;

import cassette.audiofiles.SoundFile;
SoundFile music;

import ketai.sensors.*;
KetaiSensor sensor;
float accelerometerX;
float accelerometerY;

import android.app.Activity;
import android.content.Context;
import android.os.Vibrator;
Activity act;
float lastVibrateEvent = 0;

// Cube data
ArrayList<cube> cubes = new ArrayList<cube>();
float pressDuration = 0;
String currentColor = "white";

// Instructions
instructions inst;
boolean displayInstructions = true;

// Menu
colorMenu menu = new colorMenu();
boolean menuOpen = false;
boolean menuHover = false;
boolean selectRed = false;
boolean selectOrange = false;
boolean selectYellow = false;
boolean selectGreen = false;
boolean selectTeal = false;
boolean selectBlue = false;
boolean selectPurple = false;
boolean selectPink = false;
boolean selectWhite = false;

// Reticule
float strokeweight = 10;

void setup() {
  fullScreen(PVR.STEREO);
  music = new SoundFile(this, "Ambient.mp3");
  music.loop();
  sensor = new KetaiSensor(this);
  sensor.start();
  
  PGraphicsVR pvr = (PGraphicsVR)g;
  float d = 200;
  float x = pvr.cameraX + d * pvr.forwardVector[0];
  float z = pvr.cameraZ + d * pvr.forwardVector[2];
  inst = new instructions(x, z);
  
  act = this.getActivity();
}

void draw() { 
  background(0);
  ambientLight(150, 150, 150);
  directionalLight(100, 100, 100, 0, -1, 0);
  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);
  
  textSize(20);
  textAlign(CENTER);
  
  PGraphicsVR pvr = (PGraphicsVR)g;
  float d = 200;
  float x = pvr.cameraX + d * pvr.forwardVector[0];
  float y = pvr.cameraY + d * pvr.forwardVector[1];
  float z = pvr.cameraZ + d * pvr.forwardVector[2];
  
  for (cube c : cubes) {
    c.pulse();
    float[] rgba = c.getRGBA();
    fill(rgba[0], rgba[1], rgba[2], rgba[3]);
    c.drawCube();   
  }

  // Instructions
  if (displayInstructions) {
    inst.drawInstructions(); 
  }
  
  // Visual reticule and menu
  else {
    
    menu.drawMenu();
  
    if (menu.inDrawMenu(x, y, z) && !menuOpen) {
      menuHover = true;
    }
    else if (menuOpen) {
      menu.colorWheel();
      
      // Keep track of last color hovered over
      if (menu.inRed(x, y, z)) {
        selectRed = true;

        selectOrange = false; selectYellow = false; selectGreen = false;
        selectTeal = false; selectBlue = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inOrange(x, y, z)) {
        selectOrange = true;
        
        selectRed = false; selectYellow = false; selectGreen = false;
        selectTeal = false; selectBlue = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inYellow(x, y, z)) {
        selectYellow = true;
        
        selectRed = false; selectOrange = false; selectGreen = false;
        selectTeal = false; selectBlue = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inGreen(x, y, z)) {
        selectGreen = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectTeal = false; selectBlue = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inTeal(x, y, z)) {
        selectTeal = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectGreen = false; selectBlue = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inBlue(x, y, z)) {
        selectBlue = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectGreen = false; selectTeal = false; selectPurple = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inPurple(x, y, z)) {
        selectPurple = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectGreen = false; selectTeal = false; selectBlue = false;
        selectPink = false; selectWhite = false;
      }
      else if (menu.inPink(x, y, z)) {
        selectPink = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectGreen = false; selectTeal = false; selectBlue = false;
        selectPurple = false; selectWhite = false;
      }
      else if (menu.inDrawMenu(x, y, z)) {
        selectWhite = true;
        
        selectRed = false; selectOrange = false; selectYellow = false;
        selectGreen = false; selectTeal = false; selectBlue = false;
        selectPurple = false; selectPink = false;
      }
    }
    // If nothing is being hovered over
    else {
      menuHover = false;
      
      selectRed = false; selectOrange = false; selectYellow = false;
      selectGreen = false; selectTeal = false; selectBlue = false;
      selectPurple = false; selectPink = false; selectWhite = false;
    }
  
    // Reticule
    stroke(255, 255, 255);
    if (mousePressed && strokeweight < 125 && !menu.inDrawMenuArea(x, y, z)) {
      strokeweight += 0.25; 
    }
    strokeWeight(strokeweight);
    point(x, y, z);
    noStroke();
  }
}

// Clears screen on rotation
void onAccelerometerEvent(float x, float y, float z) {
  accelerometerX = x;
  accelerometerY = y;
  if (accelerometerX <= 2 && accelerometerX >= -2
    && abs(accelerometerY) >= 8 && abs(accelerometerY) <= 10) {
    cubes.clear();

    // Don't vibrate continuously when rotating to clear
    float currentTime = millis();
    if (currentTime - lastVibrateEvent > 3000) {
      Vibrator vibrer = (Vibrator) act.getSystemService(Context.VIBRATOR_SERVICE);
      vibrer.vibrate(300);
      lastVibrateEvent = millis();
    }
  }
}

void mousePressed() {
  pressDuration = millis();
  strokeweight += 10;
}

void mouseReleased() {
  strokeweight = 10;
  
  PGraphicsVR pvr = (PGraphicsVR)g;
  float d = random(400, 700);
  float x = pvr.cameraX + d * pvr.forwardVector[0];
  float y = pvr.cameraY + d * pvr.forwardVector[1];
  float z = pvr.cameraZ + d * pvr.forwardVector[2];
  float x2 = pvr.cameraX + 200 * pvr.forwardVector[0];
  float y2 = pvr.cameraY + 200 * pvr.forwardVector[1];
  float z2 = pvr.cameraZ + 200 * pvr.forwardVector[2];
  
  float duration = millis() - pressDuration;
  
  // Dismiss instructions
  if (displayInstructions) {
    displayInstructions = false;
  }
  
  // Close menu and update currentColor 
  else if (menuOpen) {
    menuOpen = false;

    if (selectRed) {
      currentColor = "red"; 
    }
    else if (selectOrange) {
      currentColor = "orange"; 
    }
    else if (selectYellow) {
      currentColor = "yellow"; 
    }
    else if (selectGreen) {
      currentColor = "green"; 
    } 
    else if (selectTeal) {
      currentColor = "teal"; 
    }
    else if (selectBlue) {
      currentColor = "blue"; 
    }
    else if (selectPurple) {
      currentColor = "purple"; 
    } 
    else if (selectPink) {
      currentColor = "pink"; 
    }
    else if (selectWhite) {
      currentColor = "white"; 
    }
  }
  
  // Open the menu
  else if (menuHover) {
    menuOpen = true;
  }
  
  // Create cube, don't draw in menu area
  else if (!menu.inDrawMenuArea(x2, y2, z2)) {
    float size = duration/5;
    if (size < 50) {
       size = 50; 
    }
    else if (size > 200) {
       size = 200; 
    }
    
    float a = random(180, 240);
    generateColor newColor = new generateColor(currentColor);
    float[] rgb = newColor.getRGB();
    cubes.add(new cube(size, x, y, z, rgb[0], rgb[1], rgb[2], a));
  }
}