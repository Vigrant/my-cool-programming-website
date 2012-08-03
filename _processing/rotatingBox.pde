void setup()
{
  size(80,80,P3D);
  background(119,195,195);
  frameRate(10);
  noStroke();
	smooth();
}

void draw()
{
 lights();
 background(119,195,195);
 translate(height/2,width/2);
 fill(abs(sin(frameCount/50.3))*255,abs(sin(frameCount/97.3))*255,abs(sin(frameCount/80.0))*255);
 rotateX(frameCount/10.0);
 rotateY(frameCount/55.0);
 box(abs(sin(frameCount/50.3))*20 + 20);
  
}
