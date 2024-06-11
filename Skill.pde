import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Skill extends Actor{
  int selectedClass;
  
  //skill 1
  int skill1Timer;
  int timer1 = frameCount;
  //skill 2
  int skill2Timer;
  int timer2 = second();
  int timer3 = second();
  int skill2Duration;
  boolean skill2Enabled = false;
  // skill3
  int skill3Timer;
  int timer4 = second();
  int timer5 = second();
  boolean skill3Enabled = false;
  int skill3Duration;
  
  //skill4
  int skill4Timer;
  int timer6 = frameCount;
  //skill5
  int skill5Timer;
  int timer7 = second();
  int timer8 = second();
  boolean skill5Enabled = false;
  int skill5Duration;
  //skill6
  int skill6Timer;
  int timer9 = second();
  int timer10 = second();
  boolean skill6Enabled = false;
  int skill6Duration;
  
  Skill(int selected){
    super(0,0,0,0);
    selectedClass = selected;
  }
  void setClass(int select) {
    selectedClass = select;
  }
  
  void act(float a){
  };
  
  void handleSkill() {
    switch(selectedClass){
      case 0: 
        skill1();
        skill2();
        break;
      case 1: 
        skill3();
        skill4();
        break;
      case 2: 
        skill5();
        skill6();
        break;
    } 
  }
  
  void skill1() { //teleport
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill1Timer == 5) {
      if (green.isKeyDown('e')){
        player.setX(mouseX);
        player.setY(mouseY);
        skill1Timer = 0;
      }
    }
    else {
      if (frameCount >= timer1 + 60) {
        timer1 = frameCount;
        skill1Timer++;
      }
    }
  }
  
  void skill2() { //speedboost
    Player player = wrld.getObjects(Player.class).get(0);
    if (skill2Timer == 10) {
      if (skill2Enabled) {
        if (timer3 + 60 <= frameCount) {
          timer3 = frameCount;
          skill2Duration++;
        }
        if (skill2Duration == 5) {
          skill2Timer = 0;
          skill2Duration = 0;
          player.setSpeed(2);
          skill2Enabled = false;
        }
      }
      else if (green.isKeyDown('q')){
        player.setSpeed(4);
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
  void skill3() { //invincibility
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill3Timer == 5) {//cooldown
      if (skill3Enabled) {
        if (timer4 + 60 <= frameCount) {
          timer4 = frameCount;
          skill3Duration++;
        }
        if (skill3Duration == 3) { //duration of skill
          skill3Timer = 0;
          skill3Duration = 0;
          skill3Enabled = false;
          player.setInvincible(false);
        }
      }
      else if (green.isKeyDown('e')){
        skill3Enabled = true;
        player.setInvincible(true);
      }
    }
    else {
      if (timer5  + 60 <= frameCount) {
        timer5 = frameCount;
        skill3Timer++;
      }
    }
  }
  void skill4() { //heal
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill4Timer == 10) { //cooldown
      if (green.isKeyDown('q')){
        player.applyDamage(-10);
        skill4Timer = 0;
      }
    }
    else {
      if (frameCount >= timer6 + 60) {
        timer6 = frameCount;
        skill4Timer++;
      }
    }
  }
  void skill5() { //atk speed boost
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill5Timer == 5) {//cooldown
      if (skill5Enabled) {
        if (timer7 + 60 <= frameCount) {
          timer7 = frameCount;
          skill5Duration++;
        }
        if (skill5Duration == 4) { //duration of skill
          skill5Timer = 0;
          skill5Duration = 0;
          player.setAtkSpeed(60);
          skill5Enabled = false;
        }
      }
      else if (green.isKeyDown('e')){
        skill5Enabled = true;
        player.setAtkSpeed(30);
      }
    }
    else {
      if (timer8  + 60 <= frameCount) {
        timer8 = frameCount;
        skill5Timer++;
      }
    }
  }
  void skill6() { //wrath
    Player player = wrld.getObjects(Player.class).get(0);
    if (skill6Timer == 10) {//cooldown
      if (skill6Enabled) {
        if (timer9 + 60 <= frameCount) {
          timer9 = frameCount;
          skill6Duration++;
        }
        if (skill6Duration == 4) { //duration of skill
          skill6Timer = 0;
          skill6Duration = 0;
          player.setDamage(2);
          skill6Enabled = false;
        }
      }
      else if (green.isKeyDown('q')){
        skill6Enabled = true;
        player.setDamage(6);
        player.applyDamage(15);
      }
    }
    else {
      if (timer10  + 60 <= frameCount) {
        timer10 = frameCount;
        skill6Timer++;
      }
    }
  }
  
  int getSkill1Timer() {
    switch(selectedClass){
      case 0: 
        return skill1Timer;
      case 1: 
        return skill3Timer;
      case 2: 
        return skill5Timer;
    } 
    return -1;
  }
  int getSkill2Timer() {
    switch(selectedClass){
      case 0: 
        return skill2Timer;
      case 1: 
        return skill4Timer;
      case 2: 
        return skill6Timer;
    } 
    return -1;
  }
}
