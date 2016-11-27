class Graph
{
  float bWidth;
  float bHeight;
  String name;
  Float radius;
  Float distance;
  Float mass;
  String desc;
  
  Graph(TableRow row)
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