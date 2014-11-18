float X, Y, Vx, Vy, Ax, Ay, sz;

void setup(){
  background(0);
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  X = width/2;
  Y = height/2;
  Vx = 0;
  Vy = 0;
  Ax = .1;
  Ay = .1;
  sz = 50;
}

void draw() {
  Vx += Ax;
  Vy += Ay;
  
  X += Vx;
  Y += Vy;
  
  fill(frameCount%360,100,100);
  ellipse(X, Y, sz, sz);
  
  if(X + sz/2 < 0) {
    X = width + sz/2;
  }
  if(X - sz/2 > width) {
    X = -sz/2;
  }
  if(Y + sz/2 < 0) {
    Y = height + sz/2;
  }
  if(Y - sz/2 > height) {
    Y = -sz/2;
  }
  Ax = random(-.1, .1);
  Ay = random(-.1, .1);
}
