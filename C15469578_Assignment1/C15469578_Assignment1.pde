import ddf.minim.*;

//OOP ASSIGNMENT 1 
//C15469578 DANIEL VEGERA
//////////////////////////

Menu menu;
MainUI mainUI;
Button b;
Planet p;
Minim minim;
AudioPlayer song;

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
  smooth(4);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  menu = new Menu();
  mainUI = new MainUI();
  minim = new Minim(this);
  noCursor();
  cursor = loadImage("cur.png");
  bg = loadImage("pic.jpg");
  font = loadFont("EarthOrbiter-60.vlw");
  song = minim.loadFile("starmoods.mp3");
  song.play();
  setUIshape();
  loadData();
  //int total = planets.size();
  //println("Total planets: " + total);
  
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
    smooth(4);
    mainUI.drawMainUI();
    strokeWeight(2);
    line(350,height-15,350,height-60);
    line(song.bufferSize() - 150,height-15,song.bufferSize() - 150,height-60);
    for(int i = 350; i < song.bufferSize() - 150; i++)
    {
      line(i, height-20 + song.left.get(i)*50, i+1, height-20 + song.left.get(i+1)*50);
      line(i, height-45 + song.right.get(i)*50, i+1, height-45 + song.right.get(i+1)*50);
    }
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