float n = 20;
GravityBall[] Ball1 = new GravityBall[n];

void setup() {
  size(800, 600);
  for (int i = 0; i < n; i++) {
    Ball1 = new GravityBall();
  }
}

void draw() {
  background(255);
  fill(0);

  Ball1.move();
  Ball1.bounce();
  Ball1.display();
}


class GravityBall {
  float a;
  float BallX;
  float BallY;
  float sz;
  float Vy;

  GravityBall() {
    sz = random(50);
    BallX = random(sz/2, width-sz/2);
    BallY = 0;
    Vy = 0;
    a = .98;
  }

  void display() {
    ellipse(BallX, BallY, sz, sz);
  }

  void move() {
    Vy += a;                        //Velocity of the  Ball changes with Acceleration
    BallY += Vy;                    //...BallY changes with Vy
  }

  void bounce() {
    if (BallY+sz/2 > height) {
      BallY = height - sz/2;        //reset position of the BallY to the bottom of the screen
      Vy = -abs(Vy);                //reverse the velocity
    }
  }
}

