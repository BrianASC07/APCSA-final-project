import Green.*;

import Green.*;
import java.util.*;

Green green;
Space world;
Start start;

void setup() {
  size(800, 800);
  green = new Green(this);
  start = new Start(width, height);
  world = new Space(width, height);
  start = new Start(width, height);

  green.loadWorld(world);
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
