class colorMenu {
  float x; 
  float y; 
  float z;
  float redA;
  float orangeA;
  float yellowA;
  float greenA;
  float tealA;
  float blueA;
  float purpleA;
  float pinkA;
  float whiteA;
  
  colorMenu() {
    this.x = -10;
    this.y = -200;
    this.z = 920;
    this.redA = 210;
    this.orangeA = 210;
    this.yellowA = 210;
    this.greenA = 210;
    this.tealA = 210;
    this.blueA = 210;
    this.purpleA = 210;
    this.pinkA = 210;
    this.whiteA = 200;
  }

  void drawMenu() {
    stroke(255, 255, 255, this.whiteA);
    strokeWeight(150);    
    point(this.x, this.y, this.z);
  }
   
  void colorWheel() {
    strokeWeight(80);
    
    stroke(240, 0, 0, this.redA);  // Red
    point(this.x, this.y, this.z - 70);
    
    stroke(255, 150, 0, this.orangeA);  // Orange
    point(this.x + 50, this.y, this.z - 50);
    
    stroke(255, 235, 0, this.yellowA);  // Yellow
    point(this.x + 70, this.y, this.z);
    
    stroke(130, 230, 0, this.greenA);  // Green
    point(this.x + 50, this.y, this.z + 50);
    
    stroke(0, 240, 240, this.tealA);  // Teal
    point(this.x, this.y, this.z + 70);
    
    stroke(70, 100, 255, this.blueA);  // Blue
    point(this.x - 50, this.y, this.z + 50);
    
    stroke(140, 25, 255, this.purpleA);  // Purple
    point(this.x - 70, this.y, this.z);

    stroke(255, 150, 200, this.pinkA);  // Pink
    point(this.x - 50, this.y, this.z - 50);
  }
  
  boolean inDrawMenuArea(float x, float y, float z) {
    return (x >= (this.x - 300) && x <= (this.x + 300) && 
      y >= (this.y - 1) && y <= (this.y + 25) &&
      z >= (this.z - 300) && z <= (this.z + 300));
  }
    
  boolean inDrawMenu(float x, float y, float z) {
      if (x >= (this.x - 30) && x <= (this.x + 30) && z >= (this.z - 30) && z <= (this.z + 30) && y < 0) {
         this.whiteA = 240;
         return true;
      }
      else {
        this.whiteA = 200;
        return false;
      }
  }
  
  boolean inRed(float x, float y, float z) {
    if (x >= (this.x - 15) && x <= (this.x + 15) && z >= (this.z - 80) && z <= (this.z - 40) && y < 0) {
      this.redA = 255; 
      return true;
    }
    else {
      this.redA = 210;
      return false;
    }
  }
  
  boolean inOrange(float x, float y, float z) {
    if (x >= (this.x + 35) && x <= (this.x + 65) && z >= (this.z - 60) && z <= (this.z - 20) && y < 0) {
      this.orangeA = 255; 
      return true;
    }
    else {
      this.orangeA = 210;
      return false;
    }
  }
  
  boolean inYellow(float x, float y, float z) {
    if (x >= (this.x + 45) && x <= (this.x + 85) && z >= (this.z - 20) && z <= (this.z + 20) && y < 0) {
      this.yellowA = 255; 
      return true;
    }
    else {
      this.yellowA = 210;
      return false;
    }
  }
  
  boolean inGreen(float x, float y, float z) {
    if (x >= (this.x + 35) && x <= (this.x + 65) && z>= (this.z + 40) && z <= (this.z + 80) && y < 0) {
      this.greenA = 255; 
      return true;
    }
    else {
      this.greenA = 210;
      return false;
    }
  }
  
  boolean inTeal(float x, float y, float z) {
    if (x >= (this.x - 15) && x <= (this.x + 15) && z >= (this.z + 60) && z <= (this.z + 100) && y < 0) {
      this.tealA = 255; 
      return true;
    }
    else {
      this.tealA = 210;
      return false;
    }
  }
  
  boolean inBlue(float x, float y, float z) {
    if (x >= (this.x - 65) && x <= (this.x - 35) && z >= (this.z + 40) && z <= (this.z + 80) && y < 0) {
      this.blueA = 255; 
      return true;
    }
    else {
      this.blueA = 210;
      return false;
    }
  }
  
  boolean inPurple(float x, float y, float z) {
    if (x >= (this.x - 85) && x <= (this.x - 55) && z >= (this.z - 20) && z <= (this.z + 20) && y < 0) {
      this.purpleA = 255; 
      return true;
    }
    else {
      this.purpleA = 210;
      return false;
    }
  }
  
  boolean inPink(float x, float y, float z) {
    if (x >= (this.x - 65) && x <= (this.x - 35) && z >= (this.z - 60) && z <= (this.z - 20) && y < 0) {
      this.pinkA = 255; 
      return true;
    }
    else {
      this.pinkA = 210;
      return false;
    }
  }
}