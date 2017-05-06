class Corner extends PVector {
  float factor;
  public Corner(float _x, float _y, float _factor) {
    x = _x;
    y = _y;
    factor = _factor;
  }
  final int dotDiameter = 10;
  void show() {
    pushStyle();
    fill(255);
    ellipse(x, y, dotDiameter, dotDiameter);
    popStyle();
  }
}