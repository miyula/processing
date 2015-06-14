class Grid {
  
  float x;
  float y;
  
  Grid(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void display(){
    rect(x, y, gSize, gSize);
  }
  
  boolean isLeftEdge(){
   return x == 0; 
  }
  
  boolean isRightEdge(){
    return x == width - size;
  }
  
  boolean isTopEdge(){
    return y == 0;
  }
  
  boolean isDownEdge(){
    return y == height - size;
  }
  
  boolean onLeft(Grid o){
   return o.x < x; 
  }
  
  boolean onRight(Grid o){
   return  o.x > x;
  }
  
  boolean onTop(Grid o){
   return o.y < y;
  }
  
  boolean onBottom(Grid o){
   return o.y > y; 
  }
  
}

