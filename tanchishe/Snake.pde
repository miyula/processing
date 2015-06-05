class Snake {

  int curX;
  int curY;
  
  int size;
  
  Queue<Point> queue;
  
  Snake(int _x, int _y){
    curX = _x;
    curY = _y;
    
    size = 10;
    
    queue = new LinkedList<Point>();
    queue.offer(new Point(curX, curY));
  }
  
  void run(){
    display();
  }
  
  void display(){
    fill(255);
    for (Point p : queue){
      rect(p.x, p.y, size, size);
    }
    
  }
  
  void move(){
    
  }

}

