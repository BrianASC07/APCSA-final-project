import Green.*;
import java.util.*;

class Button extends Actor {
  String text;
  int textX;
  int textY;
  public Button(int x, int y, int w, int h, String txt, int txtX, int txtY)
  {
    super(x, y, w, h);
    text = txt;
    textX = txtX;
    textY = txtY;
  }
  
  void act(float a){
    if (green.isMouseButtonDown(LEFT) && overRect(getX(), getY(), getWidth(), getHeight())) { //
      green.loadWorld(world);
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
      text(text, textX, textY); 

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
