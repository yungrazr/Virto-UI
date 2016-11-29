class Planet
{
  float x,y;
  float bWidth;
  float bHeight;
  String name;
  float radius;
  float maxRadius;
  float distance;
  float maxDistance;
  float mass;
  float maxMass;
  String desc;
  
  Planet(TableRow row)
  {
    name = row.getString("Name");
    radius = row.getFloat("Radius");
    distance = row.getFloat("Dist");
    mass = row.getFloat("Mass");
    desc = row.getString("Desc");
  }
  
  String toString()
  {
    return name
      + ", " + radius
      + ", " + distance
      + ", " + mass
      + ", " + desc
      ;
  }
  
  
}//end class Planet

int i=0; //index used to navigate between the planets
int lastClicked=0; //used to time mouse clicks of arrow buttons

//method for drawing the planet info screen
void drawPlanetInfo(float y)
{
  //outer rect
  fill(0);
  strokeWeight(4);
  stroke(color1);
  rect(width/2,height/3,825,height/2);
  fill(color1);
  
  //text with planet info
  textSize(30);
  text("Info about nearby Planets",width/2,y);
  text("Planet Name: " + planets.get(i).name, width/2,y+75);
  text("Radius: " + planets.get(i).radius + " parsecs", width/2,y+100);
  text("Distance: " + planets.get(i).distance + " light years", width/2,y+125);
  text("Mass: " + planets.get(i).mass + " solar mass units", width/2,y+150);
  text("Description: " + planets.get(i).desc, width/2,y+175);
  textSize(30);
  
  //exit button
  stroke(color1);
  line((width/2)+360,(height/3)-160,(width/2)+380,(height/3)-140);
  line((width/2)+380,(height/3)-160,(width/2)+360,(height/3)-140);
  if(mousePressed)
  {
    if(mouseX>(width/2)+360 && mouseX<(width/2)+380 && mouseY>(height/3)-160 && mouseY<(height/3)-140)
    {
      mainUI.pInfo=false;  
    }
  }
  
  //error checking to make sure arrow key cannot be pressed
  //if it is at the first/last element in the arraylist
  if(i>0)
  {
    triangle((width/2)-380,height/3,(width/2)-360,(height/3)-20,(width/2)-360,(height/3)+20);
    if(mousePressed || keyPressed)
    {
      if(mouseX>(width/2)-380 && mouseX<(width/2)-360 && mouseY>(height/3)-20 && mouseY<(height/3)+20  
      && millis() - 200 > lastClicked || key == CODED && keyCode ==LEFT)
      {
        lastClicked = millis();
        i--;
      }
    }
  }
  if(i<planets.size()-1)
  {
    triangle((width/2)+380,height/3,(width/2)+360,(height/3)-20,(width/2)+360,(height/3)+20);
    if(mousePressed || keyPressed)
    {
      if(mouseX>(width/2)+360 && mouseX<(width/2)+380 && mouseY>(height/3)-20 && mouseY<(height/3)+20 
      && millis() - 200 > lastClicked || key == CODED && keyCode ==RIGHT)
      {
        lastClicked = millis();
        i++;  
      }
    }
  }
  
}//end drawPlanetInfo

//method for drawing barchart
void drawBarchart(float x, float y, float bWidth)
  {
    
    float maxRadius=0;
    float maxDistance=0;
    float maxMass=0;
    //outer rect
    fill(0);
    strokeWeight(4);
    stroke(color1);
    rect(width/2,height/3,825,height/2);
    fill(color1);
    text("Planet data barcharts",width/2,height/2-250);
    
    for(Planet planet:planets)
    {
      if(planet.distance>maxDistance)
      {
        maxDistance = planet.distance;
      } 
    }
    for(Planet planet:planets)
    {
      if(planet.mass>maxMass)
      {
        maxMass = planet.mass;
      } 
    }
    for(Planet planet:planets)
    {
      if(planet.radius>maxRadius)
      {
        maxRadius = planet.radius;
      } 
    }
    
    text("Radius",x+(bWidth*planets.size())/2, y+25);
    for(Planet planet:planets)
    {
      rectMode(BOTTOM);
      float bHeight = map(planet.radius, 0, maxRadius, 0,height/5);
      fill(color1);
      noStroke();
      rect(x,y,x+bWidth,y-bHeight);
      x+=bWidth+2;
      rectMode(CENTER); 
    }
    x+=80;
    
    text("Distance",x+(bWidth*planets.size())/2, y+25);
    for(Planet planet:planets)
    {
      rectMode(BOTTOM);
      float bHeight = map(planet.distance, 0, maxDistance, 0,height/5);
      fill(color1);
      noStroke();
      rect(x,y,x+bWidth,y-bHeight);
      x+=bWidth+2;
      rectMode(CENTER); 
    }
    x+=80;
    
    text("Mass",x+(bWidth*planets.size())/2, y+25);
    for(Planet planet:planets)
    {
      rectMode(BOTTOM);
      float bHeight = map(planet.mass, 0, maxMass, 0,height/5);
      fill(color1);
      noStroke();
      rect(x,y,x+bWidth,y-bHeight);
      x+=bWidth+2;
      rectMode(CENTER); 
    }
    
    //exit button
    stroke(color1);
    line((width/2)+360,(height/3)-160,(width/2)+380,(height/3)-140);
    line((width/2)+380,(height/3)-160,(width/2)+360,(height/3)-140);
    if(mousePressed)
    {
      if(mouseX>(width/2)+360 && mouseX<(width/2)+380 && mouseY>(height/3)-160 && mouseY<(height/3)-140)
      {
        mainUI.barchart=false;  
      }
    }
    
}