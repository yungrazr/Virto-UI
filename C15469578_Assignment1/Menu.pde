class Menu
{
  float bWidth = 150;
  float bHeight = 80;
  float x = width/3;
  float y = height/2;
  float x2 = (width/3)+(bWidth*1.2f);
  float y2 = height/2;
  
  public void drawMenu()
  {
     textSize(60);
     fill(70,247,201);
     text("VirtoUI 2.0.1",width/3,height/4);
    
     fill(0);
     stroke(70,247,201);
     rect(x,y,bWidth,bHeight,7);
     if(mouseX>x && mouseX <x+bWidth && mouseY>y && mouseY <y+bHeight)
     {
       fill(20);
       stroke(70,247,201);
       rect(x,y,bWidth,bHeight,7);
     }
     if(mousePressed)
     {
        if(mouseX>x && mouseX <x+bWidth && mouseY>y && mouseY <y+bHeight)
        {
          //move onto ui screen
        }
     }
     textSize(30);
     fill(70,247,201);
     text("Launch",x,y+bHeight/2);
     
     fill(0);
     stroke(70,247,201);
     rect(x2,y2,bWidth,bHeight,7);
     if(mouseX>x2 && mouseX <x2+bWidth && mouseY>y2 && mouseY <y2+bHeight)
     {
       fill(20);
       stroke(70,247,201);
       rect(x2,y2,bWidth,bHeight,7);
     }
     if(mousePressed)
     {
        if(mouseX>x2 && mouseX <x2+bWidth && mouseY>y2 && mouseY <y2+bHeight)
        {
         fill(20);
        }
     }
     textSize(30);
     fill(70,247,201);
     text("Exit",x2,y2+bHeight/2);

  }
    
}