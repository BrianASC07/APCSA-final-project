import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Boss extends Entities {
  boolean direction;

  Boss(){
    super(width/2, 100, loadImage("boss.png"), 0.5, 100);
  }
  
  void act (float a) {
    move();
    
  }
  
  void move() { 
    if (direction) {
      moveGlobal(2, 0);
    } else {
      moveGlobal(-2, 0);
    }
    if (getX() <= 80 || getX() >= width - 80) {
      direction = !direction;
    }

  }
}
