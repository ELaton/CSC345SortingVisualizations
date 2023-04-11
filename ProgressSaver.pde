import java.util.Arrays;
import java.util.Random;

int currentRectangle = 0;
int numRectangles = 256;
int delay = 1;
int[] rectangleLengths = new int[numRectangles];
boolean recenterNotSkinny = (numRectangles <= 28);
boolean paused = false;


boolean sortingNow = false;



void setup() {
  size(1600, 900);
  openSelectionScreen();
  generateRectangleLengths();
}

void draw() {
  if (sortingNow == true) {
    drawRectangles();
    fill(0, 0, 0); 
    text("Access Count: ", 600, 150);
    text("0", 1000, 150);
    paused = false;
  } else {
    openSelectionScreen();
  }
}




void generateRectangleLengths() {
  int currentPos = 0;
  for (int index = 0; index < numRectangles; index++) {

    //Randomized
    int heightModifier = (int) random(1, 50);
    rectangleLengths[currentPos] = heightModifier * 10;

    // //Worst Case
    //rectangleLengths[currentPos] = (numRectangles - index);

    //// Best Case
    //rectangleLengths[currentPos] = index;
    currentPos++;
  }
}

void openSelectionScreen() {
  fill(255, 255, 255);
  rect(0, 0, 1600, 900);
  drawOptionButtons();
}

void drawOptionButtons() {
  textSize(50);
  fill(0, 0, 0);
  text("Click the Sorting Algorithm You Want", 420, 70);
  textSize(32);
  int currentButton = 0;
  for (int xCoord = 150; xCoord <= 1050; xCoord += 450) {
    for (int yCoord = 130; yCoord <= 530; yCoord += 200) {
      if (mouseX >= xCoord && mouseX <= xCoord + 300 && mouseY >= yCoord && mouseY <= yCoord + 150) {
        strokeWeight(5);
        stroke(0, 200, 200);

        switch (currentButton) {
        case 0:
          if (mousePressed) {
            sortingNow = true;
            print("Bubble");
          }
          break;
        case 1:
          if (mousePressed) {
            sortingNow = true;
            print("Shell");
          }
          break;
        case 2:
          if (mousePressed) {
            sortingNow = true;
            print("Merge");
          }
          break;
        case 3:
          if (mousePressed) {
            sortingNow = true;
            print("Selection");
          }
          break;
        case 4:
          if (mousePressed) {
            sortingNow = true;
            print("Heap");
          }
          break;
        case 5:
          if (mousePressed) {
            sortingNow = true;
            print("Quick");
          }
          break;
        case 6:
          if (mousePressed) {
            sortingNow = true;
            print("Insertion");
          }
          break;
        case 7:
          if (mousePressed) {
            sortingNow = true;
            print("Radix");
          }
          break;
        case 8:
          if (mousePressed) {
            sortingNow = true;
            print("Bozo");
          }
          break;
        }
      } else {
        noStroke();
      }
      fill(200, 200, 200);
      rect(xCoord, yCoord, 300, 150, 10);
      currentButton++;
    }
  }

  if (mouseX >= 375 && mouseX <= 675 && mouseY >= 720 && mouseY <= 870) {
    strokeWeight(5);
    stroke(0, 200, 200);
    if (mousePressed) {
      sortingNow = true;
      println("TimSort");
    }
  } else {
    noStroke();
  }
  fill(200, 200, 200);
  rect(375, 720, 300, 150, 10);
  fill(0, 0, 0);
  text("Timsort", 470, 715);


  if (mouseX >= 825 && mouseX <= 1125 && mouseY >= 720 && mouseY <= 870) {
    strokeWeight(5);
    stroke(0, 200, 200);
    if (mousePressed) {
      sortingNow = true;
      println("LotzSort");
    }
  } else {
    noStroke();
  }
  fill(200, 200, 200);
  rect(825, 720, 300, 150, 10);
  fill(0, 0, 0);
  text("Lotzsort", 915, 715);
  noStroke();
  currentButton = 0;
  while (currentButton < 11) {
    switch (currentButton) {
    case 0:
      text("Bubble", 250, 120);
      textSize(64);
      text("0", 280, 225);
      textSize(32);
      break;
    case 1:
      text("Selection", 690, 120);
      textSize(64);
      text("1", 735, 225);
      textSize(32);
      break;
    case 2:
      text("Insertion", 1140, 120);
      textSize(64);
      text("2", 1195, 225);
      textSize(32);
      break;
    case 3:
      text("Shell", 270, 320);
      textSize(64);
      text("3", 280, 425);
      textSize(32);
      break;
    case 4:
      text("Heap", 715, 320);
      textSize(64);
      text("4", 735, 425);
      textSize(32);
      break;
    case 5:
      text("Radix", 1160, 320);
      textSize(64);
      text("5", 1190, 425);
      textSize(32);
      break;
    case 6:
      text("Merge", 250, 520);
      textSize(64);
      text("6", 280, 625);
      textSize(32);
      break;
    case 7:
      text("Quick", 710, 520);
      textSize(64);
      text("7", 735, 625);
      textSize(32);
      break;
    case 8:
      text("Bozo", 1165, 520);
      textSize(64);
      text("?", 1190, 625);
      textSize(32);
      break;
    case 9:
      textSize(64);
      text("8", 507, 815);
      textSize(32);
      break;
    case 10:
      textSize(64);
      text("9", 962, 815);
      textSize(32);
      break;
    }
    currentButton++;
  }
}












void drawRectangles() {
  fill(0, 200, 200);
  strokeWeight(1); 
  stroke(0, 0, 0); 
  int yCoordinate = 750;
  if (recenterNotSkinny) {
    drawRecenteredRectangles(yCoordinate);
  } else {
    drawSkinnyRectangles(yCoordinate);
  }
}

private void drawRecenteredRectangles(int yCoord) {
  fill(0, 200, 200); 
  background(255, 255, 255);
  int currentPos = 0;
  int rectWidth = 50;
  int startingX = 750 - (25 * (numRectangles - 1));
  for (int index = 0; index < numRectangles; index++) {
    rect(startingX, yCoord, rectWidth, -rectangleLengths[currentPos]);
    currentPos++;
    startingX += 50;
  }
}

private void drawSkinnyRectangles(int yCoord) {
  background(255, 255, 255);
  int currentPos = 0;
  int rectWidth = 1400 / numRectangles;
  for (int index = 0; index < numRectangles; index++) {
    int offset = 50 - 1400 / numRectangles;
    rect(offset + 100 + rectWidth * index, yCoord, rectWidth, -rectangleLengths[currentPos]);
    currentPos++;
  }
}
