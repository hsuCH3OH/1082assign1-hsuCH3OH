PImage backgroundImg, groundhogImg, lifeImg, robotImg, soilImg,soldierImg;

int speedX;
int robotXAxis,robotYAxis;
int soldierXAxis,soldierYAxis;

int laserStartX, laserStartY, laserEndX, laserRange, laserReStartX;

void setup(){
  size(640, 480, P2D);
  backgroundImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  
  //soldier moving speed
  speedX = floor(random(4,8));
  
  // X,Y random axis for robot and soldier
  //robotXAxis = floor(random(160,561));
  robotYAxis = floor(random(2,6))*80;
  
  soldierXAxis = floor(random(640));
  soldierYAxis = floor(random(2,6))*80;
  
  //laserStartX = robotXAxis+25;
  laserStartX = floor(random(160,561));
  robotXAxis = laserStartX-25;
  laserStartY = robotYAxis+37;
  laserEndX = laserStartX-1;
  laserRange = 35;

  laserReStartX = laserStartX;

}


void draw(){
  //avoid robot and soldier are on the same aisle
  if (robotYAxis != soldierYAxis){
    
    //soldier moving
    soldierXAxis += speedX;
    //when soldier go over canvas, back to left side
    if (soldierXAxis > width) {soldierXAxis = -100;}
    
    //bg,grass,soil
    image(backgroundImg,0,0);
    image(soilImg,0,160);
    noStroke();
    fill(124, 204, 25);
    rect(0,145,640,15);
    
    //3 lives
    image(lifeImg,10,10);
    image(lifeImg,80,10);
    image(lifeImg,150,10);
  
    //sun
    fill(253, 184, 19);
    stroke(255, 255, 0);
    strokeWeight(5);
    ellipse(590,50,120,120);
    
    //laser
    if(laserStartY != robotYAxis+37){
      robotYAxis = floor(random(2,6))*80;
      laserStartY = robotYAxis+37;
    } //laser and robot are on the same Y-axis
    
    laserEndX -=2;
    strokeWeight(10);
    stroke(255,0,0);
    line(laserStartX, laserStartY, laserEndX, laserStartY);
    
    if (laserEndX <= robotXAxis-125){
      laserEndX = laserReStartX-1;
      laserStartX = laserReStartX;
    }
    
    if(laserStartX-laserEndX == laserRange){
      laserStartX-=2;
    } //Start moving left after End is go over the Range
    
  
    //characters
    image(groundhogImg,width/2-40,80);
    image(robotImg,robotXAxis,robotYAxis);
    image(soldierImg,soldierXAxis,soldierYAxis);
    
  }else{ 
    robotYAxis = floor(random(2,6))*80; //avoid robot and soldier are on the same aisle
    soldierYAxis = floor(random(2,6))*80;
    }
  
}
