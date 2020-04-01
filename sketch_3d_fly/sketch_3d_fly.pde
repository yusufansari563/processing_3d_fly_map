int rows, cols ;
int scl = 10;
int w = 2000;
int h = 2000;
float[][] frame;
float floot = 0;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  frame = new float[cols][rows];
  
}
void draw() {
  background(0,204,204);
  stroke(224,224,224);
  noFill();
  floot  -= 0.6;
  float yoff = floot;
  for (int y = 0; y < cols; y++) {
    float xoff = 0;
    for (int x = 0; x < rows; x++) {
      frame[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < cols-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < rows; x++) {
      vertex(x*scl, (y+1)*scl, frame[x][y]); 
      vertex(x*scl, y*scl, frame[x][y+1]); 
      //rect(x*scl,y*scl,scl,scl);
    }
    endShape();
  }
}
