int count = 1000;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count]; 
PVector[] acc = new PVector[count];
float[] sz = new float[count];
PImage CharlieBrown; 

void setup() {
  CharlieBrown = loadImage("charlie-brown-christmas-2.jpg");
  size(CharlieBrown.width, CharlieBrown.height);
  //initialize variables
  for (int i = 0; i < count; i++) {
    sz[i] = random(5);
    loc[i] = new PVector(random(width), random(height));
    vel[i] = new PVector(0, 1);
    acc[i] = new PVector(0, 0);
  }
  noStroke();
  fill(255);
}

void draw() {
  background(CharlieBrown);
  for (int i = 0; i < count; i++) {
    //move snowflake
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(3);
    //draw snowflake
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
    //change horizontal acc
    acc[i].x = random(-.1, .1);
    acc[i].y = 2 - sq(vel[i].y);
    //restart snowflake
    if (loc[i].y - sz[i]/2 > height) {
      loc[i].set(random(width), -sz[i]/2);
    }
  }
}

