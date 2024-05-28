import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Boss extends Entities {
  int health = 100;
  int speed = 0;
  boolean direction;

  Boss(){
    super(width/2, 100, loadImage("boss.png"), 0.5);
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
    if (getX() <= 70 || getX() >= width - 70) {
      direction = !direction;
    }

  }
  
  
  
  
  int getHealth(){
    return health;
  }
  void applyDamage(int damage){
    health -= damage;
  }

}
