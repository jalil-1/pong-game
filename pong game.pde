int screenWidth = 1366; //set to your maxX
int screenHeight = 768; //set to your maxY
int ballX = 683;  // ball x cordinate
int ballY = 384;  //ball y cordinate
int ballWidth=30;  // ball width
int ballHeight=30;   // ball height
int text1 = 40;      // size of scores text

int rightPadleX=screenWidth-40;
int rightPadleWidth=-50;
int rightPadleHeight=-90;
int rightPadleY = screenHeight/2;
int padleS = 5;

int leftPadleX=40;
int leftPadleWidth=50;
int leftPadleY=screenHeight/2;
int leftPadleHeight=90;


int player1X =500;
int player1Y = 384; 
int player2X = 800;
int player2Y = 384;
int xSpeed= 5;
int ySpeed = 6;
int radius = 15;
int leftPlayerScore = 0 ;
int  rightPlayerScore = 0;
 boolean gameOn = false; //variable that sets game off when not clicked
 boolean upL,downL;   // variable initialization for keys to move left padle up and down
 boolean upR,downR;     // variable initialization for keys to move right padle up and down
 boolean hasOverlappedLeftPaddle=false;
 boolean hasOverlappedRightPaddle=false;
 void setup() //runs once
{
fullScreen(); //Sets the program to run in full screen mode

}

void draw() //runs forever
{
fill(220);
background(0);
movePadle();
displayScore();
displayBall();
displayPadle();
moveBall();
checkWall();
gameMode();
checkLeftPadle();
 restrictPadle();
stroke(0,0,255);

  

  
 
}
//Checks if ball overlaps paddle
boolean doesOverlap(float leftPadleX, float leftPadleY, float leftPadleWidth, float leftPadleheight, float ballX, float ballY, float radius) {

  float ballLeftEdge = ballX-radius; //left edge of ball
  float ballBottomEdge = ballY+radius; //bottom edge of ball
  float ballRightEdge = ballX+radius; //right edge of ball
  float ballTopEdge = ballY-radius; //top edge of ball

  float paddleLeftEdge = leftPadleX ; //left edge of paddle
  float paddleBottomEdge = leftPadleY+leftPadleheight; //bottom edge of paddle
  float paddleRightEdge = leftPadleY+leftPadleWidth; //right edge of paddle
  float paddleTopEdge = leftPadleY; //top edge of paddle

  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
  {   
    return true;
  } else { 
    return false;
  } 

}



void displayScore(){
textSize(text1);
text(rightPlayerScore,player1X,player1Y); //right player

text(leftPlayerScore,player2X,player2Y);  //left player

 //changes the players score   by increasing each score by 1  
if((ballX <0) ){
ballX = 683;
ballY = 384;
leftPlayerScore=leftPlayerScore+1;  //increases left player score by 1
gameOn = false;  // sets game mode off
}
else if(ballX > screenWidth) {
ballX = 683;
ballY = 384;
 rightPlayerScore= rightPlayerScore+1;   //increases right player score by 1
 gameOn=false;   //sets game mode off
};


}
 
//function that displays ball
void displayBall(){
 //Draw ball
  fill(255,255,255);  //gives ball color
  ellipse(ballX,ballY ,ballWidth,ballHeight); //draw ball unto the screen
 
}

//function that displays padle
void displayPadle(){
//design of right padle display to move along y
fill(0,255,0);

rect(rightPadleX,rightPadleY,rightPadleWidth,rightPadleHeight);

//left paddle display to move along y
  
rect(leftPadleX,leftPadleY,leftPadleWidth,leftPadleHeight);
}

//function that controls ball movement
void moveBall(){
 //move ball to right and left when gameOn is set to true
if(gameOn){
 ballX= ballX - xSpeed;
ballY = ballY - ySpeed;
}
}

//function that checks top and bottom walls and bounces it back
void checkWall(){
  //bouces the ball when hits top and bottom
 if((ballY-radius)<0 || (ballY+ radius) > screenHeight){
ySpeed =ySpeed*-1; // reverses ball from top bottom
 
 }

}

//function that sets gamemode
void gameMode(){

 //checks tosee if mouse is clicked g sets game on when mouse is presses
 if(mousePressed){
  gameOn =true;
}

}
void checkLeftPadle(){
//Check if there is an overlap between ball and left paddle
  hasOverlappedLeftPaddle = doesOverlap(leftPadleX,leftPadleY,leftPadleWidth,leftPadleHeight, ballX, ballY, radius);

  if (hasOverlappedLeftPaddle) {
    background (0, 0, 255); //fill all shapes to blue  
    xSpeed = xSpeed * -1;  // bounces ball back
  }

};

void checkRightPadle(){
//Check if there is an overlap between ball and right paddle
  hasOverlappedRightPaddle = doesOverlap(rightPadleX,rightPadleY,rightPadleWidth,rightPadleHeight, ballX, ballY, radius); 

  if (hasOverlappedRightPaddle) {
   xSpeed = xSpeed * -1;  //bounces ball in x direction
  }


}


void  movePadle() {
   if(upL){
     
   leftPadleY=leftPadleY+padleS;
   }
  if(downL){
     
   leftPadleY=leftPadleY-padleS;
   }
    if(upR){
     
   rightPadleY=rightPadleY-padleS;
   }
 if(downR){
     
   rightPadleY=rightPadleY+padleS;
 }
   }
 void keyPressed(){
      if(key=='w'||key=='W'){
        upL =true;
      }
       if(key=='s'||key=='S'){
        downL =true;
      } 
 
  if(keyCode==UP){
        upR =true;
      }
      if(keyCode==DOWN){
        downR =true;
      }
 }
 void keyReleased(){
 if(key=='w'||key=='W'){
        upL =false;
      }
       if(key=='s'||key=='S'){
        downL =false;
      } 
       if(keyCode==UP){
        upR =false;
      }
      if(keyCode==DOWN){
        downR =false;
      }
     
 
 }
 
 // function that constrins padle movement
 void restrictPadle(){
  if(leftPadleY-leftPadleY/2 < 0){
  leftPadleY=leftPadleY+padleS;  //increases speed of left padle
  }
  if(leftPadleY > 700){
  leftPadleY=leftPadleY-padleS;  //increase padle speed down  and constrains it
  }
  
  if(rightPadleY-rightPadleHeight/2 < 90){
  rightPadleY=rightPadleY+padleS;  //increase right padle up and constrains it
  }
  
  if(rightPadleY+rightPadleHeight/2 > height){
  rightPadleY=rightPadleY-padleS;   //increases right padle down and constrains it
  }
 } 
      
 
 
  
