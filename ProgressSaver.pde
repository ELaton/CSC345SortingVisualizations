int currentRectangle = 0;
int numRectangles = 50;
int ticSpeed = 5;
int[] rectangleLengths = new int[numRectangles];
boolean recenterNotSkinny = (numRectangles <= 28);

boolean paused = false;

Thread t = new Thread() {
    public void run() {
       // bubbleSort(rectangleLengths); 
       //selectionSort(rectangleLengths); 
       insertionSort(rectangleLengths); 
    }
};

void setup() {
  size(1600, 900);
  frameRate(ticSpeed);
  generateRectangleLengths();
  
  t.start();
}

void draw() {
  drawRectangles();
  paused = false;
}

 // Implements the Algorithm for Bubble Sort
  void bubbleSort(int inputArray[]) {
    int numElements = inputArray.length;
    for (int firstPosition = 0; firstPosition < numElements - 1; firstPosition++) {
      for (int secondPosition = 0; secondPosition < numElements - firstPosition - 1; secondPosition++) {
        if (inputArray[secondPosition] > inputArray[secondPosition + 1]) {
            swapArrayElements(secondPosition, secondPosition + 1);
        }
      }
    }
  }

// Implements the Algorithm for Selection Sort
  void selectionSort(int inputArray[]) {
    int numElements = inputArray.length;
    for (int unsortedPosition = 0; unsortedPosition < numElements - 1; unsortedPosition++) {
      int minimumPosition = unsortedPosition;
      for (int comparedPosition = unsortedPosition + 1; comparedPosition < numElements; comparedPosition++) {
        if (inputArray[comparedPosition] < inputArray[minimumPosition]) {
          minimumPosition = comparedPosition;
        }
      }
      swapArrayElements(minimumPosition, unsortedPosition); 
    }
  }

  // Implements the Algorithm for Insertion Sort
  void insertionSort(int inputArray[]) {
    int numElements = inputArray.length;
    for (int originalPosition = 1; originalPosition < numElements; originalPosition++) {
      int originalElement = inputArray[originalPosition];
      int comparedPosition = originalPosition - 1;
      while (comparedPosition >= 0 && inputArray[comparedPosition] > originalElement) {
        inputArray[comparedPosition + 1] = inputArray[comparedPosition];
        comparedPosition--;
      }
      inputArray[comparedPosition + 1] = originalElement;
      pauseScreen(); 
    }
  }

void swapArrayElements(int firstPos, int secondPos) {
  int tempElement = rectangleLengths[secondPos];
  rectangleLengths[secondPos] = rectangleLengths[firstPos];
  rectangleLengths[firstPos] = tempElement;
  pauseScreen(); 
}

void pauseScreen() {
  paused = true;
  while (paused) {
       try {
         Thread.sleep(1);
       } catch (Exception e) {
       }; 
   }
}

void generateRectangleLengths() {
  int currentPos = 0;
  for (int index = 0; index < numRectangles; index++) {
    int heightModifier = (int) random(1, 50);
    rectangleLengths[currentPos] = heightModifier * 10;
    currentPos++;
    
    //// Debugging
    //rectangleLengths[currentPos] = (numRectangles - index + 2) * 10; 
    //currentPos++;  
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
