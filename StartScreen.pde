import Green.*;
import java.util.*;

class Start extends World {
  Green green;
  int x = 0;
  int y = 0;
  int w = 300;
  int h = 300;
  
  public Start(int w, int h)
  {
    super(w, h, 255);
  }
  void act(float a){

  }
  void draw(){

  }
  void prepare(){ //equivalent to setup()
    Button start = new Button(width/2, height/2, 300,300);
    this.addObject(start);
  }
}
