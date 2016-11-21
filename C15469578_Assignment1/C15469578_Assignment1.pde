//OOP ASSIGNMENT 1 
//C15469578 DANIEL VEGERA
//////////////////////////

Menu menu;
MainUI mainUI;
Button b;
boolean launch=false;
color color1 = color(70,247,201);
PFont font;
PImage cursor;

//////////////////////////

void setup()
{
  size(1280,720);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  menu = new Menu();
  mainUI = new MainUI();
  noCursor();
  cursor = loadImage("cur.png");
  
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
  
  image(cursor, mouseX, mouseY);
}//end Draw

//////////////////////////
//METHODS

  
 