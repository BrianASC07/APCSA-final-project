import Green.*;
import java.util.*;

class SkillButton extends Button {
  int skillCode;
  String[] skills = {"Teleport","Speed Boost"};
  String[] skillDesc = {"Teleport to the position of your mouse (cooldown: 15 seconds)","Gain a 5 second speed boost (cooldown: 30 seconds)"};

  public SkillButton(int x, int y, int w, int h, String txt, int txtX, int txtY, int txtSize, int skill)
  {
    super(x, y, w, h, txt, txtX, txtY,txtSize);
    skillCode = skill;
  }
  
  void act(float a){
    if (green.isMouseButtonDown(LEFT) && overRect(getX(), getY(), getWidth(), getHeight())) { //
      //green.loadWorld(skill);
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
      textSize(80);
      fill(0);
      text(skills[skillCode], textX, textY); 

  }

}
