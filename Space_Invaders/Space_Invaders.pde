
Spaceship spaceship;
Enemies enemies;
int score = 0;

void setup(){
  //P3D rendering
  size(800,800, P3D);
  enemies = new Enemies();
  spaceship = new Spaceship();
  background(0);

}

void draw(){

  background(0);
  spaceship.display();
  enemies.calculate(spaceship.bullets);
  enemies.display();
  
  //displaying the score of the player
  fill(255);
  textSize(30);
  text("SCORE = "+score,width/2 - 80,80);
}

// event listener
void mousePressed(){
    spaceship.shoot();
 }
