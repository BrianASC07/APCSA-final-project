import Green.*;
import java.util.*;
import processing.sound.*;

class BulletBomb extends Obstacle {
  Player player = wrld.getObjects(Player.class).get(0);
  int timer = second();
  SoundFile file = new SoundFile(sketch.this, "assets/bombexplosion.wav");

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
    } else { //this is too much
      wrld.removeObject(this);
      file.play();
      EnemyBullet bullet1 = new EnemyBullet(int(getX()), int(getY()), getX() + width, getY(),2);
      EnemyBullet bullet2 = new EnemyBullet(int(getX()), int(getY()), getX() - width, getY(),2);
      EnemyBullet bullet3 = new EnemyBullet(int(getX()), int(getY()), getX(), getY() + height,2);
      EnemyBullet bullet4 = new EnemyBullet(int(getX()), int(getY()), getX(), getY() - height,2);
      
      EnemyBullet bullet5 = new EnemyBullet(int(getX()), int(getY()), getX() + width, getY() + height,2);
      EnemyBullet bullet6 = new EnemyBullet(int(getX()), int(getY()), getX() - width, getY() + height,2);
      EnemyBullet bullet7 = new EnemyBullet(int(getX()), int(getY()), getX() - width, getY() - height,2);
      EnemyBullet bullet8 = new EnemyBullet(int(getX()), int(getY()), getX() + width, getY() - height,2);

      
      wrld.addObject(bullet1);
      wrld.addObject(bullet2);
      wrld.addObject(bullet3);
      wrld.addObject(bullet4);
      wrld.addObject(bullet5);
      wrld.addObject(bullet6);
      wrld.addObject(bullet7);
      wrld.addObject(bullet8);
    }
    handleDamage();
  }
  


}
