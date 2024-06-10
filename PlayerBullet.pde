import Green.*;
import java.util.*;

class PlayerBullet extends Entities {
  
  Boss boss = wrld.getObjects(Boss.class).get(0);

  PlayerBullet(float x, float y){
    super(x, y, loadImage("assets/playerbullet.png"), 0.1);
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
        boss.applyDamage(2);
    }
    moveGlobal(0, -4);
  }

  void applyDamage(int damage){
    health -= damage;
  }
}
