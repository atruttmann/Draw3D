class generateColor {
  String c;
  
  generateColor(String c) {
    this.c = c;
  }
  
  float[] getRGB() {
    float[] rgb = new float[3];
    
    if (c.equals("red")) {
      rgb[0] = random(175, 255);
      rgb[1] = random(0, 60);
      rgb[2] = rgb[1] + random(-20, 10);
    }
    else if (c.equals("orange")) {
      rgb[0] = random(210, 255);
      rgb[1] = rgb[0] - random(120, 150);
      rgb[2] = random(0, 50);
    }
    else if (c.equals("yellow")) {
      rgb[0] = random(175, 255);
      rgb[1] = rgb[0] - random(50, 70);
      rgb[2] = random(0, 50);
    }
    else if (c.equals("green")) {
      rgb[0] = random(0, 150);
      rgb[1] = random(175, 255);
      rgb[2] = rgb[0] + random(-40, 10);
    }
    else if (c.equals("teal")) {
      rgb[0] = random(5, 100);
      rgb[1] = random(175, 255);
      rgb[2] = rgb[1] + random(-10, 30);
    }
    else if (c.equals("blue")) {
      rgb[0] = random(0, 80);
      rgb[1] = rgb[0] + random(-20, 20);
      rgb[2] = random(175, 255);
    }
    else if (c.equals("purple")) {
      rgb[0] = random(150, 200);
      rgb[1] = random(0, 75);
      rgb[2] = rgb[0] + random(20, 60);
    }
    else if (c.equals("pink")) {
      rgb[0] = random(240, 255);
      rgb[1] = random(80, 120);
      rgb[2] = random(140, 180);
    }
    else {   // White
      rgb[0] = random(245, 255);
      rgb[1] = rgb[0];
      rgb[2] = rgb[0];
    }
    return rgb;
  }
}