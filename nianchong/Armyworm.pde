class ArmyWorm {

  Queue<Point> queue;
  float curX;
  float curY;

  ArmyWorm(float x, float y) {
    queue = new LinkedList<Point>();

    // put new point to queue
    curX = x;
    curY = y;
    queue.offer(new Point(curX, curY));
  }

  void run() {
    drawLine();
    move();
  }

  void drawLine() {

    float x1 = 0;
    float y1 = 0;
    float x2 = 0;
    float y2 = 0;

    boolean init = false;

    for (Point p : queue) {
      if (init == false){
        x1 = p.x;
        y1 = p.y;
        init = true;
      } else {
        x2 = p.x;
        y2 = p.y;
        stroke(255);
        line(x1, y1, x2, y2);
        x1 = x2;
        y1 = y2;
      }
    }
  }

  void move() {

    float speed = random(5, 10);
    int rate = (int)random(3);
    if (rate == 0) {
      curX += speed;
    } else if (rate == 2) {
      curY += speed;
    } else {
      curY -= speed;
    }

    if(curX < 0){
       curX = 0;
    }else if (curX > width){
       curX = width;
    }    
    
    if(curY < 0){
      curY = 0;
    } else if (curY >height){
     curY = height;
    }

    queue.offer(new Point(curX, curY));
    
    if (queue.size() > size){
      queue.remove();      
    }
  }
}

