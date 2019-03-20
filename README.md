# Space-Invader

### Problem Statement
 *To develop a game called space invader with motion sensing.*<br>[Link to the Video!!](https://www.youtube.com/watch?v=-VJ5w3DlcYw&t=49s)

### Description 
*The basic goal is to defeat the wave of aliens with a horizontally moving laser to earn as many points as possible. The aliens move horizontally downwards towards the spaceship which is fires bullets. If aliens reach the bottom of the screen, the player loses. The player must defeat the alien by shooting a bullet in order to win. There are different types of aliens, each having different threshold for bullets. Once the threshold is met, the alien is dead and the player gets a point. The player wins the game when all aliens are dead.I have built the game using Processing. Kinect PV2 is used to add motion to the game.* <br>[Link to Kinect PV2 Processing library](http://codigogenerativo.com/code/kinectpv2-k4w2-processing-library/)

#### Motion controls are as follows (requires Kinect V2 sensor):
 
     •Right hand closed : To start motion control
     •Right hand opened : To disable motion control
     •Left hand closed: To fire bullets 
     •Left hand opened : To control the x position of spaceship.
     
#### Simple Controls are as follows (requires mouse):    

     •Move the mouse to control the position of spaceship.
     •Right click or Left click to shoot bullets.
     
### Kinect V2
![alt text](https://github.com/sharmahr/Space-Invader/blob/master/Space_Invaders/read_me/kinect_v2.jpeg)

*The Kinect contains three vital pieces that work together to detect your motion and create your physical image on the screen: 
an RGB color VGA video camera, a depth sensor, and a multi-array microphone.The camera detects the red, green, and blue color components as well as body-type and facial features. It has a pixel resolution of 640x480 and a frame rate of 30 fps. This helps in facial recognition and body recognition. The depth sensor contains a monochrome CMOS sensor and infrared projector that help create the 3D imagery throughout the room. It also measures the distance of each point of the player's body by transmitting invisible near-infrared light and measuring its "time of flight" after it reflects off the objects. The microphone is actually an array of four microphones that can isolate the voices of the player from other background noises allowing players to use their voices as an added control feature.These components come together to detect and track 48 different points on each player's body and repeats 30 times every second.* <br>[To know more about Kinect click on this link!!](https://electronics.howstuffworks.com/microsoft-kinect.htm)

 ### Depth Map and skeleton information from the kinect:
 ![alt text](https://github.com/sharmahr/Space-Invader/blob/master/Space_Invaders/read_me/kinect_gif.gif)
 
 ### Different Hand States (Left And Right):
    //Left Hand
    void leftHandState(float kinectPosX,int handState){
        positionX = (kinectPosX*scalingFactor) - displacementX;
        if(previousLeftState == handState){
          previousLeftState = handState;
          switch(handState) {
            case KinectPV2.HandState_Closed:
                                       // when the hands are closed
                                      if(frameCount%10 == 0 && motionControlled)
                                        spaceship.shoot();
                                        break;
            case KinectPV2.HandState_NotTracked:
                                      motionControlled = false;
                                      break;
                            }
        }else{
        previousLeftState = handState;
        }
     }

    //Right hand
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
         case KinectPV2.HandState_NotTracked:
                                   // when the hands are not tracked the motion controll will automatically stop
                                   motionControlled = false;
                                   break;
            }
    }else
      previousRightState = handState;
    }
    
### Play Screen
 <img src="https://github.com/sharmahr/Space-Invader/blob/master/Space_Invaders/read_me/play_screen.png" alt="play_screen"
	title="Play Screen" width="300" height="300" />
  
### Win Screen
 <img src="https://github.com/sharmahr/Space-Invader/blob/master/Space_Invaders/read_me/win_screen.png" alt="win_screen"
	title="Win Screen" width="300" height="300" />

 ### Game Over
  <img src="https://github.com/sharmahr/Space-Invader/blob/master/Space_Invaders/read_me/game_over.png" alt="game_over"
	title="Game Over" width="300" height="300" />
 


 
 
 
