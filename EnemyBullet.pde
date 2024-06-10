import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class EnemyBullet extends Obstacle {
  Player player = wrld.getObjects(Player.class).get(0);

  EnemyBullet(float x, float y, float speed){
    super(x,y,loadImage("assets/enemybullet.png"),0.75,10, speed);
    this.turnTowards(player);
  }
  EnemyBullet(int x, int y, float xDir, float yDir, float speed){
    super(x,y,loadImage("assets/enemybullet.png"),0.75,10,speed);
    this.turnTowards(xDir, yDir);
  }
  
  void act (float a) {
    move();
    handleDamage();
  }
  
}
