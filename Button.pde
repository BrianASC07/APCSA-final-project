import Green.*;
import java.util.*;

class Button extends TextBox {

  public Button(int x, int y, int w, int h, String txt, int txtX, int txtY, int txtSize)
  {
    super(x, y, w, h, txt, txtX, txtY,txtSize);
  }
  
  void act(float a){
    if (green.isMouseButtonDown(LEFT) && overRect(getX(), getY(), getWidth(), getHeight()) && text.equals("Start")) { //
      green.loadWorld(skill);
    }
    else if (green.isMouseButtonDown(LEFT) && overRect(getX(), getY(), getWidth(), getHeight()) && text.equals("Return")) { //
      green.loadWorld(start);
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
  boolean overRect(float x, float y, int w, int h)  {  //taken from 
  if (mouseX/2 >= x && mouseX/2 <= x+ (w/2) && 
      mouseY/2 >= y && mouseY/2 <= y+(h/2)) {
    return true;
  } else {
    return false;
  }
}

}
