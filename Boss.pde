import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Boss extends Entities {
  boolean direction;
  int secTimer = second();
  int atk2Timer = second();
  int atk3Timer = second();
  int atk4Timer = second();
  int atk5Timer = second();
  int atk7Timer = frameCount;
  int atk8Timer = frameCount;
  int atk11Timer = frameCount;

  int atkTimer = second();
  int milliTimer = millis();
  int atk1;
  int atk2;
  int atk3;


  Boss(){
    super(width/2, 100, loadImage("assets/boss.png"), 0.5, 100);
  }
  
  void act (float a) {
    if (second() > secTimer + 4 || second() < secTimer) {
      secTimer = second();
      atk1 = int(random(5));
      atk2 = int(random(10));
      atk3 = int(random(6));
    }
    handleAttack(atk1, atk2, atk3);
    endGame();
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
    move();
    Player player = wrld.getObjects(Player.class).get(0);

    if (millis() / 300 % 10 != milliTimer) {
      milliTimer = millis() / 300 % 10;
      int x = int(random(width));
      float xDir = random(player.getX() - 50, player.getX() + 50);
      float yDir = random(player.getY() - 50, player.getY() + 50);
      EnemyBullet bullet = new EnemyBullet(x, 1, xDir, yDir, random(1.2,3.5));
      wrld.addObject(bullet);
    }
  }
  void attack1(){
    move();
    if (millis() / 600 % 10 != milliTimer) {
      milliTimer = millis() / 600 % 10;
      
      int xSpawn = int(random(width));
      int ySpawn = int(random(height));
      float xDir = random(width/2 - 100, width/2 + 100);
      float yDir = random(height/2 - 100, height/2 + 100);
      EnemyBullet bullet1 = new EnemyBullet(xSpawn, 1, xDir, yDir, random(1.2,2.0));
      EnemyBullet bullet2 = new EnemyBullet(1, ySpawn, xDir, yDir, random(1.2,2.0));
      EnemyBullet bullet3 = new EnemyBullet(width-1, ySpawn, xDir, yDir, random(1.2,3.5));

      wrld.addObject(bullet1);
      wrld.addObject(bullet3);
      wrld.addObject(bullet2);
    }
  }
  
  void attack2(){
    move();
    if (second() != atk2Timer) {
      atk2Timer = second();

      for (int i = -600; i <= 600; i += 200) {
        EnemyBullet bullet1 = new EnemyBullet(int(getX()), int(getY()), getX() + i, float(height), 2);
        wrld.addObject(bullet1);
      }

    }
  }
  
  void attack3(){
    Player player = wrld.getObjects(Player.class).get(0);
    move();
    if (second() != atk3Timer) {
      atk3Timer = second();

      BulletBomb bullet1 = new BulletBomb(int(getX()), int(getY()), player.getX(), player.getY(), 2.2);
      wrld.addObject(bullet1);
    }
  }
  
  void attack4(){
    move();
    if (second() != atk4Timer) {
      atk4Timer = second();
      int xSpawn = int(random(width));
      float xDir = random(width/2 - 100, width/2 + 100);
      float yDir = random(height/2 - 100, height/2 + 100);
      BulletBomb bullet1 = new BulletBomb(xSpawn, 1, xDir, yDir, 2.2);
      wrld.addObject(bullet1);
    }
  }
  
  void attack5(){
    move();
    if (millis() / 500 % 10 != atk5Timer) {
      atk5Timer = millis() / 500 % 10;
      int xSpawn = int(random(width));
      float xDir = random(0, width);
      float yDir = random(0, height);
      EnemyLaser bullet1 = new EnemyLaser(xSpawn, 0, xDir, yDir, 3);
      wrld.addObject(bullet1);
    }
  }
  void attack6(){
    move();
    Player player = wrld.getObjects(Player.class).get(0);
    if (millis() / 800 % 10 != atk5Timer) {
      atk5Timer = millis() / 800 % 10;
      int xSpawn = int(random(width));
      EnemyLaser bullet1 = new EnemyLaser(xSpawn, 0, player.getX(), player.getY(), 3);
      wrld.addObject(bullet1);
    }
  }
  void attack7(){
    move();
    if (frameCount >= atk7Timer + 120) {
      atk7Timer = frameCount;
      for (int i = 0; i <= width; i += 250) {
        EnemyLaser bullet1 = new EnemyLaser(i + int(random(350)), 0, i + int(random(350)), height, 3);
        EnemyLaser bullet2 = new EnemyLaser(0, i + int(random(350)), width, i + int(random(350)), 3);
        wrld.addObject(bullet1);
        wrld.addObject(bullet2);
      }
    }
  }
  void attack8(){
    move();
    HealthKit heal = new HealthKit(int(getX()), int(getY()), getX(), getY() + height, 1.25);
    wrld.addObject(heal);
  }
  void attack9(){
    Player player = wrld.getObjects(Player.class).get(0);
    move();
    for (int i = 0; i <= width; i += 300) {
        EnemyLaser bullet1 = new EnemyLaser(i + int(random(350)), 0, player.getX(), player.getY(), 3);
        wrld.addObject(bullet1);
      }
  }
  void attack10(){
    move();
    for (int i = -600; i <= 600; i += 300) {
      BulletBomb bullet1 = new BulletBomb(int(getX()), int(getY()), getX() + i, float(height), 2.4);
      wrld.addObject(bullet1);
    }
  }
  void attack11(){
    for (int i = -600; i <= 600; i += 200) {
      EnemyBullet bullet1 = new EnemyBullet(int(getX()), int(getY()), getX() + i, float(height), 4);
      wrld.addObject(bullet1);
    }
  }
  void attack12(){
    for (int i = -600; i <= 600; i += 120) {
      EnemyBullet bullet1 = new EnemyBullet(int(getX()), int(getY()), getX() + i, float(height), 2.5);
      wrld.addObject(bullet1);
    }
  }

  
  void handleAttack(int n, int m, int o){
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
      case 3: 
        attack3();
        break;
      case 4: 
        attack4();
        break;
    }
    switch(m){
      case 0: 
        attack5();
        break;
      case 1: 
        attack6();
        break;      
      case 2:
        attack7();
        break;
    }
    switch(o){
      case 0: 
        attack8();
        atk3 = -1;
        break;
      case 1: 
        attack9();
        atk3 = -1;
        break;      
      case 2: 
        attack10();
        atk3 = -1;
        break;
      case 3: 
        attack11();
        atk3 = -1;
        break;   
      case 4: 
        attack12();
        atk3 = -1;
        break;   
    }
  }
  void endGame() {
    if (this.getHealth() == 0) {
      Player player = wrld.getObjects(Player.class).get(0);
      wrld.removeObject(this);
      wrld.removeObject(player);

      end.setVictoryStatus("won");
      green.loadWorld(end);
      applyDamage(-100);
    }
  }
}
