
import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

Spaceship spaceship;
Enemies enemies;
int score = 0;
boolean motionControlled = false;
int previousRightState = 0, previousLeftState = 0;
float positionX = 0, scalingFactor = 3,displacementX = 0;


void setup(){
  
  //P3D rendering
  size(800,800, P3D);
  displacementX = width/4;
  enemies = new Enemies();
  spaceship = new Spaceship();
  background(0);
  
  try{
    kinect = new KinectPV2(this);
    //Enables depth and Body tracking (mask image)
    kinect.enableDepthMaskImg(true);
    kinect.enableSkeletonDepthMap(true);

    kinect.init();
  }catch(Exception e){
    e.printStackTrace();
  }

}

void draw(){
  
  background(0);
  
   //get the skeletons as an Arraylist of KSkeletons
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();
  
    //individual joints
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    //if the skeleton is being tracked compute the skleton joints
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      
      
      leftHandState(joints[KinectPV2.JointType_HandLeft].getX(),joints[KinectPV2.JointType_HandLeft].getState());
      rightHandState(joints[KinectPV2.JointType_HandRight].getState());
      
    }
  }
  if(motionControlled){
  spaceship.spaceshipPos(positionX);
  }else{
  spaceship.spaceshipPos(mouseX);
  }
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
  if(!motionControlled)
    spaceship.shoot();
 }
 
//Depending on the hand state change the color
void leftHandState(float kinectPosX,int handState){
  
  positionX = (kinectPosX*scalingFactor) - displacementX;
  
  if(previousLeftState == handState){
    previousLeftState = handState;
    
    switch(handState) {
      case KinectPV2.HandState_Open:
                                  // when the hands are opened
                                  break;
      case KinectPV2.HandState_Closed:
                                  // when the hands are closed
                                  if(frameCount%10 == 0 && motionControlled){
                                    spaceship.shoot();
                                  }
                                  break;
      case KinectPV2.HandState_Lasso:
                                  // when the back side of the hands are shown
                                  break;
      case KinectPV2.HandState_NotTracked:
                                  // when the hands are not tracked the motion controll will automatically stop
                                   motionControlled = false;
                                   break;
    }
  }
  else{
        previousLeftState = handState;
  }
}


//Depending on the  right hand state change the color
void rightHandState(int handState){
  
  if(previousRightState == handState){
    previousRightState = handState;
    
    switch(handState) {
      case KinectPV2.HandState_Open:
                                    // when the hands are opened
                                    fill(0, 255, 0);
                                    motionControlled = false;
                                    break;
      case KinectPV2.HandState_Closed:
                                    // when the hands are closed
                                    fill(255, 0, 0);
                                    motionControlled = true;
                                    break;
      case KinectPV2.HandState_Lasso:
                                    // when the back side of the hands are shown
                                    fill(0, 0, 255);
                                    break;
      case KinectPV2.HandState_NotTracked:
                                   // when the hands are not tracked the motion controll will automatically stop
                                   motionControlled = false;
                                   break;
      }
  }else{
      previousRightState = handState;
  }
}
