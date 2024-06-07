import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Boss extends Entities {
  boolean direction;
  int secTimer = second();
  int atk2Timer = second();

  int atkTimer = second();
  int milliTimer = millis();
  int atk;

  Boss(){
    super(width/2, 100, loadImage("boss.png"), 0.5, 100);
  }
  
  void act (float a) {
    move();
    if (second() > secTimer + 4 || second() < secTimer) {
      secTimer = second();
      atk = int(random(3));
    }
    handleAttack(atk);
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
  void attack0(){
    Player player = world.getObjects(Player.class).get(0);
    if (millis() / 300 % 10 != milliTimer) {
      milliTimer = millis() / 300 % 10;
      int x = int(random(width));
      float xDir = random(player.getX() - 50, player.getX() + 50);
      float yDir = random(player.getY() - 50, player.getY() + 50);
      EnemyBullet bullet = new EnemyBullet(x, 1, xDir, yDir, 1);
      world.addObject(bullet);

    }
  }
  void attack1(){
    if (millis() / 600 % 10 != milliTimer) {
      milliTimer = millis() / 600 % 10;
      
      int xSpawn = int(random(width));
      int ySpawn = int(random(height));
      float xDir = random(width/2 - 100, width/2 + 100);
      float yDir = random(height/2 - 100, height/2 + 100);
      
      
      EnemyBullet bullet1 = new EnemyBullet(xSpawn, 1, xDir, yDir, 1);
      EnemyBullet bullet2 = new EnemyBullet(1, ySpawn, xDir, yDir, 1);
      EnemyBullet bullet3 = new EnemyBullet(width-1, ySpawn, xDir, yDir, 1);

      world.addObject(bullet1);
      world.addObject(bullet3);
      world.addObject(bullet2);
    }
  }
  
  void attack2(){
    if (second() != atk2Timer) {
      atk2Timer = second();

      for (int i = -600; i <= 600; i += 200) {
        EnemyBullet bullet1 = new EnemyBullet(int(getX()), int(getY()), getX() + i, float(height), 2);
        world.addObject(bullet1);
      }

    }//second() != secTimer && second() != secTimer + 1
  }
  void handleAttack(int n){
    switch(n){
      case 0: 
        attack0();
        break;
      case 1: 
        attack1();
        break;
      case 2: 
        attack2();
        break;
    }
  }
}
