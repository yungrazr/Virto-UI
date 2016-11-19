//OOP ASSIGNMENT 1 
//C154695786 DANIEL VEGERA
//
//////////////////////////

Menu menu; 

void setup()
{
  size(1280,720);
  frameRate(60);
  menu = new Menu();
  
}//end Setup


void draw()
{
  background(0);
  menu.drawMenu();
  
  
}//end Draw

//////////////////////////
//METHODS

  
 