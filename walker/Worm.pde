class Worm {

  float[] x;
  float[] y;

  int cur = 0;

  Worm(float _x, float _y) {
    x = new float[line];
    y = new float[line];
    // init
    for (int i=0; i<line; ++i) {
      x[i] = _x;
      y[i] = _y;
    }
  }

  void run() {
    drawLines();
    move();
  }

  void drawLines() {
    
    for (int i=cur; (i<=cur && i >=0) || (i>cur+1 && i<line); --i) {
      //print(i);
      if (i==0) {
        if (cur != line-1) {
          line(x[i], y[i], x[line-1], y[line-1]);

          i = line;
        }
      } else {
        line(x[i], y[i], x[i-1], y[i-1]);
      }
    }
    //println("reach");
  }

  void move() {
    float speed = random(1, 10);
    int rate = (int)random(3);
    float newX = x[cur];
    float newY = y[cur];
    if (rate == 0) {
      //forward
      newX += speed;
    } else if (rate == 1) {
      //down
      newY += speed;
    } else {
      //up
      newY -= speed;
    }

    //next cur
    ++cur;
    if (cur>=line) {
      cur = 0;
    }
    x[cur] = newX;
    y[cur] = newY;
    //println("current " + cur);
  }
}

