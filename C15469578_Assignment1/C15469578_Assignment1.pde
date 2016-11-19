//OOP ASSIGNMENT 1 
//C154695786 DANIEL VEGERA
//////////////////////////

Menu menu;
MainUI mainUI;
boolean launch=false;

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

  
 