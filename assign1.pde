PImage backgroundImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

int speedX;
int robotXAxis,robotYAxis;
int soldierXAxis,soldierYAxis;

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
  robotXAxis = floor(random(160,561));
  robotYAxis = floor(random(2,6))*80;
  
  soldierXAxis = floor(random(640));
  soldierYAxis = floor(random(2,6))*80;

}


void draw(){
  // have to avoid robot and soldier are on the same aisle
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
    circle(590,50,120);
    
    //laser
    strokeWeight(10);
    stroke(255,0,0);
    line(robotXAxis+25, robotYAxis+37, robotXAxis+25, robotYAxis+37);
    
    
    //characters
    image(groundhogImg,width/2-40,80);
    image(robotImg,robotXAxis,robotYAxis);
    image(soldierImg,soldierXAxis,soldierYAxis);
  }else{ robotYAxis = floor(random(2,6))*80;
  soldierYAxis = floor(random(2,6))*80;}
  
}
