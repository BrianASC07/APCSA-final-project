import Green.*;
import java.util.*;

class Entities extends Actor {
  int health;
  int velocity;

  Entities(float x, float y, PImage image){
    super(x, y, image);
  }
  Entities(int x, int y, PImage image){
    super(x, y, image);
  }
  Entities(float x, float y, PImage image, float resizer){
    super(x, y, image, resizer);
  }
  Entities(int x, int y, int w, int h){
    super(x, y, w, h);
  }
  void act (float a) {
  }
  
  int getHealth(){
    return health;
  }
  void applyDamage(int damage){
    health -= damage;
  }

}
