int num = 3;
Bacteria[] dots;

void setup() {
  // Initialize bacteria variables here 
  size(800, 800);
  background(200, 200, 200);
  strokeWeight(2);
  blankScreen();
  
  dots = new Bacteria[num];
  for (int i = 0; i < num; i++) {
    dots[i] = new Bacteria();
  }
}

void draw() {
  // Move and show the bacteria   
  for (int i = 0; i < dots.length; i++) {
    dots[i].move();
    dots[i].show();
  }
}

void keyPressed() {
  // On key press, reset the screen and create a new set of bacteria
  blankScreen();
  num = (int)(Math.random() * 5) + 1;
  dots = new Bacteria[num]; // Reassign dots with new Bacteria array
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Bacteria();
    dots[i].move();
    dots[i].show();
  }
}

class Bacteria {     
  int myX, myY;
  
  Bacteria() {
    myX = 398;
    myY = 400;
  }

  void show() {
    fill((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    hexagon(myX, myY);
  }

  void move() {
    int direction = (int)(Math.random() * 4);
    if (direction == 0) {
      myX += 19;
      myY += 10;
    } else if (direction == 1) {
      myX -= 19;
      myY += 10;
    } else if (direction == 2) {
      myX += 19;
      myY -= 10;
    } else {
      myX -= 19;
      myY -= 10;
    }
  }
}

void hexagon(int xValue, int yValue) {
  beginShape();
  vertex(xValue - 6, yValue - 10);
  vertex(xValue + 6, yValue - 10);
  vertex(xValue + 12, yValue);
  vertex(xValue + 6, yValue + 10);
  vertex(xValue - 6, yValue + 10);
  vertex(xValue - 12, yValue);
  endShape(CLOSE);
}

void blankScreen() {
  fill(255, 255, 255);
  int count = 0;
  for (int y = 0; y < 900; y += 10) {
    if (count % 2 == 1) {
      for (int row1 = 0; row1 < 900; row1 += 38) {
        hexagon(row1, y);
      }
    } else {
      for (int row2 = 19; row2 < 900; row2 += 38) {
        hexagon(row2, y);
      }
    }
    count++;
  }
}
