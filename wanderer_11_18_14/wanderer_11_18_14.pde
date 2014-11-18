PVector loc, V, A;
float sz;

void setup(){
  background(0);
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  loc = new PVector(width/2, height/2);
  V = new PVector(0,0);
  A = new PVector(.1, .1); 
  sz = 50;
}

void draw() {
  V.add(A);
  loc.add(V);
  
  fill(frameCount%360,100,100);
  ellipse(loc.x, loc.y, sz, sz);
  
  if(loc.x + sz/2 < 0) {
    loc.x = width + sz/2;
  }
  if(loc.x - sz/2 > width) {
    loc.x = -sz/2;
  }
  if(loc.y + sz/2 < 0) {
    loc.y = height + sz/2;
  }
  if(loc.y - sz/2 > height) {
    loc.y = -sz/2;
  }
  A.set(random(-.1, .1),random(-.1, .1));
}
