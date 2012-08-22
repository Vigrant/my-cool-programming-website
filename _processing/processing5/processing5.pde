ArrayList cubeList=new ArrayList();
int cubeSize=1;



void setup()
{
  size(450,450,P3D);
  noStroke();
}


void draw()
{
  background(179,255,255);
  translate(width/2,height/2);
  lights();
 }
 
 
/* CLASS CUBE*/

class Cubes
{
  int xDisplacement;
  int yDisplacement;
  int zDisplacement;
  int cubeSize;
  int number;
  int startColor;
  float rgb[]= {0,0,0};
  int rgbDir[]= {1,1,1};

  Cubes(int xDisplacement,int yDisplacement,int zDisplacement,int cubeSize,int startColor)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.zDisplacement=zDisplacement;
   this.cubeSize=cubeSize;
   this.startColor=startColor;
   switch(startColor)
   {
   case 0: rgb[0]=100;rgb[1]=255;rgb[2]=100;break;
   case 1: rgb[0]=255;rgb[1]=100;rgb[2]=0;break;
   case 2: rgb[0]=0;rgb[1]=100;rgb[2]=255;break;
   }

   } 
  
  void drawCube()
  {
   pushMatrix();
   translate(xDisplacement,yDisplacement+20*sin((rotateAmount2*6*(abs(xDisplacement)+30))/360.0),zDisplacement); 
   rgb[0]=startColor*30+190*abs(sin(frameCount/100.0)); 
   rgb[1]=190*abs(sin(frameCount/97.0))+startColor*50; 
   rgb[2]=255*abs(sin(frameCount/93.0))-startColor*100; 
   
   fill(rgb[0],rgb[1],rgb[2],255);
   box(cubeSize); 
   popMatrix();
  }
}
