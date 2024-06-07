import Green.*;
import java.util.*;

class Start extends World {
  Green green;
  public Start()
  {
    super(height, width, loadImage("TitleScreen.png"), 1);
  }
  void act(float a){

  }
  void draw(){

  }
  void prepare(){ //equivalent to setup()

    SkillButton but = new SkillButton(150, 300, 200, 100, "Start", 160, 375, 0);
    this.addObject(but);
  }
}
