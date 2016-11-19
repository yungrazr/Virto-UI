class Menu
{
  float bWidth = 160;
  float bHeight = 80;
  float x = width/2-bWidth/1.5;
  float y = height/2;
  float x2 = width/2+bWidth/1.5;
  float y2 = height/2;
  PFont font;
  color color1 = color(70,247,201);
  float theta2;
  float theta;
  
  public void drawMenu()
  {
    line(640,0,640,height);
    
    stroke(color1);
    strokeWeight(3);
    fill(0);
    ellipse(width/2,height/2,700,700);
    
    pushMatrix();
    theta2 = theta2 - 0.05f;
    float c2 = cos(theta2);
    translate(width/2, height/2);
    rotate(c2);
    noStroke();
    fill(0);
    rect(0,0,720,150);   
    popMatrix();
    
    stroke(color1);
    strokeWeight(2);
    fill(0);
    ellipse(width/2,height/2,650,650);
    
    pushMatrix();
    theta = theta + 0.01f;
    float c = cos(theta);
    translate(width/2, height/2);
    rotate(c);
    noStroke();
    fill(0);
    rect(0,0,670,150);   
    popMatrix();
      
     font = loadFont("EarthOrbiter-60.vlw");
     textFont(font, 60);
     fill(color1);
     text("VirtoUI 2.0.1",width/3,height/3);
    
     fill(0);
     stroke(color1);
     rect(x,y,bWidth,bHeight,7);
     if(mouseX>x-bWidth/2 && mouseX <x+bWidth/2 && mouseY>y-bHeight/2 && mouseY <y+bHeight/2)
     {
       fill(20);
       stroke(color1);
       rect(x,y,bWidth,bHeight,7);
     }
     if(mousePressed)
     {
        if(mouseX>x-bWidth/2 && mouseX <x+bWidth/2 && mouseY>y-bHeight/2 && mouseY <y+bHeight/2)
        {
          println("Program Launching!");
          //move onto ui screen
        }
     }
     textSize(30);
     fill(color1);
     text("Launch",x-65,y+10);
     
     fill(0);
     stroke(color1);
     rect(x2,y2,bWidth,bHeight,7);
     if(mouseX>x2-bWidth/2 && mouseX <x2+bWidth/2 && mouseY>y2-bHeight/2 && mouseY <y2+bHeight/2)
     {
       fill(20);
       stroke(color1);
       rect(x2,y2,bWidth,bHeight,7);
     }
     if(mousePressed)
     {
        if(mouseX>x2-bWidth/2 && mouseX <x2+bWidth/2 && mouseY>y2-bHeight/2 && mouseY <y2+bHeight/2)
        {
          println("Exiting!");
          
        }
     }
     textSize(30);
     fill(color1);
     text("Exit",x2-30,y2+10);

  }
    
}