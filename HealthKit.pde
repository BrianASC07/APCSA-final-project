import Green.*;
import java.util.*;
import processing.sound.*;

class HealthKit extends Obstacle {
  SoundFile file = new SoundFile(sketch.this, "assets/heal.wav");

  HealthKit(int x, int y, float xDir, float yDir, float speed){
    super(x,y,loadImage("assets/heal.png"),0.07,-15,speed);
    this.turnTowards(xDir, yDir);
  }
  
  void act (float a) {
    move();
    handleDamage(file);
  }
  

  
}
