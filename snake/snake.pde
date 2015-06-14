import java.util.List;
import java.util.Queue;
import java.util.LinkedList;

static int DIR_LEFT = 1;
static int DIR_RIGHT = 2;
static int DIR_UP = 3;
static int DIR_DOWN = 4;

static int STATE_LIVE = 0;

static int STATE_WIN = 1;
static int STATE_DIE = -1;

int row = 30;
int col = 50;
int size = 11;
int gSize = 10;

int speed = 1;
int rate = 20;
int count = 0;

ArrayList<Grid> grids = new ArrayList<Grid>();
Body snakeBody;
Grid food;

//Grid[][] grids = new Grid[row][col];

void setup() {

  size(col *size, row * size);

  for (int r=0; r < row; ++r) {
    for (int c=0; c< col; ++c) {
      grids.add(new Grid(c*size, r*size));
      //grids[r][c] = new Grid(c*size, r*size);
    }
  }

  snakeBody = new Body(pickGrid(floor(col/2) * size, floor(row/2) * size));
  food = getGrid();
  snakeBody.decideDirection(food);

  frameRate(rate);
}

void draw() {
  count++;
  if (count >= rate - speed) {
    display();
    count = 0;
  }
}

Grid getGrid() {
  int size = grids.size();
  if (size > 0) {
    int n = (int) random(size);
    Grid g = grids.get(n);
    grids.remove(n);
    return g;
  }
  return null;
}

Grid pickGrid(float x, float y) {
  int n = -1;
  for (int i=0; i < grids.size (); ++i) {
    Grid g = grids.get(i);
    if (g.x == x && g.y == y) {
      n = i;
      break;
    }
  }
  if (n >=0 ) {
    Grid g = grids.get(n);
    grids.remove(n);
    return g;
  }

  return null;
}

void keyPressed() {
  if (keyCode == UP) {
    //print("up");
    snakeBody.setDirection(DIR_UP);
    display();
  } else if (keyCode == DOWN) {
    //print("down");
    snakeBody.setDirection(DIR_DOWN);
    display();
  } else if (keyCode == LEFT) {
    //print("left");
    snakeBody.setDirection(DIR_LEFT);
    display();
  } else if (keyCode == RIGHT) {
    //print("right");
    snakeBody.setDirection(DIR_RIGHT);
    display();
  }
}

void display() {
  background(90, 220, 90);
  noStroke();

  if (food != null) {
    fill(200, 50, 100); 
    food.display();
  } 

  snakeBody.run();
}

