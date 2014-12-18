class Waterfall {
  PVector loc;
  PVector vel;
  PVector acc;
  float stop;
  float d = random(1, 5);
   
  Waterfall(PVector loc){
    this.loc = loc;
    stop = height-random(50, 100);
    vel = new PVector(sin(radians(random(-90, 90)))/5, 0);
    acc = new PVector(0, 0);
  }
   
  void display(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    ellipse(loc.x, loc.y, d, d);
  }
   
  void applyForce(PVector force){
    PVector f = PVector.div(force, 1.5-d/5);
    acc.add(f);
  }
}
