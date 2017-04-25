
void setup() {
  size(1200, 900, P3D);

  camera(2100, -140, 300, width/2, height/12, 2, 0, 1, 0 );
}

int i=0;
void planet(float speed, float Distance, float size, float r) {
  pushMatrix();
  stroke(170);
  rotateY(frameCount*PI/speed * 0.41);
  translate(Distance, 0, 0);
  fill(r);
  sphere(size);
  popMatrix();
}

void draw() {
  background(1);
  lights();
  translate(width/2, height/4 );

  //Sun
  pushMatrix();
  stroke(211, 135, 28);
  rotateY(frameCount * PI/12 * 0.01);
  fill(237, 155, 48);
  sphere(60);
  stroke(255);
  noFill();
  popMatrix();

  //world
  
  stroke(110, 140, 310);
  rotateY(frameCount * PI/6 * 0.41);
  translate(220, 0, 10);
  fill(120, 180, 220);
  sphere(30);

  pushMatrix();
  stroke(140, 120, 220);
  rotateY(frameCount * PI/6 * 0.01);
  translate(120, 10, 0);
  fill(136, 180, 220);
  sphere(30);

  //Moon
  stroke(110, 100, 150);
  rotateY(frameCount * -PI/3 * 0.41);
  translate(30, 10, 10);
  fill(140, 300, 100);
  sphere(3);
  popMatrix();

}