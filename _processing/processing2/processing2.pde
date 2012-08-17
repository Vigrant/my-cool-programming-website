ArrayList cubes = new ArrayList();


void setup()
{
  size(450, 450, P3D);
  textureMode(NORMALIZED);
  noStroke();
  shapeMode(CENTER);
  makeTexturedCubes();
}
 
 
void makeTexturedCubes()
{
  for(int x=0;x<9;x++)
  {
    TexturedCube cube1 = new TexturedCube(x*2,0,0);
    TexturedCube cube2 = new TexturedCube(x*2,-2,0);
    TexturedCube cube3 = new TexturedCube(x*2,-4,0);
    TexturedCube cube4 = new TexturedCube(x*2,-6,0);
    TexturedCube cube5 = new TexturedCube(x*2,-8,0);
    TexturedCube cube6 = new TexturedCube(x*2,-10,0);
    TexturedCube cube7 = new TexturedCube(x*2,-12,0);
    TexturedCube cube8 = new TexturedCube(x*2,-14,0);
    TexturedCube cube9 = new TexturedCube(x*2,-16,0);
    TexturedCube cube10 = new TexturedCube(x*2,-18,0);
    TexturedCube cube11 = new TexturedCube(x*2,-20,0);
    TexturedCube cube12 = new TexturedCube(x*2,-22,0);


    
    cubes.add(cube1);
    cubes.add(cube2);
    cubes.add(cube3);
    cubes.add(cube4);
    cubes.add(cube5);
    cubes.add(cube6);
    cubes.add(cube7);
    cubes.add(cube8);
    cubes.add(cube9);
    cubes.add(cube10);
    cubes.add(cube11);
    cubes.add(cube12);
    
    
  }
   
}
 
void draw()
{
  backgroundTranslateScaleRotate();
  texturedCubes(); 
}
 
void backgroundTranslateScaleRotate()
{
  background(179,255,255);
  translate(width/2,height*.75, 0);
  shapeMode(CENTER);
  scale(10);
  lights();
  
}
 
void texturedCubes()
{
   
 for(int x=0;x<cubes.size();x++)
 {
   rotateY(frameCount/4000.0 );
   pushMatrix();
   rotateY(x*(PI*2)/9 + PI/6 );
   rotateY(frameCount/90.0 );
   ((TexturedCube)cubes.get(x)).drawCube();
   popMatrix();
 }
 
  
}
 
 
 
class TexturedCube
{
   
  int xDisplacement;
  int yDisplacement;
  int zDisplacement;
   
  TexturedCube(int xDisplacement,int yDisplacement,int zDisplacement)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.zDisplacement=zDisplacement;
  }
   
   
   
  void drawCube()
  {
  beginShape(QUADS);
   
  fill(255*sin(frameCount/8000.0*xDisplacement*36),sin(frameCount/97.0)*abs(yDisplacement)*10,255*abs(sin(frameCount/101.0*xDisplacement)),255);
 
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
   
}

