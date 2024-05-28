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
    StatBar health = new StatBar(0,0,1);
    Boss boss = new Boss();


    this.addObject(player);
    this.addObject(health);
    this.addObject(boss);
  }
}
