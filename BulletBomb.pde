import Green.*;
import java.util.*;
import processing.sound.*;

class BulletBomb extends Obstacle {
  Player player = wrld.getObjects(Player.class).get(0);
  int timer = second();
  SoundFile file = new SoundFile(sketch.this, "assets/bombexplosion.wav");

  int[][] directions = {{width, 0}, {-width, 0}, {0, height}, {0, -height}, {width, height}, {-width, height}, {-width, -height}, {width, -height}};
  
  BulletBomb(int x, int y, float xDir, float yDir, float speed){
    super(x,y,loadImage("assets/bomb.png"),1.25,20, speed);
    this.turnTowards(xDir, yDir);
  }
  
  void act (float a) {
    if (timer != (millis() / 1000) % 10) {
      setSpeed(getSpeed() - 0.35);
      timer = (millis() / 1000) % 10;
    }
    if (getSpeed() > 0) {
      move();
    } else {
      wrld.removeObject(this);
      file.play();
      for (int[] direction : directions) {
          EnemyBullet bullet = new EnemyBullet(int(getX()), int(getY()), getX() + direction[0], getY() + direction[1], 2);
          wrld.addObject(bullet);
      }
    }
    handleDamage();
  }
  


}
