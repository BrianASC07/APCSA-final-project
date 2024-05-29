import Green.*;
import java.util.*;

class Obstacle extends Actor {
  int damage;

  Obstacle(float x, float y, int dmg){
    super(x, y, loadImage("ship.png"), 0.15);
    damage = dmg;
  }
  
  void act (float a) {
    move();
  }
  
  void move() { 

  }
  int getDamage() {
    return damage;
  }

}
