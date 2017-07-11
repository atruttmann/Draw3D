class cube {
  float size;
  float x; float y; float z;
  float r; float g; float b; float a;
  
  float pulseRate; int pulseDirection;
  float lowestOpacity; float highestOpacity;
  float smallestSize; float largestSize;
  
  cube(float size, float x, float y, float z, float r, float g, float b, float a) {
    this.size = size;
    this.x = x; this.y = y; this.z = z;
    this.r = r; this.g = g; this.b = b; this.a = a;
    this.pulseRate = random(0.015, 0.025);
    this.pulseDirection = 1;
    this.smallestSize = size - random(1, 5);
    this.largestSize = size + random(1, 5);
  }
  
  void drawCube() {
    pushMatrix();
    translate(this.x, this.y, this.z);
    box(this.size);
    popMatrix();
  }
  
  void pulse() {
     this.a += 15 * pulseRate * pulseDirection;     
     this.size += pulseRate * pulseDirection;
     if (this.size >= this.largestSize) { pulseDirection = -1; }
     if (this.size <= this.smallestSize) { pulseDirection = 1; }
  }
  
  float[] getRGBA() {
    float[] rgba = {this.r, this.g, this.b, this.a};
    return rgba;
  }
}