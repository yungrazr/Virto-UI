/*
This is the class for the
actual UI part of the program
*/
class MainUI
{
  float bWidth = 160;
  float bHeight = 80;
  float bx = 100;
  float by = 100;
  
  float ly = (height/2)+175;
  float lx = width-80;
  float lposx = width-60;
  float lposy = height/2;
  float speed = 0;
  
  float theta;
  float lTheta;
  float x,y;
  
  void drawMainUI()
  {
    mouseDragged();
    if(keyPressed)
    {
      if(key=='0')
      {
        launch=false;
      }
    }
     drawLever(lposx,lposy,lx,ly);
     
     //rect around 'speed'
     fill(0);
     stroke(color1);
     strokeWeight(3);
     rect(width-115, height-75,210,40);
     
     //text 'speed'
     textSize(30);
     fill(color1);
     speed = map(ly,(height/2)+255, (height/2)-5, 0,1000);
     text(String.format("Speed: %.0f", speed), width-115, height-75);
     
     if(speed>=900)
     {
       textSize(30);
       fill(random(0,255),0,0);
       text("HYPERDRIVE MODE",width-170,height-30);
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
    
    //sidepanel
    stroke(color1);
    strokeWeight(4);
    fill(0);
    float x=-50;
    float x1=200;
    rect(x,200,x1,350,7);
    if(mouseX>x-x1/2 && mouseX <x+x1/2 && mouseY>200-350/2 && mouseY <200+350/2)
     {
       x=50;
       x1=300;
       rect(x,200,x1,350,7);
       drawButton(100,100,bWidth,bHeight,7,"Graph",color1);
       drawButton(100,200,bWidth,bHeight,7,"Map",color1);
       drawButton(100,300,bWidth,bHeight,7,"Blah",color1);
     }
     else
     {
       x=-50;
       x1=200;
     }
    
    
  }
  
  void mouseDragged()
  {
    if(mousePressed)
    {
          if(mouseX>lx-80/2 && mouseX <lx+80/2 && mouseY>ly-60/2 && mouseY <ly+60/2)
          {
            if(ly>=lposy && ly<=lposy+250)
            {
            ly=mouseY;
            println("Lever activated!",ly); 
            }
            //error checking to make sure lever cant move out of range
            else if(ly<lposy)
            {
              ly=lposy+5;
            }
            else if(ly>lposy+250)
            {
              ly=lposy+245;
              
            }
          }
    }           
  }//end mouseDragged
  
   
}//end class MainUI