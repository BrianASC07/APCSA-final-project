import Green.*;
import java.util.*;
import processing.sound.*;

class EndScreen extends World {
  Green green;
  String victoryStatus;
  public EndScreen()
  {
    super(height, width, loadImage("assets/endscreen.png"), 1);

  }
  void act(float a){
    textSize(80);
    fill(0);
    text("You" + victoryStatus + "!", 160, 350); 
  }
  void draw(){
  }
  
  void setVictoryStatus(String txt) {
    victoryStatus = txt;
  }
  void prepare(){ //equivalent to setup()
    Button but = new Button(150, 350, 250, 100, "Return", 160, 425,80);
    this.addObject(but);
    TextBox but1 = new TextBox(140, 250, 310, 100, "You " + victoryStatus + "!", 150, 330,80);
    this.addObject(but1);
        this.addObject(but1);
  }
}
