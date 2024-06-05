import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class EnemyBullet extends Obstacle {
  Player player = world.getObjects(Player.class).get(0);
  int movement;


  EnemyBullet(float x, float y, int move){
    super(x,y,10);
    this.turnTowards(player);
    movement = move;
  }
  EnemyBullet(int x, int y, float xDir, float yDir, int move){
    super(x,y,10);
    this.turnTowards(xDir, yDir);
    movement = move;
  }
  
  void act (float a) {
    if (movement == 1) {
      move();
    }
    if (movement == 2) {
      move();
    }
    handleDamage();

  }
  
  void move(float x, float y) { //move by changing the location using x and y
    moveGlobal(x,y);
    
  }
  void move() { // moves in a straight line towards the direction its facing
    super.move(2);
  }
  
  void handleDamage(){
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
