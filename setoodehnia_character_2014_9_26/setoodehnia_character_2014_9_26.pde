void setup(){
  size(660,660);
  background(255,255,255);
}


//x=120 y=70
void draw(){
background(255);
float x=mouseX;
float y=mouseY;
//head
fill(#00B9FF);
rect(x,y,70,40);
fill(#FAFF00);
rect(x+10,y+10,50,20,5);

//neck
line(x+35,y+40,x+35,y+60);

//body
fill(#00B9FF);
rect(x-10,y+60,90,80);
fill(#FF2200);
ellipse(x+35,y+100,70,60);

float z=0;
float w=0;
float dz=1;
float dw=1;
//arms and hands
line(x-60,y+60+z,x+130,y+60+z);
rect(x-80,y+50+w,20,20);
rect(x+130,y+50+w,20,20);

//legs and feet
line(x+10,y+140,x+10,y+170);
line(x+60,y+140,x+60,y+170);
rect(x-10,y+170,20,10,5,0,0,0);
rect(x+60,y+170,20,10,0,5,0,0);

}
