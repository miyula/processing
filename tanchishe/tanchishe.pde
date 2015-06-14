import java.util.Queue;
import java.util.LinkedList;

int DIR_TOP = 0;
int DIR_DOWN = 1;
int DIR_LEFT = 2;
int DIR_RIGHT = 3;

int size = 10;
int fp = 5;
Snake snake;
int direction = DIR_TOP;

void setup() {
  size(600, 400);
  snake = new Snake(300, 200);
  frameRate(fp);
  background(0);
  rectMode(CENTER);
  fill(255);
}

void draw() {
  background(0);
  snake.run();
}

void keyPressed() {
  if (keyCode == UP) {
    //print("up");
    direction = DIR_TOP;
  } else if (keyCode == DOWN) {
    //print("down");
    direction = DIR_DOWN;
  } else if (keyCode == LEFT) {
    //print("left");
    direction = DIR_LEFT;
  } else if (keyCode == RIGHT) {
    //print("right");
    direction = DIR_RIGHT;
  }
}

