import Green.*;
import java.util.*;
import processing.sound.*;

class SkillSelect extends World {
  Green green;
  public SkillSelect()
  {
    super(height, width, loadImage("assets/background.png"), 1);

  }
  void act(float a){

  }

  void prepare(){ //equivalent to setup()
    TextBox heading = new TextBox(150, 10, 225, 50, "Class Select", 160, 45, 40);
    this.addObject(heading);
  }
}
