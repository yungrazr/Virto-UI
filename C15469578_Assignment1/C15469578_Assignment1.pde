//OOP ASSIGNMENT 1 
//C15469578 DANIEL VEGERA
//////////////////////////

Menu menu;
MainUI mainUI;
Button b;
Planet p;

ArrayList<Planet> planets = new ArrayList<Planet>();
boolean launch = false;
color color1 = color(70,247,201); // this one is changed when hyperdrive mode enables
color color2 = color(70,247,201);
PFont font;
PImage cursor;
PImage bg;
float theta = 0;
PShape s,s1,s2;
Table data;

//////////////////////////

void setup()
{
  //fullScreen();
  frameRate(60);
  size(1280,720);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  menu = new Menu();
  mainUI = new MainUI();
  noCursor();
  cursor = loadImage("cur.png");
  bg = loadImage("pic.jpg");
  setUIshape();
  loadData();
  int total = planets.size();
  println("Total planets: " + total);
  //listData();
  
}//end Setup

void draw()
{
  background(0);
  if(launch==false)
  {
    menu.drawMenu();
  }
  else if(launch)
  {
    mainUI.drawMainUI();
  }
  Cursor();
  //println("FPS: " + frameRate);
}//end Draw

//////////////////////////
//METHODS

void Cursor()
{
    pushMatrix();
    theta= theta - 0.02f;
    float c2 = theta;
    translate(mouseX,mouseY);
    rotate(c2);
    stroke(color2);
    strokeWeight(1);
    noFill();
    rect(0,0,10,10);   
    popMatrix();
    image(cursor, mouseX, mouseY);
}

void loadData()
{
  Table data = loadTable("pdata.csv", "header");
  for(TableRow row:data.rows())
  {
    Planet planet = new Planet(row);
    planets.add(planet);
  }
}