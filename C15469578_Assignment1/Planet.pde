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
  
  
}

int i=0;
void drawPlanetInfo(float x, float y)
{
  //outer rect
  fill(0);
  strokeWeight(4);
  stroke(color1);
  rect(width/2,height/3,900,height/2);
  fill(color1);
  
  //text with planet info
  textSize(30);
  text("Info about nearby Planets",width/2,y);
  text("Planet Name: " + planets.get(i).name, width/2,y+75);
  text("Radius: " + planets.get(i).radius + " parsecs", width/2,y+100);
  text("Distance: " + planets.get(i).distance + " light years", width/2,y+125);
  text("Mass: " + planets.get(i).mass + " solar mass units", width/2,y+150);
  textSize(24);
  text("Description: " + planets.get(i).desc, width/2,y+175);
  
  //exit button
  fill(0);
  rect((width/2)+370,(height/3)-150,20,20);
  line((width/2)+360,(height/3)-160,(width/2)+380,(height/3)-140);
  line((width/2)+380,(height/3)-160,(width/2)+360,(height/3)-140);
  if(mousePressed)
  {
    if(mouseX>(width/2)+360 && mouseX<(width/2)+380 && mouseY>(height/3)-160 && mouseY<(height/3)-140)
    {
      mainUI.pInfo=false;  
    }
  }
  
  if(i>0)
  {
    triangle((width/2)-380,height/3,(width/2)-360,(height/3)-20,(width/2)-360,(height/3)+20);
    if(mousePressed || keyPressed)
    {
      if(mouseX>(width/2)-380 && mouseX<(width/2)-360 && mouseY>(height/3)-20 && mouseY<(height/3)+20 || key == CODED && keyCode ==LEFT)
      {
        i--;  
      }
    }
  }
  
  if(i<planets.size()-1)
  {
    triangle((width/2)+380,height/3,(width/2)+360,(height/3)-20,(width/2)+360,(height/3)+20);
    if(mousePressed || keyPressed)
    {
      if(mouseX>(width/2)+360 && mouseX<(width/2)+380 && mouseY>(height/3)-20 && mouseY<(height/3)+20 || key == CODED && keyCode ==RIGHT)
      {
        i++;  
      }
    }
  }
  
  
  
}


void drawBarchart(float x, float y, float bWidth)
  {
    float maxRadius=0;
    
    for(Planet planet:planets)
    {
      if(planet.radius>maxRadius)
      {
        maxRadius = planet.mass;
      } 
    }
    
    for(Planet planet:planets)
    {
      rectMode(BOTTOM);
      float bHeight = map(planet.mass, 0, maxRadius, 0,height/5);
      fill(color1);
      noStroke();
      rect(x,y,x+bWidth,y-bHeight);
      x+=bWidth+2;
      rectMode(CENTER); 
    }
}