class Enemies{

    ArrayList<Enemy> enemies;
    int rows = 3;
    int size = 50;
    int columns = int(width/size);

    Enemies(){
      enemies = new ArrayList<Enemy>();
      for(int i = 0; i<rows; i++){
       for(int j = 0; j<columns; j++){
         enemies.add(new Enemy(j,i,size));
       }
      }
    }
    
    void calculate(ArrayList<Bullet> bullets){

     for(int i = enemies.size() - 1;i >= 0; i--){
        Enemy enemy = enemies.get(i);
        
        for(int j = bullets.size() - 1; j >= 0; j--){
           Bullet bullet = bullets.get(j);
           if(enemy.isHitted(bullet)){
             bullets.remove(j);
           if(enemy.isAlive() == false){
              score += 1;
              enemies.remove(i);
            }
          }
         }
         
         enemy.updatePos();
      }
    }
    
    
    void display(){
      if(enemies.size() == 0){
          textSize(40);
          fill(255,255,0);
          text("YOU WIN",width/2-100,height/2 - 20);
          noLoop();
      }
      else{
        for(int i = enemies.size() -1;i >= 0; i--){
          Enemy enemy = enemies.get(i);
          enemy.display();
          if(enemy.position.y >= height - (2.5*size)){
            textSize(40);
            fill(255,255,0);
            text("GAME OVER",width/2-100,height/2 - 20);
            noLoop();
        }
       }
     }
    }
}
