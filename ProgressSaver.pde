int currentRectangle = 0;
int numRectangles = 50;
int ticSpeed = 50;
int[] rectangleLengths = new int[numRectangles];
boolean recenterNotSkinny = (numRectangles <= 28);

void setup() {
  size(1600, 900);
  frameRate(ticSpeed);
  generateRectangleLengths();
  drawRectangles();
}

void draw() {
  bubbleSort();
}

void swapArrayElements(int firstPos, int secondPos) {
  int tempElement = rectangleLengths[secondPos];
  rectangleLengths[secondPos] = rectangleLengths[firstPos];
  rectangleLengths[firstPos] = tempElement;
  drawRectangles();
}

void bubbleSort() {
  drawRectangles();
  if (currentRectangle >= 1) {
    if (rectangleLengths[currentRectangle] < rectangleLengths[currentRectangle - 1]) {
      swapArrayElements(currentRectangle, currentRectangle - 1);
    }
  }
  currentRectangle++;
  if (currentRectangle == numRectangles) {
    currentRectangle = 0;
  }
  // TODO: Create Exit Case Here
}

void insertionSort() {
  // TODO: Like Bubble Sort but Optimized (Doesn't Search Sorted Array)
  // Sorted Array is also at the Front instead of the End
}

void selectionSort() {
  // TODO: This as well
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
    fill(255, 255, 255);
    if (index == currentRectangle) {
      fill(0, 255, 0);
    }
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
    fill(255, 255, 255);
    if (index == currentRectangle) {
      fill(0, 255, 0);
    }
    rect(100 + rectWidth * index, yCoord, rectWidth, -rectangleLengths[currentPos]);
    currentPos++;
  }
}
