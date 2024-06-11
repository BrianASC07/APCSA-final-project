import Green.*;
import java.util.*;

class SkillButton extends Button {
  int skillCode;


  public SkillButton(int x, int y, int w, int h, String txt, int txtX, int txtY, int txtSize, int skill)
  {
    super(x, y, w, h, txt, txtX, txtY,txtSize);
    skillCode = skill;
  }
  
  void act(float a){    
    if (green.isMouseButtonDown(LEFT) && overRect(getX(), getY(), getWidth(), getHeight())) { //
      green.loadWorld(wrld);
      Skill selectedSkill = new Skill(skillCode);
      wrld.addObject(selectedSkill);
    }
  }
  void draw(){
      stroke(0);
      if (overRect(getX(), getY(), getWidth(), getHeight())) {
        fill(200);
      } else {
        fill(255);
      }
      rect(getX(), getY(), getWidth(), getHeight(), 28);
      textSize(textSize);
      fill(0);
      text(text, textX, textY); 
  }
  int getSkillCode() {
    return skillCode;
  }

}
