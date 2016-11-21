class Button
{
  float x,y;
  float bWidth,bHeight;
  float curve;
  String bText;
  color c;
  
  Button(float x, float y, float bWidth, float bHeight,
  float curve, String bText, color c)
  {
    this.x=x;
    this.y=y;
    this.bWidth=bWidth;
    this.bHeight=bHeight;
    this.curve=curve;
    this.bText=bText;
    this.c=c;
  }

}

  public void drawButton(float x, float y, float bWidth, float bHeight,
  float curve, String bText, color c)
  {
     fill(0);
     stroke(c);
     rect(x,y,bWidth,bHeight,curve);
     //mouse hover over check
     if(mouseX>x-bWidth/2 && mouseX <x+bWidth/2 && mouseY>y-bHeight/2 && mouseY <y+bHeight/2)
     {
       fill(20);
       stroke(c);
       rect(x,y,bWidth,bHeight,7);
     }
     textSize(30);
     fill(c);
     text(bText,x,y);
  }