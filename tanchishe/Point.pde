class Point {

  int x;
  int y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  Point getNext(){
    int nextX = x;
    int nextY = y;
    
    if (direction == DIR_TOP) {
      nextY -= size;
    } else if (direction == DIR_DOWN) {
      nextY += size; 
    } else if (direction == DIR_LEFT) {
      nextX -= size; 
    } else if (direction == DIR_RIGHT) {
      nextX += size; 
    }
    
    return new Point(nextX, nextY);
  }
  
}

