int circle = 20;
float[] x = new float[circle];
float[] y = new float[circle];
float[] colors = new float[360];
void setup(){
 size(displayWidth,displayHeight);
 colorMode(HSB,100);
}

void draw(){
  background(0);
  x[circle-1]= mouseX;
  y[circle-1]= mouseY;
  
  for(int i=0; i<x.length-1; i++){
    x[i]=x[i+1]+50;
    y[i]=y[i+1];
  }
  
  for(int i=circle-1; i>=0; i--){
    noStroke();
    fill(100*i/(circle-1),100,100,50);
    ellipse(x[i],y[i], 50, 50);
  }
 
}
