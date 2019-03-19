class Bullet{
  
  PVector position;
  PVector speed;
  color c;
  boolean isalive = true;

  
  Bullet(float x){
    position = new PVector(x,height - 70);
    speed = new PVector(0,3);
    c = color(255,255,0);
  }


  void move(){
    position.y -= speed.y;
    if(position.y < 50){
      isalive = false;
     }
   }


  void display(){
  if(isalive){
    fill(c);
    rectMode(CENTER);
    rect(position.x,position.y,5,12);
  }}
}
