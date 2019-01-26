import ddf.minim.*;

Minim minim = new Minim(this);

class Spaceship{
  
  int posX;
  PImage spaceship;
  int shipwidth = 70;
  int shipheight = 70;
  AudioSample groove;
  
  ArrayList<Bullet> bullets;  // list of bullets
  
  Spaceship(){
    posX = mouseX;
    groove = minim.loadSample("sound.wav");
    spaceship = loadImage("spaceship.png");
    spaceship.resize(shipwidth, shipheight);
    bullets = new ArrayList<Bullet>();
  }

  void shoot(){
    bullets.add(new Bullet(posX + (shipwidth/2)));
    this.groove.trigger();
  }

  void display(){
    
    if(mouseX > width){
      posX = width -  (shipwidth/2);
    }else if (mouseX < 0){
      posX =  (shipwidth/2);
    }  else{
      posX = mouseX - (shipwidth/2);
    }
    
   //display image of the ship
  image(spaceship,posX,height - shipheight);

  for(Bullet b: bullets){
    b.move();
    b.display();
  }
  
   // removing the bullets from arraylist which are outside of the frame
   for(int i= bullets.size()-1; i >= 0; i--){
    Bullet bullet = bullets.get(i);
    if(bullet.isalive == false){
      bullets.remove(i);
    }
  }

}

}
