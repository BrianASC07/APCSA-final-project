import Green.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

class Player extends Entities {
  int health = 100;
  int speed = 0;
  int timer = millis();
  int attackSpeed = 0;

  Player(){
    super(width/2, height/2, loadImage("ship.png"), 0.15);
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
  
  
  int getHealth(){
    return health;
  }
  void applyDamage(int damage){
    health -= damage;
  }

}
