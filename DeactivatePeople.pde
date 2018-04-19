float angle = 0.0;
float idista = 35.0;
float dista = 25.0;
float phase = TWO_PI/3;
float sphereSize = 8.0;


float angx[] = new float[3];
float angy[] = new float[3]; 

void setup() {
  size(900, 900);
  background(0);
  colorMode(HSB);
  noCursor();
}

void draw() {
  
  noStroke();
  blendMode(MULTIPLY);
  fill(0, 6);
  rect(0,0,width,height);
  blendMode(SCREEN);

  strokeWeight(20);
  stroke((angle*50)%255, 255, 255);
  
  line(mouseX, mouseY, pmouseX, pmouseY);
  line(width-mouseX, mouseY, width-pmouseX, pmouseY);
  line(mouseX, height-mouseY, pmouseX, height-pmouseY);
  line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
  if(!mousePressed) {
    line(mouseY, mouseX, pmouseY, pmouseX);
    line(mouseY, width-mouseX, pmouseY, width-pmouseX);
    line(height-mouseY, mouseX, height-pmouseY, pmouseX);
    line(height-mouseY, width-mouseX, height-pmouseY, width-pmouseX);
  }
  
  
  angx[0] = dista*cos(angle);
  angx[1] = dista*cos(angle+phase);
  angx[2] = dista*cos(angle-phase);
  
  angy[0] = dista*sin(angle);
  angy[1] = dista*sin(angle+phase);
  angy[2] = dista*sin(angle-phase);

  drawSphere(mouseX, mouseY);
  drawSphere(width-mouseX, mouseY);
  drawSphere(mouseX, height-mouseY);
  drawSphere(width-mouseX, height-mouseY);
  if(!mousePressed) {
    drawSphere(mouseY, mouseX);
    drawSphere(mouseY,width-mouseX);
    drawSphere(height-mouseY, mouseX);
    drawSphere(height-mouseY, width-mouseX);
  }
  
  angle += 0.08;
  dista = idista + cos(angle)*10.0;
}

void drawSphere(int x, int y) {
    
  strokeWeight(4);
  
  stroke((angle*5+127)%255, 255, 255, 127);
  line(x,y,x+angx[0], y+angy[0]);
  line(x,y,x+angx[1], y+angy[1]);
  line(x,y,x+angx[2], y+angy[2]);
  
  stroke((angle*5+127)%255, 255, 255, 35);
  line(x+angx[0], y+angy[0], x+angx[1], y+angy[1]);
  line(x+angx[1], y+angy[1], x+angx[2], y+angy[2]);
  line(x+angx[2], y+angy[2], x+angx[0], y+angy[0]);
  
  
  noStroke();
  fill((angle*100+192)%255, 255, 255, 192);
  ellipse(x+angx[0], y+angy[0], sphereSize, sphereSize);
  ellipse(x+angx[1], y+angy[1], sphereSize, sphereSize);
  ellipse(x+angx[2], y+angy[2], sphereSize, sphereSize);

}
