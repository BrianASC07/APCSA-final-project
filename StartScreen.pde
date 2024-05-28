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
    if(mousePressed){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
       println("The mouse is pressed and over the button");
       fill(0);
       //do stuff 
  
      }
    }
  }
  void prepare(){
    rect(width/2,height/2,w,h);
    fill(0);
  }
}
