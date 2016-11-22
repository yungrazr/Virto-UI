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
  float sx;
  float sx1;
  
  float xline=0;
  float xline2=0;
  float yline=0;
  float yline2=0;
  PShape s,s1,s2;
  
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
    
     for(int i=0;i<height;i+=height/7)
     {
       xline2+=2.8;
       strokeWeight(1);
       stroke(color1);
       line(xline,i,xline2+500,i);
       if(xline2>=width)
       {
         xline+=2.8;
       }
       
       if(xline>=width)
       {
         xline=0;
         xline2=0;
       }
     }
     for(int i=0;i<width;i+=width/12)
     {
       yline2++;
       strokeWeight(1);
       stroke(color1);
       line(i,yline,i,yline2+300);
       if(yline2>=height)
       {
         yline++;
       }
       
       if(yline>=height)
       {
         yline=0;
         yline2=0;
       }
     }
  
     drawUI();
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
    if(frameCount%120==0)
    {
      ellipse(random(0,200),random(height-150,height),2,2);
      ellipse(random(0,200),random(height-150,height),2,2);
      ellipse(random(0,200),random(height-150,height),2,2);
    }
    
    //sidepanel
    stroke(color1);
    strokeWeight(4);
    fill(0);
    rect(sx,200,sx1,350,7);
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
         rect(sx,200,sx1,350,7);
         drawButton(100,100,bWidth,bHeight,7,"Graph",color1);
         drawButton(100,200,bWidth,bHeight,7,"Map",color1);
         drawButton(100,300,bWidth,bHeight,7,"Blah",color1);
       }
     }
     else
     {
       sx=-50;
       sx1=200;
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
    shape(s1, 0,0);
    shape(s2, 0,0);

}

/*ui draw
     strokeWeight(4);
     stroke(color1);
     line(width,(height/2)-50,width,(height/2)-50);
     line(width-150,(height/2)-50,width-150,(height/2)+100);
     line(width-150,(height/2)+100,width-350,(height/2)+250);
     line(width-350,(height/2)+250,300,(height/2)+250);
     line(width-350,(height/2)+250,width-350,height);
     line(300,(height/2)+250,300,(height/2)+height);
     line(300,(height/2)+250,150,(height/2)+100);
     line(150,(height/2)+100,0,(height/2)+100);
     */