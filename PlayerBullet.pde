import Green.*;
import java.util.*;

class PlayerBullet extends Entities {
  
  Boss boss = wrld.getObjects(Boss.class).get(0);
  int damage;
  PlayerBullet(float x, float y, int dmg){
    super(x, y, loadImage("assets/playerbullet.png"), 0.1);
    damage = dmg;
  }
  
  void act (float a) {
    move();
  }
  
  void move() { 
    if (getY() <= 0) {
      wrld.removeObject(this);
    }
    if (this.intersects(boss)) {
        wrld.removeObject(this);
        boss.applyDamage(damage);
    }
    moveGlobal(0, -4);
  }
}
