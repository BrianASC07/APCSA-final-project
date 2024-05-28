import Green.*;
import java.util.*;

class StatBar extends Entities {
  Green green;
  int stat;
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
  }
  
  void draw(){
    fill(200);
    rect(0,0,200,40);
    getStat();
    fill(0, 255, 0);
    rect(0,0,stat * 2,40);
    textSize(30);
    fill(255);
    text(statName, 40, 30); 
  }

}
