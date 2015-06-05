import java.util.Queue;
import java.util.LinkedList;

int size = 60;
int num = 200;

ArmyWorm[] list = new ArmyWorm[num];

void setup(){
  size(600, 400);
  background(0);
  for(int i=0; i<num; ++i){
    list[i] = new ArmyWorm(0, random(height));
  }
}

void draw(){
  
  for(int i=0; i<num; ++i){
    ArmyWorm warm = list[i];
    warm.run();
  }  
}
