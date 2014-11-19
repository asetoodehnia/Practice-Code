//declare loc, vel, and acc
PVector loc, vel, acc;
float sz = 50;

void setup() {
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  size(800, 600);
  //initialize loc, vel, and acc
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();    //random direction
  acc = new PVector(0, 0);
}

void draw() {
    
  //move the ball
  vel.add(acc);
  loc.add(vel);

  //draw the ball
  ellipse(loc.x, loc.y, sz, sz);

  //bounce the ball
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0){
    vel.y *= -1;
  }
  if (mouseX >= loc.x - sz/2 && mouseX <= loc.x + sz/2 && mouseY >= loc.y - sz/2 && mouseY <= loc.y + sz/2){
    fill (frameCount%360, 100, 100, 100);
  } else {
    fill (360);
  }
}

