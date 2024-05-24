import Green.*;
import java.util.*;

class Space extends World {
  Green green;
  public Space(int w, int h)
  {
    super(w, h, 0);
  }
  void act(float a){

  }
  void draw(){
  
  }
  void prepare(){
    Player player = new Player();
    this.addObject(player);
  }
}
