import Green.*;
import java.util.*;

class Entities extends Actor {
  int health = 0;

  Entities(float x, float y, PImage image, int hp){
    super(x, y, image);
    health = hp;
  }
  Entities(int x, int y, PImage image, int hp){
    super(x, y, image);
    health = hp;
  }
  Entities(float x, float y, PImage image, float resizer, int hp){
    super(x, y, image, resizer);
    health = hp;
  }
  Entities(float x, float y, PImage image, float resizer){
    super(x, y, image, resizer);
  }
  Entities(int x, int y, int w, int h, int hp){
    super(x, y, w, h);
    health = hp;
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
    if (health < 0) {
      health = 0;
    }
    if (health > 100) {
      health = 100;
    }
  }


}
