//Flappy Code
    bird b = new bird();
    pillar[] p = new pillar[3];
    boolean end=false;
    boolean intro=true;
    int score=0;
    void setup(){
      size(500,800);
      for(int i = 0;i<3;i++){
      p[i]=new pillar(i);
      }
    }
    void draw(){
      background(#0051A0);
      if(end){
      b.move();
      }
      b.drawBird();
      if(end){
      b.drag();
      }
      b.checkCollisions();
      for(int i = 0;i<3;i++){
      p[i].drawPillar();
      p[i].checkPosition();
      }
      fill(0);
      stroke(255);
      textSize(42);
      if(end){
      rect(20,20,100,50);
      fill(255);
      text(score,55,60);
      }else{
      rect(100,100,300,50);
      rect(100,200,300,50);
      fill(255);
      if(intro){
        text("Flappy Code",125,140);
        text("Click to Play",125,240);
      }else{
      text("SORRY  ",176,140);
      text("score",180,240);
      text(score,300,240);
      }
      }
    }
    class bird{
      float xPos,yPos,ySpeed;
    bird(){
    xPos = 250;
    yPos = 400;
    }
    void drawBird(){
      stroke(255);
      noFill();
      strokeWeight(2);
      ellipse(xPos,yPos,20,20);
    }
    void jump(){
     ySpeed=-10; 
    }
    void drag(){
     ySpeed+=0.4; 
    }
    void move(){
     yPos+=ySpeed; 
     for(int i = 0;i<3;i++){
      p[i].xPos-=3;
     }
    }
    void checkCollisions(){
     if(yPos>800){
      end=false;
     }
    for(int i = 0;i<3;i++){
    if((xPos<p[i].xPos+10&&xPos>p[i].xPos-10)&&(yPos<p[i].opening-100||yPos>p[i].opening+100)){
     end=false; 
    }
    }
    } 
    }
    class pillar{
      float xPos, opening;
      boolean cashed = false;
     pillar(int i){
      xPos = 100+(i*200);
      opening = random(600)+100;
     }
     void drawPillar(){
       line(xPos,0,xPos,opening-100);  
       line(xPos,opening+100,xPos,800);
     }
     void checkPosition(){
      if(xPos<0){
       xPos+=(200*3);
       opening = random(600)+100;
       cashed=false;
      } 
      if(xPos<250&&cashed==false){
       cashed=true;
       score++; 
      }
     }

    }
    void reset(){
     end=true;
     score=0;
     b.yPos=400;
     for(int i = 0;i<3;i++){
      p[i].xPos+=550;
      p[i].cashed = false;
     }
    }
    void mousePressed(){
     b.jump();
     intro=false;
     if(end==false){
       reset();
     }
    }
    void keyPressed(){
     b.jump(); 
     intro=false;
     if(end==false){
       reset();
     }
    }