class Enemy{
  
  PImage enemy;
  PVector position;
  int x=0,y=0;
  int strikes = 0;
  int size= 0;
 

  Enemy(int x ,int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
    position = new PVector(x *size,(y+2) *size);

    switch(int(random(0,3))){

      case 0 : enemy = loadImage("0.png");
               enemy.resize(size,size);
               strikes = 2;
               break;
  
      case 1 : enemy = loadImage("1.png");
               enemy.resize(size,size);
               strikes = 4;
               break;
  
      case 2 : enemy = loadImage("2.png");
               enemy.resize(size,size);
               strikes = 6;
               break;


       }
    }

  boolean isHitted(Bullet bullet){
    
      if(bullet.position.y <= position.y + size && bullet.position.y >= position.y){
        if(bullet.position.x <= position.x + size && bullet.position.x >= position.x){
          strikes -= 1;
          return true;
        }}
      return false;
  }
  
  boolean isAlive(){
    if(strikes >= 0){
    return true;
    }
    else{
    return false;
    }
  }
  
  void updatePos(){
  
    if(frameCount % 80 == 0){
      position.y += size/6;
    }

  }


  void display(){
    if(isAlive()){
      image(enemy,position.x,position.y);
  }}

}
