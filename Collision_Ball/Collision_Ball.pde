int count = 100;
Ball[] ME = new Ball[count];

void setup() {
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  size(800, 600);
  for (int i = 0; i < count; i++) {
    ME[i] = new Ball(20);
    //initialize loc, vel, and acc
    //  for (int i = 0; i<loc.length; i++) {
    //    sz[i] = 20;
    //    loc[i] = new PVector(random(0, width), random(0, height));
    //    vel[i] = PVector.random2D();    //random direction
    //    vel[i].mult(random(-5, 5));
    //    acc[i] = new PVector(0, 0);
    //    velc[i] = new PVector(0, 0);
    //    col[i] = color(360);
    //  }
  }
}

void draw() {

  background(0);
  for (int i = 0; i < count; i++) {
    ME[i].display();
    ME[i].move();
    ME[i].bounce();
    for (int j = 0; j < count; j++) {
      if (i!=j) {
        ME[i].collide(ME[j]);
      }
    }
  }
}

class Ball {

  PVector loc, vel, acc, velc;
  color col;
  float sz;

  Ball(float size) {
    sz = size;
    loc = new PVector(random(0, width), random(0, height));
    vel = PVector.random2D();    //random direction
    vel.mult(random(5));
    acc = new PVector(0, 0);
    velc = new PVector(0, 0);
  }

  Ball() {
    sz = 20;
    loc = new PVector(random(0, width), random(0, height));
    vel = PVector.random2D();    //random direction
    vel.mult(random(5));
    acc = new PVector(0, 0);
    velc = new PVector(0, 0);
  }

  void display() {
    //draw the ball
    col = color(frameCount%360, 100, 100, 100);
    fill(col);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    //move the ball
    vel.add(acc);
    loc.add(vel);
  }

  void bounce() {
    //bounce the ball
    if (loc.x + sz/2 > width) {
      vel.x = -abs(vel.x);
    }
    if (loc.x - sz/2 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }

  void collide(Ball otherball) {
    //  for (int j = 0; j < count; j++) {
    //    if (i!=j) {
    //      if (loc[i].dist(loc[j]) < sz[i]/2 +sz[j]/2) {
    //        vel[i].mult(vel[i], 1, velc[i]);
    //        vel[j].mult(vel[j], 1, vel[i]);
    //        velc[i].mult(velc[i], 1, vel[j]);
    //      }
    //    }
    //  }
    if (loc.dist(otherball.loc) < sz/2 + otherball.sz/2) {
      vel.mult(vel, 1, velc);
      otherball.vel.mult(otherball.vel, 1, vel);
      velc.mult(velc, 1, otherball.vel);
    }
  }
}

