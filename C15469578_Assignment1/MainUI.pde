class MainUI
{
  
  void drawMainUI()
  {
    drawLever();
    
  }
  
  void drawLever()
  {
    float uy=height/2;
    float ux=width-100;
    float ly=height/2;
    float lx=width-100;
  
    for(int i=0; i<250; i+=10)
    {
      fill(255,i,0);
      noStroke();
      rect(ux,uy,40,10);
      
      uy+=10;
    }//end for
    
    stroke(255);
    strokeWeight(1);
    fill(40);
    rect(lx,ly,80,20);
    
  }//end drawLever
   
}//end class MainUI