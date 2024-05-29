import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Player extends Entities {
  int speed = 0;
  int shield = 0;
  int timer = millis();

  Player(){
    super(width/2, height/2, loadImage("ship.png"), 0.15, 100);
  }
  
  void act (float a) {
    shoot();
    move();
  }
  
  void move() { // moves the character using wasd
    if(green.isKeyDown('w')) {
      moveGlobal(0, -2 - speed);
    }
    if(green.isKeyDown('s')) {
      moveGlobal(0, 2 + speed);
    }
    if(green.isKeyDown('d')) {
      moveGlobal(2 + speed, 0);
    }
    if(green.isKeyDown('a')) {
      moveGlobal(-2 - speed, 0);
    }
  }
  
  void shoot() {
    if (second() != timer) {
      timer = second();
      PlayerBullet bullet = new PlayerBullet(getX(), getY());
      world.addObject(bullet);
    }
  }
}
