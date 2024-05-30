import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Boss extends Entities {
  boolean direction;
  int secTimer = second();
  int milliTimer = millis();

  Boss(){
    super(width/2, 100, loadImage("boss.png"), 0.5, 100);
  }
  
  void act (float a) {
    move();
    attack1();
  }
  
  void move() { 
    if (direction) {
      moveGlobal(2, 0);
    } else {
      moveGlobal(-2, 0);
    }
    if (getX() <= 80 || getX() >= width - 80) {
      direction = !direction;
    }
  }
  void attack1(){
    if (millis() != milliTimer) {
      milliTimer = millis();
      PVector mouse = new PVector(width/2,height/2);
      int x = int(random(width));
      int y = int(random(height));
      EnemyBullet bullet1 = new EnemyBullet(x, 1, 10, mouse);
      EnemyBullet bullet2 = new EnemyBullet(x, height - 1, 10, mouse);
      EnemyBullet bullet3 = new EnemyBullet(1, y, 10, mouse);
      EnemyBullet bullet4 = new EnemyBullet(width-1, y, 10, mouse);

      world.addObject(bullet1);
      world.addObject(bullet2);
      world.addObject(bullet3);
      world.addObject(bullet4);
    }
  }
}
