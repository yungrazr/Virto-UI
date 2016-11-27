/*
This is the class for the
actual UI part of the program
*/
class MainUI
{
  boolean barchart=false;
  boolean pInfo=false;
  
  float bWidth = 160;
  float bHeight = 80;
  float bx = 100;
  float by = 100;
  
  float ly = (height/2)+175;
  float lx = width-65;
  float lposx = width-60;
  float lposy = height/2;
  float speed = 0;
  
  float theta;
  float lTheta;
  float x,y;
  float sx;
  float sx1;
  
  float xline=0;
  float xline2=0;
  float yline=0;
  float yline2=0;
  PShape s,s1,s2;
  
  void drawMainUI()
  {
    image(bg,0,0);
    mouseDragged();
    if(keyPressed)
    {
      if(key=='0')
      {
        launch=false;
      }
    }
    
     for(int i=0;i<height;i+=height/7)
     {
       xline2+=1;
       strokeWeight(1);
       stroke(color1);
       line(xline,i,xline2,i);
       if(xline2>=width)
       {
         xline+=1;
       }
       
       if(xline>=width)
       {
         xline=0;
         xline2=0;
       }
     }
     for(int i=0;i<width;i+=width/12)
     {
       yline2+=0.5;
       strokeWeight(1);
       stroke(color1);
       line(i,yline,i,yline2);
       if(yline2>=height)
       {
         yline+=0.5;
       }
       
       if(yline>=height)
       {
         yline=0;
         yline2=0;
       }
     }
  
     drawUI();
     drawLever(lposx,lposy,lx,ly);
     text(String.format("SYSTIME: %d: %d: %d ",hour(),minute(),second()),(width/2)-30, height-75);
     
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
     
     //radar
     strokeWeight(2);
     stroke(color1);
     fill(0);
     for(int i=300; i>=50; i-=50)
     {
       ellipse(100,height-100,i,i); 
     }
    lTheta = theta - (250 * 0.01f);
    x = 100 + sin(lTheta) * 150 ;
    y = height-100 - cos(lTheta) * 150;
    stroke(color1);
    line(100, height-100, x, y);
    theta += 0.02f;
    fill(color1);
    
    //sidepanel
    stroke(color1);
    strokeWeight(4);
    fill(0);
    rect(sx,200,sx1,350,70);
    pushMatrix();
    fill(color1);
    translate(120,100);
    rotate(PI/2);
    text("Sidepanel",100,100);
    popMatrix();
    
    if(mouseX>sx-(sx1)/2 && mouseX <sx+(sx1)/2 && mouseY>200-350/2 && mouseY <200+350/2)
     {
       sx=50;
       sx1=300;
       if(mouseX>sx-(sx1)/2 && mouseX <sx+(sx1)/2 && mouseY>200-350/2 && mouseY <200+350/2)
       {
         sx=50;
         sx1=300;
         fill(0);
         rect(sx,200,sx1,350,70);
         drawButton(100,100,bWidth,bHeight,7,"Chart",color1);
         if(mousePressed)
         {
            if(mouseX>100-bWidth/2 && mouseX <100+bWidth/2 && mouseY>100-bHeight/2 && mouseY <100+bHeight/2)
            {
               barchart=true;
            }
         }
         drawButton(100,200,bWidth,bHeight,7,"Map",color1);
         if(mousePressed)
         {
            if(mouseX>100-bWidth/2 && mouseX <100+bWidth/2 && mouseY>200-bHeight/2 && mouseY <200+bHeight/2)
            {
              pInfo=true;  
            }
         }
         drawButton(100,300,bWidth,bHeight,7,"Back",color1);
         if(mousePressed)
         {
            if(mouseX>100-bWidth/2 && mouseX <100+bWidth/2 && mouseY>300-bHeight/2 && mouseY <300+bHeight/2)
            {
               launch=false;
            }
         }
       }
     }
     else
     {
       sx=-50;
       sx1=200;
     }
     
     if(barchart)
     {
       drawBarchart(300,400,30);
     }
     if(pInfo)
     {
       drawPlanetInfo(200,150);
     }
    
  }
  
  //mouseDragged function used for Lever
  //to meter the speed update the pos
  void mouseDragged()
  {
    if(mousePressed)
    {
          if(mouseX>lx-80/2 && mouseX <lx+80/2 && mouseY>ly-60/2 && mouseY <ly+60/2)
          {
            if(ly>=lposy && ly<=lposy+250)
            {
            ly=mouseY;
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

void setUIshape()
  {
    s = createShape();
    s.beginShape();
    s.fill(0);
    s.strokeWeight(4);
    s.vertex(width,(height/2)-50);
    s.vertex(width,(height/2)-50);
    s.vertex(width-150,(height/2)-50);
    s.vertex(width-150,(height/2)+100);
    s.vertex(width-350,(height/2)+250);
    s.vertex(width-350,height);
    s.vertex(width,height);
    s.endShape(CLOSE);
    
    s1 = createShape();
    s1.beginShape();
    s1.fill(0);
    s1.stroke(color1);
    s1.strokeWeight(4);
    s1.vertex(width-350,height);
    s1.vertex(width-350,(height/2)+250);
    s1.vertex(300,(height/2)+250);
    s1.vertex(300,height);
    s1.endShape(CLOSE);
    
    s2 = createShape();
    s2.beginShape();
    s2.fill(0);
    s2.strokeWeight(4);
    s2.vertex(300,height);
    s2.vertex(300,(height/2)+250);
    s2.vertex(150,(height/2)+100);
    s2.vertex(0,(height/2)+100);
    s2.vertex(0,height);
    s2.endShape(CLOSE);
  }

void drawUI()
{
  s.setStroke(color1);
  s1.setStroke(color1);
  s2.setStroke(color1);

    shape(s, 0,0);
    shape(s, 15,15);
    shape(s1, 0,0);
    shape(s2, 0,0);
    shape(s2, -15,15);
    strokeWeight(2);
    stroke(color1);
    rect((width/2)-25,height-40,600,120,30);

}