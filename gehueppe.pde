Corner corners[];

final int N = 5;
final int R = 300;

final int jumper_diameter = 5;
PVector jumper;

void setup() {
  size(640, 640);
  frameRate(1000);

  //Corner configuartion
  corners = new Corner[N];
  for (int i = 0; i < corners.length; i++) {
    corners[i] = new Corner(0, 0, 0.5);
    PVector.fromAngle(TWO_PI * i/N - HALF_PI, corners[i]);
    corners[i].setMag(R).add(new PVector(width/2, height/2));
  }
  jumper = new PVector(width/2, height/2);


  background(255);
  for (Corner c : corners) {
    c.show();
  }
  fill(#00FF00, 32);
  noStroke();
  blendMode(MULTIPLY);
}

//Pick function
int pick_function(int prev_pick, int min_pick, int max_pick) {
  int next_pick;
  do {
    next_pick = (int)random(min_pick, max_pick);
  } while((prev_pick - next_pick + max_pick)%max_pick==1);
  return next_pick;
}
int pick;
void draw() {
  pick = pick_function(pick, 0, corners.length);
  PVector delta = corners[pick].copy().sub(jumper).mult(corners[pick].factor);
  jumper.add(delta);

  ellipse(jumper.x, jumper.y, jumper_diameter, jumper_diameter);
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}