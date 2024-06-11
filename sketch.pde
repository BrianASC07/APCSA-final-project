import processing.sound.*;

import Green.*;


import java.util.*;

Green green;
Space wrld;
StartScreen start;
EndScreen end;
SkillSelect skill;

void setup() {
  size(800, 800);
  green = new Green(this);
  start = new StartScreen();
  wrld = new Space(width, height);
  skill = new SkillSelect();
  end = new EndScreen();

  green.loadWorld(skill);
}

void draw() {
  green.handleAct(); //calls the act method for every entity
  green.handleDraw(); // calls the draw method for every entity
}



void keyPressed() {
  green.handleKeyDown(key, keyCode);
}
void keyReleased() {
  green.handleKeyUp(key, keyCode);
}
void mousePressed() {
  green.handleMouseDown(mouseButton);
}
void mouseReleased() {
  green.handleMouseUp(mouseButton);
}
