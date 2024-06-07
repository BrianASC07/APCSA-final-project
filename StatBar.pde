import Green.*;
import java.util.*;

class StatBar extends Entities {
  Green green;
  float stat;
  int statCode = 0;
  String statName;
  public StatBar(int x, int y, int sc)
  {
    super(x, y, 200, 40);
    statCode = sc;
  }
  
  void getStat() {
    if (statCode == 1) {
      Player player = world.getObjects(Player.class).get(0);
      stat = player.getHealth();
      statName = "Health";
    }
    if (statCode == 2) {
      Boss boss = world.getObjects(Boss.class).get(0);
      stat = boss.getHealth();
      statName = "Boss Health";
    }
    if (statCode == 3) {
      Player player = world.getObjects(Player.class).get(0);
      stat = player.getSkill1Timer() * (100.0/5);
      statName = "Skill 1";
    }
    if (statCode == 4) {
      Player player = world.getObjects(Player.class).get(0);
      stat = player.getSkill2Timer() * (100.0/10);
      statName = "Skill 2";
    }
  }
  
  void draw(){
    fill(200);
    rect(0,0,200,40, 7);
    getStat();
    fill(0, 255, 0);
    rect(0,0,stat * 2,40, 7);
    textSize(30);
    fill(255);
    text(statName, 40, 30); 
  }

}
