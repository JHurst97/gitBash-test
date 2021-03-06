void setup() {
  size(displayWidth, displayHeight, P3D);
  calcMap();
  smooth();
}

int value;
int scl = 2;
int rows, cols;
float[][] noiseMap;
float xOff = 0, yOff = 0;
float xNoise = 0, yNoise = 0;
float inc = 0.05;

void draw() {
  background(51);
  translate(0, height * 0.7);
    rotateX(4.222);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      push();
      noFill();
      stroke(map(noiseMap[i][j],0,1,200,50));
      translate(j*scl, (i*scl) - 280, map(noiseMap[i][j], 0, 1, -100, 100));
      point(scl, scl, scl);
      pop();
    }
  }
  
  calcMap();
  
}

void calcMap() {
  rows = width / scl;
  cols = 1000;
  noiseMap = new float [cols][rows];
  //scl += 1;
  float xOff = xNoise;
  for (int i = 0; i < cols; i++) {
    float yOff = yNoise;
    for (int j = 0; j < rows; j++) {
      noiseMap[i][j] = noise(xOff, yOff);
      yOff += inc;
    }
    xOff += inc;
  }
}

void keyPressed(){
  saveFrame("output/line-######.png");
}
