import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Skill extends Actor{
  final String[] classes = {"Evader", "Survivor", "Brawler"};
  int selectedClass;

  
  //skill 1
  int skill1Cooldown;
  int timer1 = frameCount;
  //skill 2
  int skill2Cooldown;
  int timer2 = second();
  int timer3 = second();
  int skill2Duration;
  boolean skill2Enabled = false;
  // skill3
  int skill3Cooldown;
  int timer4 = second();
  int timer5 = second();
  boolean skill3Enabled = false;
  int skill3Duration;
  
  //skill4
  int skill4Cooldown;
  int timer6 = frameCount;
  //skill5
  int skill5Cooldown;
  int timer7 = second();
  int timer8 = second();
  boolean skill5Enabled = false;
  int skill5Duration;
  //skill6
  int skill6Cooldown;
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

    if (skill1Cooldown == 7) {
      if (green.isKeyDown('e')){
        player.setX(mouseX);
        player.setY(mouseY);
        skill1Cooldown = 0;
      }
    }
    else {
      if (frameCount >= timer1 + 60) {
        timer1 = frameCount;
        skill1Cooldown++;
      }
    }
  }
  
  void skill2() { //speedboost
    Player player = wrld.getObjects(Player.class).get(0);
    if (skill2Cooldown == 10) {
      if (skill2Enabled) {
        if (timer3 + 60 <= frameCount) {
          timer3 = frameCount;
          skill2Duration++;
        }
        if (skill2Duration == 5) {
          skill2Cooldown = 0;
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
        skill2Cooldown++;
      }
    }
  }
  void skill3() { //invincibility
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill3Cooldown == 6) {//cooldown
      if (skill3Enabled) {
        if (timer4 + 60 <= frameCount) {
          timer4 = frameCount;
          skill3Duration++;
        }
        if (skill3Duration == 2) { //duration of skill
          skill3Cooldown = 0;
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
        skill3Cooldown++;
      }
    }
  }
  void skill4() { //heal
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill4Cooldown == 10) { //cooldown
      if (green.isKeyDown('q')){
        player.applyDamage(-10);
        skill4Cooldown = 0;
      }
    }
    else {
      if (frameCount >= timer6 + 60) {
        timer6 = frameCount;
        skill4Cooldown++;
      }
    }
  }
  void skill5() { //atk speed boost
    Player player = wrld.getObjects(Player.class).get(0);

    if (skill5Cooldown == 5) {//cooldown
      if (skill5Enabled) {
        if (timer7 + 60 <= frameCount) {
          timer7 = frameCount;
          skill5Duration++;
        }
        if (skill5Duration == 4) { //duration of skill
          skill5Cooldown = 0;
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
        skill5Cooldown++;
      }
    }
  }
  void skill6() { //wrath
    Player player = wrld.getObjects(Player.class).get(0);
    if (skill6Cooldown == 7) {//cooldown
      if (skill6Enabled) {
        if (timer9 + 60 <= frameCount) {
          timer9 = frameCount;
          skill6Duration++;
        }
        if (skill6Duration == 4) { //duration of skill
          skill6Cooldown = 0;
          skill6Duration = 0;
          player.setDamage(2);
          skill6Enabled = false;
        }
      }
      else if (green.isKeyDown('q')){
        skill6Enabled = true;
        player.setDamage(6);
        player.applyDamage(10);
      }
    }
    else {
      if (timer10  + 60 <= frameCount) {
        timer10 = frameCount;
        skill6Cooldown++;
      }
    }
  }
  
  int getSkill1Cooldown() {
    switch(selectedClass){
      case 0: 
        return skill1Cooldown;
      case 1: 
        return skill3Cooldown;
      case 2: 
        return skill5Cooldown;
    } 
    return -1;
  }
  int getSkill2Cooldown() {
    switch(selectedClass){
      case 0: 
        return skill2Cooldown;
      case 1: 
        return skill4Cooldown;
      case 2: 
        return skill6Cooldown;
    } 
    return -1;
  }
  int getSkill1MaxCooldown() {
    switch(selectedClass){
      case 0: 
        return 7;
      case 1: 
        return 6;
      case 2: 
        return 5;
    } 
    return -1;
  }
   int getSkill2MaxCooldown() {
    switch(selectedClass){
      case 0: 
        return 10;
      case 1: 
        return 10;
      case 2: 
        return 7;
    } 
    return -1;
  }
  String getPlayerClass() {
    return classes[selectedClass];
  }
}
