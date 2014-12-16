ArrayList waterfall = new ArrayList();
PVector gravity = new PVector(0, 0.02);
 
void setup(){
  size(640, 640);
  noStroke();
}
 
void draw(){
  fill(0, 20);
  rect(0, 0, width, height);
  fill(0, 150, 255);
  for(int i = 0; i < waterfall.size(); i++){
    Waterfall d = (Waterfall) waterfall.get(i);
    d.draw();
    d.applyForce(gravity);
    if(d.loc.y > d.stop){
      /* Reset defaults */
      d.loc = new PVector(random(200, width-200), 50);
      d.vel = new PVector(sin(radians(random(-90, 90)))/5, 0);
    }
  }
  if(waterfall.size() < 800){
    waterfall.add(new Waterfall(new PVector(random(200, width-200), 50)));
  }
  println(waterfall.size());
}

