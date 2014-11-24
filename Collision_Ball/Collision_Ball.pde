//declare loc, vel, and acc
int count = 100;
PVector loc[] = new PVector[count];
PVector vel[] = new PVector[count];
PVector acc[] = new PVector[count];
color col[] = new color[count];
PVector velc[]= new PVector[count];
float sz[] = new float[count];

void setup() {
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  size(800, 600);
  //initialize loc, vel, and acc
  for (int i = 0; i<loc.length; i++) {
    sz[i] = 20;
    loc[i] = new PVector(random(0, width), random(0, height));
    vel[i] = PVector.random2D();    //random direction
    vel[i].mult(random(-5, 5));
    acc[i] = new PVector(0, 0);
    velc[i] = new PVector(0, 0);
    col[i] = color(360);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < count; i++) {
    col[i] = color(frameCount%360, 100, 100, 100);
    fill(col[i]);
    //move the ball
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);

    for (int j = 0; j < count; j++) {
      if (i!=j) {
        if (loc[i].dist(loc[j]) < sz[i]/2 +sz[j]/2) {
          vel[i].mult(vel[i], 1, velc[i]);
          vel[j].mult(vel[j], 1, vel[i]);
          velc[i].mult(velc[i], 1, vel[j]);
        }
      }
    }

    //draw the ball
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

    //bounce the ball
    if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
      vel[i].x *= -1;
    }
    if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
      vel[i].y *= -1;
    }
  }
}

