import Green.*;
import java.util.*;

class StartScreen extends World {
  Green green;
  public StartScreen()
  {
    super(height, width, loadImage("assets/TitleScreen.png"), 1);
  }
  void act(float a){

  }
  void draw(){
    
  }
  void prepare(){ //equivalent to setup()

    TextBox button = new Button(150, 300, 200, 100, "Start", 160, 375,80);
    this.addObject(button);
  }
}
