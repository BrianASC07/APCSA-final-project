import Green.*;
import java.util.*;
import processing.sound.*;

class SkillSelect extends World {
  Green green;
  int selectedSkill;
  public SkillSelect()
  {
    super(height, width, loadImage("assets/background.png"), 1);

  }
  void act(float a){

  }

  void prepare(){ //equivalent to setup()
    Skill selectedSkill = new Skill(-1);
    this.addObject(selectedSkill);
    
    TextBox heading = new TextBox(150, 10, 225, 50, "Class Select", 160, 45, 40);
    this.addObject(heading);
    
    SkillButton class1 = new SkillButton(150, 50, 225, 50, "Evader", 205, 90, 40, 0);
    this.addObject(class1);

    TextBox skill1 = new TextBox(50, 80, 225, 50, "Teleport", 90, 120, 40);
    this.addObject(skill1);
    
    TextBox skill2 = new TextBox(260, 80, 225, 50, "Speed Boost", 265, 120, 40);
    this.addObject(skill2);
     
    SkillButton class2 = new SkillButton(150, 160, 225, 50, "Survivor", 190, 200, 40, 1);
    this.addObject(class2);

    TextBox skill3 = new TextBox(50, 190, 225, 50, "Invincibility", 65, 230, 40);
    this.addObject(skill3);
    
    TextBox skill4 = new TextBox(260, 190, 225, 50, "Heal", 330, 230, 40);
    this.addObject(skill4);
    
    SkillButton class3 = new SkillButton(150, 270, 225, 50, "Brawler", 195, 310, 40, 2);
    this.addObject(class3);
    TextBox skill5 = new TextBox(50, 300, 225, 50, "Attack Speed Boost", 65, 335, 25);
    this.addObject(skill5);
    
    TextBox skill6 = new TextBox(260, 300, 225, 50, "Wrath", 325, 340, 40); // minus speed and take damage but triple the amount of damage u deal
    this.addObject(skill6);
    
  }
}
