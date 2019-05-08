final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

int hogX,hogY;
int soilY;


PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage stone1, stone2;
PImage hog,hogD,hogL,hogR;
PImage life;

//movement
int moveRange=80;
final int stop=0; 
final int goRight=1;
final int goLeft=2;
final int goDown=3;
int movement=stop;


// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;
boolean down = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  hog = loadImage("img/groundhogIdle.png");
  life = loadImage("img/life.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  //hogMoving
  hogX=width/2;
  hogY=80;
}

void draw() {
  
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */



    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;}
        }else{image(startNormal, START_BUTTON_X, START_BUTTON_Y);}
        
      break;




		case GAME_RUN: // In-Game
 switch(movement){
    case stop:
    hog = loadImage("img/groundhogIdle.png");
    hogY+=0;
    break;
    
    case goDown:
    hog = loadImage("img/groundhogDown.png");
    if(soilY>=1600){
         hogY+=5;
         
         moveRange=80;
         if(hogY%moveRange==0){movement=stop;} 
    }else{
    soilY+=5;
    if(soilY%moveRange==0){movement=stop;} 
    }
         
       //if(groundHogY>=1600){  
       //if(groundHogY%moveRange==0){movement=stop;}}
        break;
    case goLeft:
          hogX-=5;
          hog = loadImage("img/groundhogLeft.png");
          if(hogX%moveRange==0){movement=stop;}
        break;
    case goRight:
          hogX+=5;
          hog = loadImage("img/groundhogRight.png");
          if(hogX%moveRange==0){movement=stop;}
        break;
    }
    
    println(soilY);

// Background
		image(bg, 0, 0);

// Sun
	  stroke(255,255,0);
	  strokeWeight(5);
	  fill(253,184,19);
	  ellipse(590,50,120,120);

//edge
    if(hogX<=0){
    hogX=0;}
      
    if(hogX>=width-80){
    hogX=width-80;}

       
       
// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
// soil0
    for(int y=160; y<480; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil0,x,y-soilY);}}
    
//soil1
    for(int y=480; y<800; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil1,x,y-soilY);}}
      
//soil2
    for(int y=800; y<1120; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil2,x,y-soilY);}}
      
//soil3
    for(int y=1120; y<1440; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil3,x,y-soilY);}}
      
//soil4
    for(int y=1440; y<1760; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil4,x,y-soilY);}}    

//soil5
    for(int y=1760; y<2080; y+=80){
      for(int x=0; x<=width; x+=80){
      image(soil5,x,y-soilY);}}     
      
// Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160-soilY - GRASS_HEIGHT, width, GRASS_HEIGHT);

//stone1
    for(int i=0; i<=720; i+=80){
    image(stone1,i,160 +i -soilY);}

//stone2   
       for(int  y=0; y<=560; y+=320)
       for(int x=80; x<=640; x+=320){
       
       for(int X=x; X<=x+80; X+=80)
       {
      image(stone1,X,800 +y -soilY);
      }}
      
      for(int  y=80; y<=560; y+=320)
      for(int x=-80; x<=640; x+=320){
       
      for(int X=x; X<=x+80; X+=80)
      for(int Y=y; Y<=y+80;Y+=80)
      {
      image(stone1,X,800 +Y -soilY);
      }}
   
       for(int  y=240; y<=560; y+=320)
       for(int x=80; x<=640; x+=320){
       
       for(int X=x; X<=x+80; X+=80)
       {
      image(stone1,X,800 +y -soilY);
      }}
      
//stone3
   for(int A=1120;A>=0;A-=240){
   
   for(int  x=A; x>=0; x-=240)
   for(int  y=0; y<=640; y+=80){
     x-=80;
     for(int X=x; X<=x+80; X+=80){
      image(stone1,X,1440 +y -soilY);
      }}}
      
   for(int A=1200;A>=0;A-=240){
   for(int  x=A; x>=0; x-=240)
   for(int  y=0; y<=640; y+=80){
     x-=80;
     image(stone2,x,1440 +y -soilY);
   }}
   
   
   

// Player
    
    image(hog,hogX,hogY);

    

// Health UI
    for(int i=10; i<70*playerHealth+10; i+=70){
    image(life,i,10);}
      
    break;

      
  		
  
  

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;

// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);}
		break;
		
	}

// DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
}
}

void keyPressed(){
 // Add your moving input code here
if(hogX%moveRange==0 && hogY%moveRange==0){
 switch(keyCode){
 case DOWN:

  if(hogY>=height){hogY=height-80;}
 if(hogY+moveRange<height){movement=goDown;}
 
 break;
 case RIGHT:
 if(hogX+moveRange<width){movement=goRight;}
 break;
 case LEFT:
 if(hogX>0){movement=goLeft;}
 break;
 }}

//if(key == CODED){
  //switch(keyCode){
 
  //case DOWN:
  //soilY+=80;
  //if(soilY>=1600){
  //soilY=1600;
  //groundHogY+=80;}
  //if(groundHogY>=height){groundHogY=height-80;}
  
  
  //break;
  
  //case LEFT:
  //groundHogX -= groundHogSpeed;
  //if (groundHogX<0){groundHogX=0;}
  //break;
  
  //case RIGHT:
  //groundHogX += groundHogSpeed;
  //if (groundHogX>560){groundHogX=560;}
  //break;
//}
//}
 // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0)playerHealth--;
     
     
      
      break;

      case 'd':
      if(playerHealth < 5)playerHealth++;
      break;
    }
}

void keyReleased(){
}
