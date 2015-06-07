

class Snake {

  int curX;
  int curY;

  boolean stop = false;

  Queue<Point> queue;

  Snake(int _x, int _y) {
    curX = _x;
    curY = _y;

    queue = new LinkedList<Point>();
    queue.offer(new Point(curX, curY));

    stop = false;
  }

  void run() {
    if (!stop) {
      move();
      fill(255);
      display();
      collision();
    } else {
      fill(110);
       display(); 
    }
  }

  void display() {
    for (Point p : queue) {
      rect(p.x, p.y, size, size);
    }
  }

  void move() {
    if (direction == DIR_TOP) {
      curY -= size;
    } else if (direction == DIR_DOWN) {
      curY += size;
    } else if (direction == DIR_LEFT) {
      curX -= size;
    } else if (direction == DIR_RIGHT) {
      curX += size;
    }

    queue.offer(new Point(curX, curY));
    //queue.remove();
  }

  void collision() {
    if (curX < 0 || 
          curX > width - size || 
          curY < 0 ||
          curY > height - size){
        stop = true;     
     } 
  }
}

