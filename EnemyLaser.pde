import Green.*;
import java.util.*;
import processing.sound.*;

class EnemyLaser extends Obstacle {
  Player player = wrld.getObjects(Player.class).get(0);
  int timer = frameCount;
  EnemyLaserComponent bullet;
  SoundFile file = new SoundFile(sketch.this, "assets/laserfire.wav");

  EnemyLaser(int x, int y, float xDir, float yDir, int width){
    super(x,y,loadImage("assets/laser.png"),width,0,0);
    bullet = new EnemyLaserComponent(x,y,xDir,yDir);
    this.turnTowards(xDir, yDir);
  }
  
  void act (float a) {
    move();  
    handleDamage();
  }

  void handleDamage(){
    if (timer + 80 <= frameCount) {
      wrld.removeObject(this);
      wrld.addObject(bullet);
      file.play();

    }
  }
  
}
