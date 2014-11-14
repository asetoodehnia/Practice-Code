float a = .98;
float BallX;
float BallY;
float sz = 50;
float Vx = 0;
float Vy = 0;

void setup() {
  size(800,600);
  BallX = width/2;
  BallY = 0;
}

void draw() {
  background(255);
  fill(0);
  ellipse(BallX, BallY, sz, sz);
  Vy += a;                        //Velocity of the  Ball changes with Acceleration
  BallX += Vx;                    //...BallX changes with Vx
  BallY += Vy;                    //...BallY changes with Vy
  if (BallY+sz/2 > height) {
    BallY = height - sz/2;        //reset position of the BallY to the bottom of the screen
    Vy = -abs(Vy);                //reverse the velocity
  }
}

