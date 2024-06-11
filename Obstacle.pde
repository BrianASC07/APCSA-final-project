import Green.*;
import java.util.*;
import processing.sound.*;

class Obstacle extends Actor {
  int damage;
  float speed;
  Player player = wrld.getObjects(Player.class).get(0);

  Obstacle(float x, float y, PImage img,float resizer, int dmg, float spd){
    super(x, y, img, resizer);
    damage = dmg;
    speed = spd;
  }
  
  void act (float a) {
  }
  
  float getSpeed() {
    return speed;
  }
  void setSpeed(float spd) {
    speed = spd;
  }
  void move() {
    super.move(speed);
  }
  void handleDamage(){
    if (getY() <= 0) {
      wrld.removeObject(this);
    }
    if (getY() >= height) {
      wrld.removeObject(this);
    }
    if (getX() >= width) {
      wrld.removeObject(this);
    }
    if (getX() <= 0) {
      wrld.removeObject(this);
    }
    if (this.intersects(player)) {
        wrld.removeObject(this);
        player.applyDamage(damage);
    }
  }
  void handleDamage(SoundFile file){
    if (getY() <= 0) {
      wrld.removeObject(this);
    }
    if (getY() >= height) {
      wrld.removeObject(this);
    }
    if (getX() >= width) {
      wrld.removeObject(this);
    }
    if (getX() <= 0) {
      wrld.removeObject(this);
    }
    if (this.intersects(player)) {
        wrld.removeObject(this);
        file.play();
        player.applyDamage(damage);
    }
  }

}
