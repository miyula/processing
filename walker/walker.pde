int line = 60;
int number = 100;

Worm[] worms = new Worm[number];

void setup() {
  background(0);
  stroke(255);
  
  size(600, 400);
  for (int i=0; i<number; i++) {
    worms[i] = new Worm(0, random(height));
  }
}

void draw() {
  //background(0);
  
  for (int i=0; i<number; i++) {
    worms[i].run();
  }
}

