Corner corners[];

final int N = 3;
final int R = 300;

final int jumper_diameter = 5;
PVector jumper;

void setup() {
  size(640, 640);
  frameRate(100000);
  corners = new Corner[N];
  for(int i = 0; i < corners.length; i++) {
    corners[i] = new Corner(0,0,2);
    PVector.fromAngle(2 * PI * i / N,corners[i]);
    corners[i].setMag(R).add(new PVector(width/2,height/2));
  }
  jumper = new PVector(width/2, height/2);
  
  background(255);
  
  for (Corner c : corners) {
    c.show();
  }
  
  fill(#00FF00,32);
  noStroke();
  
  blendMode(MULTIPLY);
}

void draw() {
  int pick = (int)random(corners.length);
  PVector delta = corners[pick].copy().sub(jumper).div(corners[pick].fract);
  jumper.add(delta);

  ellipse(jumper.x, jumper.y, jumper_diameter, jumper_diameter);
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}