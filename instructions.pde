class instructions {
  float x; float z;
 
  instructions(float x, float z) {
    this.x = x;
    this.z = z;
  }
  
  void drawInstructions() {
    scale(1,-1);
    fill(255);
    text("Welcome to Draw3D!\n\nTap to create a cube.\nLook down for color menu.\nRotate vertically to clear screen.\n\nTap to dismiss this screen.", this.x/1.75, 0, this.z/1.75);
  }
}