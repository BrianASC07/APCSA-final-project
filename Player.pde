import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Player extends Entities {
  int speed = 0;
  int shield = 0;
  int atkTimer = second();
  int timer1 = frameCount;
  int timer2 = second();
  int timer3 = second();

  int skill1Timer = frameCount;
  int skill2Timer = frameCount;
  int skill2Duration = frameCount;
  boolean skill2Enabled = false;
  

  Player(){
    super(width/2, height/2, loadImage("assets/ship.png"), 0.15, 100);
  }
  
  void act (float a) {
    shoot();
    move();
    skill1();
    skill2();
    endGame();
    System.out.println(skill1Timer);
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
      wrld.addObject(bullet);
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
      if (frameCount >= atk7Timer + 120) {
        timer1 = frameCount;
        skill1Timer++;
      }
    }
  }
  
  void skill2() { //kinda a mess right now
    if (skill2Timer == 10) {
      if (skill2Enabled) {
        if (timer3 + 60 <= frameCount) {
          timer3 = frameCount;
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
      if (timer2  + 60 <= frameCount) {
        timer2 = frameCount;
        skill2Timer++;
      }
    }
  }
  void endGame() {
    if (this.getHealth() == 0) {
      Boss boss = wrld.getObjects(Boss.class).get(0);
      wrld.removeObject(this);
      wrld.removeObject(boss);

      end.setVictoryStatus("lost");
      green.loadWorld(end);
      applyDamage(-100);
    }
  }
  int getSkill1Timer() {
    return skill1Timer;
  }
  int getSkill2Timer() {
    return skill2Timer;
  }
}
