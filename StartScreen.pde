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
    fill(0);
    rect(width/2,height/2,w,h);
  }
  void draw(){
    fill(0);
    rect(width/2,height/2,w,h);
    if(mousePressed){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
       println("test");
       fill(0);
  
      }
    }
  }
  void prepare(){ //equivalent to setup()
    fill(0);
    rect(width/2,height/2,w,h);
  }
}
