

class Snake {

  int curX;
  int curY;

  Point cur;
  Point food;

  boolean stop = false;

  Queue<Point> queue;

  Snake(int _x, int _y) {

    cur = new Point(_x, _y);

    queue = new LinkedList<Point>();
    queue.offer(cur);

    stop = false;
  }

  void run() {
    if (!stop) {
      fill(255);
      display();
      move();
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
    cur = cur.getNext();
  }

  void collision() {

    if (reachFood()) {
      queue.offer(cur);
    } else if (isSelf() || reachEdge()) {
      queue.offer(cur);
      queue.remove();
      stop = true;
    } else {
      queue.offer(cur);
      queue.remove();
    }
  }

  boolean reachEdge() {
    if (cur.x < 0 || 
      cur.x > width - size || 
      cur.y < 0 ||
      cur.y > height - size) {
      return true;
    }
    return false;
  }

  boolean isSelf() {
    for (Point p : queue) {
      if (cur.x == p.x && cur.y == p.y) {
        return true;
      }
    }
    return false;
  }

  boolean reachFood() {
    if (cur.x == food.x && cur.y == food.y) {
      return true;
    } 
    return false;
  }
  
  void putFood(){
      int x;
      int y; 
  }
}

