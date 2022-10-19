Chemotaxis [] a = new Chemotaxis [50];
color Color1 = color ((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));

void setup(){
  size(500, 500);
  for(int i = 0; i < a.length; i = i +  1)
    a[i] = new Chemotaxis();
  textAlign(CENTER);
  background(Color1);
}
 
void mouseMoved(){
  Color1 = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  background(Color1);
  redraw();
}

class Chemotaxis{
  int x1, y1;
  int x2, y2;
  int size;
  color Color2;
  int a;
  int num;

  Chemotaxis(){
    x1 = 250;
    y1 = 250;
    size = 30;
    num = 0;
  }
 
  void Walk(){
    //Converging circles around mouse
    fill(Color1, 200);
    strokeWeight(5);
    stroke(220,50);
    for(int i = 0; i < 3; i = i + 1)
      size = size + 5*i;
    ellipse(mouseX, mouseY, size, size);
    stroke(Color1, 200);
    ellipse(pmouseX, pmouseY, size, size);
    if(size > 50)
      size = 10;
    noStroke();
    if(mouseX == 0 && mouseY ==0)
      ellipse(mouseX, mouseY, size, size);
    
    //Molecules
    Color2 = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    fill(Color2);
    stroke(0);
    strokeWeight(1);
    x2 = x1 + (int)(Math.random()*40 - 20);
    y2 = y1 + (int)(Math.random()*40 - 20);
    line(x1, y1, x2, y2);
    ellipse(x1, y1, 10, 10);
    x1 = x2;
    y1 = y2;
   
    fill(255,0,0);
    textSize(20);
    text("Try moving your mouse?", 250, 40);
  }
}

void draw(){
  for(int k = 0; k < a.length; k = k + 1)
    a[k].Walk();
}
