import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Player extends Entities {
  int speed = 0;
  int shield = 0;
  int atkTimer = second();
  int timer1 = second();
  int timer2 = second();
  int timer3 = second();

  int skill1Timer = 0;
  int skill2Timer = 0;
  int skill2Duration = 0;
  boolean skill2Enabled = false;

  Player(){
    super(width/2, height/2, loadImage("ship.png"), 0.15, 100);
  }
  
  void act (float a) {
    shoot();
    move();
    skill1();
    skill2();
  }
  
  void move() { // moves the character using wasd
    if(green.isKeyDown('w')) {
      moveGlobal(0, -2 - speed);
    }
    if(green.isKeyDown('s')) {
      moveGlobal(0, 2 + speed);
    }
    if(green.isKeyDown('d')) {
      moveGlobal(2 + speed, 0);
    }
    if(green.isKeyDown('a')) {
      moveGlobal(-2 - speed, 0);
    }
  }
  
  void shoot() {
    if (second() != atkTimer) {
      atkTimer = second();
      PlayerBullet bullet = new PlayerBullet(getX(), getY());
      world.addObject(bullet);
    }
  }
  
  void skill1() {
    if (skill1Timer == 5) {
      if (green.isKeyDown('e')){
        setX(mouseX);
        setY(mouseY);
        skill1Timer = 0;
      }
    }
    else {
      if (timer1 != second()) {
        timer1 = second();
        skill1Timer++;
      }
    }
  }
  
  void skill2() { //kinda a mess right now
    if (skill2Timer == 10) {
      if (skill2Enabled) {
        if (timer3 != second()) {
          timer3 = second();
          skill2Duration++;
        }
        if (skill2Duration == 5) {
          skill2Timer = 0;
          skill2Enabled = false;
          speed -= 5;
        }
      }
      else if (green.isKeyDown('q')){
        speed += 5;
        skill2Enabled = true;
      }
    }
    else {
      if (timer2 != second()) {
        timer2 = second();
        skill2Timer++;
      }
    }
  }
  
  int getSkill1Timer() {
    return skill1Timer;
  }
  int getSkill2Timer() {
    return skill2Timer;
  }
}
