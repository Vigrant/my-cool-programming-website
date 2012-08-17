ArrayList shapes = new ArrayList();
HScrollbar hs1;
 
void setup()
{
  size(450, 450, P3D);
  noStroke(); 
   
  hs1 = new HScrollbar(0, 5, width, 10, 3*5+1);
  createShapes();
}
 
void createShapes()
{
  float c=1;
  for(float b=-70;b<50;b+=2)
  {
     
  float coordinates[]=new float[24];
  float h=.5; //slope coming up
  for(int x=0;x<24;x++)
  {
    switch(x)
    {
    case 0: coordinates[x]=c;break;                //-x
    case 1: coordinates[x]=b;break;                //y
    case 2: coordinates[x]=-c;break;                //+z
    case 3: coordinates[x]=-c;break;                //+x
    case 4: coordinates[x]=b;break;                //y
    case 5: coordinates[x]=-c;break;                //+z
    case 6: coordinates[x]=c;break;                //-x
    case 7: coordinates[x]=b;break;                //y
    case 8: coordinates[x]=c;break;                //-z
    case 9: coordinates[x]=-c;break;                //+x
    case 10:coordinates[x]=b;break;                //y
    case 11:coordinates[x]=c;break;                //-z
    case 12:coordinates[x]=c+h;break;                //-x
    case 13:coordinates[x]=b;break;                //y
    case 14:coordinates[x]=-c-h;break;                //+z
    case 15:coordinates[x]=-c-h;break;                //+x               
    case 16:coordinates[x]=b;break;                //y
    case 17:coordinates[x]=-c-h;break;                //+z
    case 18:coordinates[x]=c+h;break;                //-x
    case 19:coordinates[x]=b;break;                //y
    case 20:coordinates[x]=c+h;break;                //-z
    case 21:coordinates[x]=-c-h;break;                //+x
    case 22:coordinates[x]=b;break;                //y
    case 23:coordinates[x]=c+h;break;                //-z
    }
  }
   shapes.add(new eightCorners(coordinates));
   c+=.5;
  }
   
   
}
 
 
 
void draw()
{  
  lights();
  ambientLight(255, 0, 0);
  pushMatrix();
  backgroundTranslateScaleRotate();
  drawShapes();
  popMatrix();
  updateAndDrawScrollbars();
}

void updateAndDrawScrollbars()
{
 hs1.update();
 hs1.display(); 
 fill(0,0,0);
 rect(0,3,width,1);

}
 
void backgroundTranslateScaleRotate()
{
  background(179,255,255);
  translate(width/2, height/2, 0);
  shapeMode(CENTER);
  scale(3);
}
 
void drawShapes()
{
   
 
 for(int x=0;x<shapes.size();x++)
  {
     //   rotateY(frameCount/1000.0);
     rotateY(frameCount*hs1.getPos()/50000.0);
    ((eightCorners)shapes.get(x)).drawShape();
  }
     
  
}
 
 
 
class eightCorners
{
  float cd[]=new float[24];
   
  eightCorners(float coordinates[])
  {
    cd=coordinates;
  }
   
   
   
  void drawShape()
  {
 
  beginShape(QUADS);
  
  colorPicker(1);
  // +Z "front" face
  corners(0);
  corners(1);
  corners(5);
  corners(4);
  colorPicker(2);
  // -Z "back" face
  corners(3);
  corners(2);
  corners(6);
  corners(7);
  fill(0,0,0);
  // +Y "bottom"
  corners(4);
  corners(5);
  corners(7);
  corners(6);
  fill(0,0,0);
  // -Y "top" face
  corners(2);
  corners(3);
  corners(1);
  corners(0);
  colorPicker(3); 
  // +X "right" face
  corners(1);
  corners(3);
  corners(7);
  corners(5);
  colorPicker(4);
  // -X "left" face
  corners(2);
  corners(0);
  corners(4);
  corners(6);
   
  endShape();
  }
  
  
  void colorPicker(int x)
  {
   int t= x*frameCount;
   
   if(t%5000<2500)
   {
    fill(200-abs(sin(frameCount/103.0))*55 ,50+abs(sin(frameCount/197.0))*205 ,255-abs(sin(frameCount/103.0))*255);
   }
   else if(t%5000<5000)
   {
    fill(100+abs(sin(frameCount/101.0))*155 ,200-abs(sin(frameCount/103.0))*50 ,50+abs(sin(frameCount/197.0))*200); 
   }
   else if(t%5000<7500)
   {
    fill(100+abs(sin(frameCount/197.0))*155 ,200-abs(sin(frameCount/101.03))*150 ,90+abs(sin(frameCount/104.3))*160);  
   }
   else
   {
    fill(255-abs(sin(frameCount/100.0))*50 +60 ,abs(sin(frameCount/197.40))*255 ,100+abs(sin(frameCount/104.3))*100); 
   }
   
  }
   
  void corners(int cornerNumber)
  {
   switch(cornerNumber)
    {
      case 0: vertex(-1+cd[0],-1+cd[1],1+cd[2]);break;     //UP LEFT FRONT Corner
      case 1: vertex(1+cd[3],-1+cd[4],1+cd[5]);break;      //URF Corner
      case 2: vertex(-1+cd[6],-1+cd[7],-1+cd[8]);break;    //ULB
      case 3: vertex(1+cd[9],-1+cd[10],-1+cd[11]);break;   //URB
      case 4: vertex(-1+cd[12],1+cd[13],1+cd[14]);break;   //DLF
      case 5: vertex(1+cd[15],1+cd[16],1+cd[17]);break;    //DRF
      case 6: vertex(-1+cd[18],1+cd[19],-1+cd[20]);break;   //DLB
      case 7: vertex(1+cd[21],1+cd[22],-1+cd[23]);break;   //DRB
      default: vertex(0,0,0);   //Center Default
    }
     
     
  }
   
}

class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(overF()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overF() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(0,0,0);
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio -width/2 +1;
  }
}


