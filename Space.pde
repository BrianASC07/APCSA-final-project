import Green.*;
import java.util.*;
import processing.sound.*;

class Space extends World {
  Green green;
  SoundFile file = new SoundFile(sketch.this, "assets/background.wav");

  public Space(int w, int h)
  {
    super(w, h, 0);
    file.loop();
  }
  void act(float a){

  }
  void draw(){
    
  }
  void prepare(){
    Player player = new Player();
    Boss boss = new Boss();
    
    StatBar health = new StatBar(0,0,1);
    StatBar bossHealth = new StatBar(width-200,0,2);
    StatBar skill1Timer = new StatBar(0,50,3);
    StatBar skill2Timer = new StatBar(0,100,4);




    this.addObject(player);
    this.addObject(boss);

    this.addObject(health);
    this.addObject(bossHealth);
    this.addObject(skill1Timer);
    this.addObject(skill2Timer);


  }
}
