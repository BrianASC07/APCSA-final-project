import java.util.*;
import java.util.concurrent.TimeUnit;

class EnemyLaserComponent extends Obstacle {
  Player player = wrld.getObjects(Player.class).get(0);
  int timer = frameCount;  

  EnemyLaserComponent(int x, int y, float xDir, float yDir){
    super(x,y,loadImage("assets/laserfire.png"),3,1,0);
    this.turnTowards(xDir, yDir);
  }
  
  void act (float a) {
    move();  
    handleDamage();
  }

  void handleDamage(){
    if (frameCount >= timer + (60 * 2)) {
      wrld.removeObject(this);
    }
    if (this.intersects(player)) {
      player.applyDamage(damage);
    }
  }
  
}
