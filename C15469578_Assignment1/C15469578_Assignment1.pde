//OOP ASSIGNMENT 1 
//C15469578 DANIEL VEGERA
//////////////////////////

Menu menu;
MainUI mainUI;
boolean launch=false;
color color1 = color(70,247,201);
PFont font;

//////////////////////////

void setup()
{
  size(1280,720);
  rectMode(CENTER);
  menu = new Menu();
  mainUI = new MainUI();
  
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
  
  
}//end Draw

//////////////////////////
//METHODS

  
 