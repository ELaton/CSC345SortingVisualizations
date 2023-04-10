int currentRectangle = 0;
int numRectangles = 50;
int ticSpeed = 10;
int[] rectangleLengths = new int[numRectangles];
boolean recenterNotSkinny = (numRectangles <= 28);
int index = 0;

void setup() {
  size(1600, 900);
  frameRate(ticSpeed);
  generateRectangleLengths();
  drawRectangles();
}

void draw() {
  //insertionSort();
  //bubbleSort();
  //selectionSort();
}

void bubbleSort() {
  drawRectangles();
  if (currentRectangle >= 1) {
    if (rectangleLengths[currentRectangle] < rectangleLengths[currentRectangle - 1]) {
      swapArrayElements(currentRectangle, currentRectangle - 1);
    }
  }
  currentRectangle++;
  if (currentRectangle == numRectangles && isSorted() == false) {
    currentRectangle = 0;
  } else if (currentRectangle == numRectangles && isSorted() == true) {
    noLoop();
  }
}

void insertionSort() {
  currentRectangle = index;
  while (currentRectangle > 0 && rectangleLengths[currentRectangle - 1] > rectangleLengths[currentRectangle]) {
    swapArrayElements(currentRectangle - 1, currentRectangle);
    currentRectangle--;
  }
  index++;
  if (index == numRectangles) {
    noLoop();
  }
}

void selectionSort() {
  int minIndex = index;
  for (currentRectangle = index + 1; currentRectangle < numRectangles; currentRectangle++) {
    if (rectangleLengths[currentRectangle] < rectangleLengths[minIndex]) {
      minIndex = currentRectangle;
    }
  }
  swapArrayElements(minIndex, index);
  index++;
  if (index == numRectangles) {
    noLoop();
  }
}

boolean isSorted() {
  for (int index = 0; index < numRectangles - 1; index++) {
    if (rectangleLengths[index] > rectangleLengths[index + 1]) {
      return false;
    }
  }
  return true;
}

void swapArrayElements(int firstPos, int secondPos) {
  int tempElement = rectangleLengths[secondPos];
  rectangleLengths[secondPos] = rectangleLengths[firstPos];
  rectangleLengths[firstPos] = tempElement;
  drawRectangles();
}

void generateRectangleLengths() {
  int currentPos = 0;
  for (int index = 0; index < numRectangles; index++) {
    int heightModifier = (int) random(1, 50);
    rectangleLengths[currentPos] = heightModifier * 10;
    currentPos++;
  }
}

void drawRectangles() {
  int yCoordinate = 700;
  if (recenterNotSkinny) {
    drawRecenteredRectangles(yCoordinate);
  } else {
    drawSkinnyRectangles(yCoordinate);
  }
}

private void drawRecenteredRectangles(int yCoord) {
  background(200, 200, 200);
  int currentPos = 0;
  int rectWidth = 50;
  int startingX = 750 - (25 * (numRectangles - 1));
  for (int index = 0; index < numRectangles; index++) {
    //fill(255, 255, 255);
    //if (index == currentRectangle) {
    //  fill(0, 255, 0);
    //}
    rect(startingX, yCoord, rectWidth, -rectangleLengths[currentPos]);
    currentPos++;
    startingX += 50;
  }
}

private void drawSkinnyRectangles(int yCoord) {
  background(200, 200, 200);
  int currentPos = 0;
  int rectWidth = 1400 / numRectangles;
  for (int index = 0; index < numRectangles; index++) {
    //fill(255, 255, 255);
    //if (index == currentRectangle) {
    //  fill(0, 255, 0);
    //}
    rect(100 + rectWidth * index, yCoord, rectWidth, -rectangleLengths[currentPos]);
    currentPos++;
  }
}
