class Corner extends PVector {
  int fract;
  public Corner(float _x, float _y, int _fract) {
    x = _x;
    y = _y;
    fract = _fract;
  }
  final int dotDiameter = 10;
  void show() {
    pushStyle();
    fill(255);
    ellipse(x, y, dotDiameter, dotDiameter);
    popStyle();
  }
}