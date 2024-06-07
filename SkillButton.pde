import Green.*;
import java.util.*;

class SkillButton extends Button {
  int skillCode;
  String[] skills = {"Teleport","Speed Boost"};
  String[] skillDesc = {"Teleport to the position of your mouse (cooldown: 15 seconds)","Gain a 5 second speed boost (cooldown: 30 seconds)"};

  public SkillButton(int x, int y, int w, int h, String txt, int txtX, int txtY, int skill)
  {
    super(x, y, w, h, txt, txtX, txtY);
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
  boolean overRect(float x, float y, int w, int h)  { //weird scaling here //taken from 
  if (mouseX/2 >= x && mouseX/2 <= x+ (w/2) && 
      mouseY/2 >= y && mouseY/2 <= y+(h/2)) {
    return true;
  } else {
    return false;
  }
}

}
