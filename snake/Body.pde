class Body{
 
 Queue<Grid> queue;
 Grid headGrid;
 int moveDirection;
 int state = STATE_LIVE;
 
 Body(Grid g){
   state = STATE_LIVE;
   queue = new LinkedList<Grid>();
   eat(g);
 }
 
 void eat(Grid g){
   headGrid = g;
   queue.offer(g);
   speed();
 }
 
 void pop(){
   Grid g = queue.remove();
   grids.add(g);
 }
 
 void run(){
   if (state == STATE_LIVE){
     move();
     fill(255);
     display();
     fill(220, 220, 1);
     headGrid.display();
   } else if(state == STATE_DIE) {
     fill(200);
     display();
   } else if(state == STATE_WIN) {
     fill(220, 220, 1);
     display();
   }
 }
 
 void display(){
   for (Grid g : queue) {
      g.display();
   }
 }
 
 void speed(){
   int size = queue.size();
   if (size <= 4){
     speed = 1;
   }else if (size % 5 == 0){
    speed++;
   }
   
 }
 
 void move(){
   float x = headGrid.x;
   float y = headGrid.y;
   if(moveDirection == DIR_LEFT){
     x = x - size;
   } else if(moveDirection == DIR_RIGHT){
     x = x + size; 
   } else if(moveDirection == DIR_UP){
     y = y - size; 
   } else if(moveDirection == DIR_DOWN){
     y = y + size;
   }
   
   Grid newGrid = pickGrid(x, y);
   if (newGrid == null){
     //eat food?
     if(food.x == x && food.y == y)
     {
       eat(food);
       food = getGrid();
       
       if(food == null){
        state = STATE_WIN;
       }
       
     } else {
       state = STATE_DIE; 
     }
     
   } else {
     eat(newGrid);
     pop();
   }
   
 }
 
 void decideDirection(Grid g){
  if (headGrid.onLeft(g)){
   moveDirection = DIR_LEFT;
  } else if (headGrid.onRight(g)){
   moveDirection = DIR_RIGHT; 
  } else if (headGrid.onTop(g)){
   moveDirection = DIR_UP; 
  } else if (headGrid.onBottom(g)){
    moveDirection = DIR_DOWN;
  }
 }
 
 void setDirection(int d){
   moveDirection = d;
 }
 
}
