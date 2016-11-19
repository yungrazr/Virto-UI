class MainUI
{
  float ly=(height/2)+175;
  float lx=width-80;
  float speed=0;
  
  void drawMainUI()
  {
    drawLever();
    mouseDragged();
    
    if(keyPressed)
    {
      if(key=='0')
      {
        launch=false;
      }
    }
    
    //text speed
    
     textSize(30);
     fill(color1);
     speed = map(ly,(height/2)+255, (height/2)-5, 0,1000);
     text(String.format("Speed: %.0f", speed), width-200, height-50);
    
    
  }
  
  void mouseDragged()
  {
    if(mousePressed)
    {
          if(mouseX>lx-80/2 && mouseX <lx+80/2 && mouseY>ly-60/2 && mouseY <ly+60/2)
          {
            if(ly>=height/2 && ly<=(height/2)+250)
            {
            ly=mouseY;
            println("Lever activated! %f",ly); 
            }
            //error checking to make sure lever cant move out of range
            else if(ly<height/2)
            {
              ly=(height/2)+5;
            }
            else if(ly>(height/2)+250)
            {
              ly=(height/2)+245;
              
            }
          }
    }
            
  }
  
  void drawLever()
  {
    float uy=height/2;
    float ux=width-80;
    
    //loop for gradient bar using multiple rects
    for(int i=0; i<250; i+=10)
    {
      fill(255,i,0);
      noStroke();
      rect(ux,uy,30,10);
      
      uy+=10;
    }//end for
    
    //draw handle
    stroke(255);
    strokeWeight(1);
    fill(60);
    rect(lx,ly,80,40);
    
  }//end drawLever
  
   
}//end class MainUI