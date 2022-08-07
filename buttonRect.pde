class buttonRect extends button {
  int x, y;
  int w, h;
  
  buttonRect(int _x, int _y, int _w, int _h, color _s, color _us) {
    super(_s, _us);
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
  void update(int mx, int my) {
    if (mx > x && mx < x+w && my > y && my < y+h) {
      isMouseOver = true;
    } else {
      isMouseOver = false;
    }
  }
  
  void drawButton() {
    rect(x, y, w, h);
    textSize(30);
    fill(0);
    text("Start Over", 825,60);
  }
}
