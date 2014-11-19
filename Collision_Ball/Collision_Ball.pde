//declare loc, vel, and acc
PVector loc[] = new PVector[10];
PVector vel[] = new PVector[10];
PVector acc[] = new PVector[10];
float sz = 50;
void setup() {
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  size(800, 600);
  //initialize loc, vel, and acc
  for (int i = 0; i<loc.length; i++) {
    loc[i] = new PVector(width/2, height/2);
    vel[i] = PVector.random2D();    //random direction
    vel[i].mult(random(1,5));
    acc[i] = new PVector(0, 0);
  }
}

void draw() {
  
  for(int i = 0; i<loc.length; i++){
    //move the ball
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    
    //draw the ball
    ellipse(loc[i].x, loc[i].y, sz, sz);
  
  
  //bounce the ball
  if (loc[i].x + sz/2 > width || loc[i].x - sz/2 < 0) {
    vel[i].x *= -1;
  }
  if (loc[i].y + sz/2 > height || loc[i].y - sz/2 < 0) {
    vel[i].y *= -1;
  }
  if (dist(mouseX, mouseY, loc[i].x, loc[i].y) < sz/2) {
    fill (frameCount%360, 100, 100, 100);
  } else {
    fill (360);
  }
  }
}

