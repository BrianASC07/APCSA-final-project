import Green.*;
import java.util.*;

class Button extends Actor {
  Green green;

  
  public Button(float x, float y, int w, int h)
  {
    super(x, y, w, h);
  }
  
  void act(float a){

  }
  void draw(){
    fill(45);
    rect(width/2,height/2,getWidth(), getHeight());
    if(mousePressed){
      if(mouseX > getX() && mouseX <  getX()+getWidth() && mouseY > getY() && mouseY < getY() + getHeight()){
       println("test");
       fill(0);
      }
    }
  }
  void onHover(){ 

  }
  void onClick(){ 

  }
}
