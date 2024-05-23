import Green.*;
import java.util.*;

Green green;
Space world;

void setup() {
  size(800, 800);
  green = new Green(this);
  world = new Space(width, height);
  green.loadWorld(world);
}

void draw() {
  green.handleAct();
  green.handleDraw();
}
