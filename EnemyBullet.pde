import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class EnemyBullet extends Obstacle {
  PVector direction;
  Player player = world.getObjects(Player.class).get(0);

  EnemyBullet(int x, int y, int dmg, PVector d){
    super(x,y,dmg);
    direction = d;
  }
  
  void act (float a) {
    move();
  }
  
  void move() { 
    direction.limit(2);
    moveGlobal(direction.x,direction.y);
    if (getY() <= 0) {
      world.removeObject(this);
    }
    if (getY() >= height) {
      world.removeObject(this);
    }
    if (getX() >= width) {
      world.removeObject(this);
    }
    if (getX() <= 0) {
      world.removeObject(this);
    }
    if (this.intersects(player)) {
        world.removeObject(this);
        player.applyDamage(getDamage());
    }

  }
}
