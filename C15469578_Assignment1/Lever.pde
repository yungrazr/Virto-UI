class Lever
{
  float x,y;
  float ly = (height/2)+175;
  float lx = width-50;
  
  Lever(float x, float y, float lx, float ly)
  {
    this.x = x;
    this.y = y;
    this.lx = lx;
    this.ly = ly;
  }
   
  
}//end class lever

//method for drawing a lever
public void drawLever(float x, float y, float lx, float ly)
{
    //loop for gradient bar using multiple rects
    for(int i=0; i<250; i+=10)
    {
      fill(255,i,0);
      noStroke();
      rect(x,y,30,10);
      y+=10;
    }//end for
    
    //draw handle
    stroke(0);
    strokeWeight(1);
    fill(color1);
    rect(lx,ly,80,40);
    
    
}//end drawLever