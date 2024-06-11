import Green.*;
import java.util.*;

class TextBox extends Actor {
  String text;
  int textX;
  int textY;
  int textSize;
  public TextBox(int x, int y, int w, int h, String txt, int txtX, int txtY, int txtSize)
  {
    super(x, y, w, h);
    text = txt;
    textX = txtX;
    textY = txtY;
    textSize = txtSize;
  }
  
  void act(float a){

  }
  void draw(){
      stroke(0);
      fill(255);
      rect(getX(), getY(), getWidth(), getHeight(), 28);
      textSize(textSize);
      fill(0);
      text(text, textX, textY); 

  }

}
