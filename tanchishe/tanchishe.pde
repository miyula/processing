import java.util.Queue;
import java.util.LinkedList;

int fp = 1;
Snake snake;

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

