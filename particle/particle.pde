ArrayList<Waterfall> water = new ArrayList<Waterfall>();
PVector gravity = new PVector(0, 0.02);

void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  fill(0,15);
  rect(0, 0, width, height); 
  fill(0, 150, 255);
  for (int i = 0; i < water.size (); i++) {
    Waterfall j = water.get(i);
    j.display();
    j.applyForce(gravity);
    if (j.loc.y > j.stop) {
      /* Results */
      j.loc = new PVector(random(200, width-200), 50);
      j.vel = new PVector(sin(radians(random(-90, 90)))/5, 0);
    }
  }
  if (water.size() < 800) {
    water.add(new Waterfall(new PVector(random(200, width-200), 50)));
  }
  println(water.size());
}

