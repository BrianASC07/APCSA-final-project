import Green.*;
import java.util.*;

class PlayerBullet extends Entities {
  
  Boss boss = world.getObjects(Boss.class).get(0);

  PlayerBullet(float x, float y){
    super(x, y, loadImage("playerbullet.png"), 0.1);
  }
  
  void act (float a) {
    move();
  }
  
  void move() { 
    if (getY() <= 0) {
      world.removeObject(this);
    }
    if (this.intersects(boss)) {
        world.removeObject(this);
        boss.applyDamage(1);
    }
    moveGlobal(0, -4);
  }
  int getDamage() {
    return 5;
  }

  void applyDamage(int damage){
    health -= damage;
  }
}
