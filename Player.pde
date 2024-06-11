import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Player extends Entities {
  float speed = 2;
  int damage = 2;
  int atkSpeed = 60;
  int atkTimer = frameCount;
  boolean invincible = false;
  Skill skill;
  Player(){
    super(width/2, height/2, loadImage("assets/ship.png"), 0.15, 100);
  }
  
  void act (float a) {
    skill = wrld.getObjects(Skill.class).get(0);
    skill.handleSkill();
    
    shoot();
    move();
    endGame();

  }
  
  void move() { // moves the character using wasd
    if(green.isKeyDown('w')) {
      moveGlobal(0, -speed);
    }
    if(green.isKeyDown('s')) {
      moveGlobal(0, speed);
    }
    if(green.isKeyDown('d')) {
      moveGlobal(speed, 0);
    }
    if(green.isKeyDown('a')) {
      moveGlobal(-speed, 0);
    }
  }
  
  void shoot() {
    if (frameCount >= atkTimer + atkSpeed) {
      atkTimer = frameCount;
      PlayerBullet bullet = new PlayerBullet(getX(), getY(), damage);
      wrld.addObject(bullet);
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

  
  void setSpeed(float spd) {
    speed = spd;
  }
  void setDamage(int dmg) {
    damage = dmg;
  }
  void setAtkSpeed(int atk) {
    atkSpeed = atk;
  }
  void setInvincible(boolean toggle) {
    invincible = toggle;
  }

  
  int getSkill1Timer() {
    skill = wrld.getObjects(Skill.class).get(0);
    return skill.getSkill1Timer();
  }
  int getSkill2Timer() {
    skill = wrld.getObjects(Skill.class).get(0);    
    return skill.getSkill2Timer();
  }
  
  void applyDamage(int damage){
    if (!invincible && damage > 0) {
      super.applyDamage(damage);
    } else if (!invincible && damage < 0){
      super.applyDamage(damage);
    }
  }
  
}
