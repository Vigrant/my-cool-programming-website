import processing.opengl.*;

ArrayList cubeList = new ArrayList();


void setup() 
{
  size(450, 450, OPENGL);
}


void draw() 
{
 addCubes();
 backgroundTranslateScaleLights();
 addCubes();
 drawCubes();
}

void backgroundTranslateScaleLights()
{
  background(100,150,100);
  translate(width/2, height/2, 0);
  scale(5);
  lights(); 
  rotateY(frameCount/100.0);
  rotateX(frameCount/100.0);
}

void addCubes()
{
  Cube tempCube = new Cube(0,0,cubeList.size()%100);
  cubeList.add(tempCube);
}

void drawCubes()
{
  for(int x=0;x<cubeList.size();x++)
  {
   rotateX(frameCount/909.0);
   rotateY(frameCount/1000.0);

   ((Cube)cubeList.get(x)).drawCube(); 
  }
  
}


class Cube
{
  
  float xDisplacement;
  float yDisplacement;
  float zDisplacement;
  
  Cube(float xDisplacement,float yDisplacement,float zDisplacement)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.zDisplacement=zDisplacement;
  }
  
  
  
  void drawCube()
  {
  beginShape(QUADS);
  
  fill(abs(sin(frameCount/80.0))*255,abs(cos(frameCount/88.0))*255,abs(sin(frameCount/98.0))*255);
   // +Z "front" face
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement);
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement);
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement);

  // -Z "back" face
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement);

  // +Y "bottom" face
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement);

  // -Y "top" face
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement);
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement);

  // +X "right" face
  vertex( 1+xDisplacement, -1+yDisplacement,  1+zDisplacement);
  vertex( 1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement, -1+zDisplacement);
  vertex( 1+xDisplacement,  1+yDisplacement,  1+zDisplacement);

  // -X "left" face
  vertex(-1+xDisplacement, -1+yDisplacement, -1+zDisplacement);
  vertex(-1+xDisplacement, -1+yDisplacement,  1+zDisplacement);
  vertex(-1+xDisplacement,  1+yDisplacement,  1+zDisplacement);
  vertex(-1+xDisplacement,  1+yDisplacement, -1+zDisplacement);
  
  
  endShape();
  }
}//End cube Class
