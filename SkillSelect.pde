import Green.*;
import java.util.*;

class SkillSelect extends World {
  Green green;
  public SkillSelect()
  {
    super(height, width, 255);
  }
  void act(float a){

  }
  void draw(){

  }
  void prepare(){ //equivalent to setup()
    Button but = new Button(150, 300, 200, 100, "Start", 160, 375);
    this.addObject(but);
  }
}
