import Green.*;
import java.util.*;

class Obstacle extends Actor {
  int damage;

  Obstacle(float x, float y, int dmg){
    super(x, y, loadImage("enemybullet.png"), 0.75);
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
