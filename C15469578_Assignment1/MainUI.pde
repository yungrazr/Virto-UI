class MainUI
{
  
  float ly=(height/2)+175;
  float lx=width-80;
  float speed=0;
  float theta;
  float lTheta;
  float x;
  float y;
  
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
     
     //rect around 'speed'
     fill(0);
     stroke(color1);
     strokeWeight(3);
     rect(width-115, height-75,210,40);
     
     //text 'speed'
     textSize(30);
     fill(color1);
     speed = map(ly,(height/2)+255, (height/2)-5, 0,1000);
     text(String.format("Speed: %.0f", speed), width-200, height-65);
     
     if(speed>=900)
     {
       textSize(30);
       fill(random(0,255),0,0);
       text("HYPERDRIVE MODE",width-325,height-20);
       color1=color(random(0,255),0,0);
     }
     else
     {
       color1=color(70,247,201);
     }
     
     //ui draw
     strokeWeight(4);
     stroke(color1);
     line(width,(height/2)-100,width-150,(height/2)-100);
     line(width-150,(height/2)-100,width-150,(height/2)+100);
     line(width-150,(height/2)+100,width-350,(height/2)+250);
     line(width-350,(height/2)+250,300,(height/2)+250);
     line(width-350,(height/2)+250,width-350,height);
     line(300,(height/2)+250,300,(height/2)+height);
     line(300,(height/2)+250,150,(height/2)+100);
     line(150,(height/2)+100,0,(height/2)+100);
     
     //radar
     strokeWeight(2);
     stroke(color1);
     fill(0);
     for(int i=300; i>=50; i-=50)
     {
       ellipse(100,height-100,i,i); 
     }
     //line(100,height-100,100,height-250);
    lTheta = theta - (250 * 0.01f);
    x = 100 + sin(lTheta) * 150 ;
    y = height-100 - cos(lTheta) * 150;
    stroke(color1);
    line(100, height-100, x, y);
    theta += 0.02f;
    
    
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
            println("Lever activated!",ly); 
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
  }//end mouseDragged
  
  void drawLever()
  {
    float uy=height/2;
    float ux=width-60;
    
    //loop for gradient bar using multiple rects
    for(int i=0; i<250; i+=10)
    {
      fill(255,i,0);
      noStroke();
      rect(ux,uy,30,10);
      uy+=10;
    }//end for
    
    //draw handle
    stroke(0);
    strokeWeight(1);
    fill(color1);
    rect(lx,ly,80,40);
    
  }//end drawLever
  
   
}//end class MainUI