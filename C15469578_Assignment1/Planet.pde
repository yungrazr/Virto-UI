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

void drawPlanetInfo(float x, float y)
{
  fill(0);
  strokeWeight(4);
  stroke(color1);
  rect(width/2,height/3,800,height/2);
  fill(color1);
  text("Nearby Planet Info",width/2,y);
  
  text("Planet Name: " + planets.get(0).name, width/2,y+75);
  text("Radius: " + planets.get(0).radius + " parsecs", width/2,y+100);
  text("Distance: " + planets.get(0).distance + " light years", width/2,y+125);
  text("Mass: " + planets.get(0).mass + "solar mass units", width/2,y+150);
  text("Description: " + planets.get(0).desc, width/2,y+175);
  
  rect((width/2)+370,(height/3)-150,10,10);
  
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