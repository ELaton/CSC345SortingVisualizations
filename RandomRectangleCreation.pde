/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 ** Class: CSC 345-Spring 2023
 ** Description: This program will create our initial setup for sorting. It
 ** accomplishes this through a visual representation of differently-sized
 ** rectangles.
 */

class visualRepresentation {
  
  // Global Variable Declaration and Initialization
  int yCoordinate = 700; 
  int currentPosition = 0; 
  
  // Draws the Randomized Rectangles According to Input Number of Rectangles
  void drawInitialRectangles(int numRects) {


    // Adds Up to 28 Rectangles and Recenters Them Accordingly
    if (numRects <= 28) {
      int rectWidth = 50;
      int startingX = 750 - (25 * (numRects - 1));
      for (int i = numRects; i > 0; i--) {

        // Randomizes the Rectangle Lengths
        int heightModifier = (int) random(1, 50);
        rect(startingX, yCoordinate, rectWidth, -heightModifier * 10);
        rectangleLengths[currentPosition] = heightModifier * 10;
        currentPosition++;
        startingX += 50;
      }
    }

    // Adds More than 28 Rectangles by Making Them Skinnier
    else {
      int rectWidth = 1400 / numRects;
      for (int i = 0; i < numRects; i++) {

        // Randomizes the Rectangle Lengths
        int heightModifier = (int) random(1, numRects);
        rect(100 + rectWidth * i, yCoordinate, rectWidth, -heightModifier * 10);
        rectangleLengths[currentPosition] = heightModifier * 10;
        currentPosition++;
      }
    }
  }
  
  // Updates the Rectangles Based on Any Changes to the Array
  void drawUpdatedRectangles(int[] rectLengths, int currentRect) {
    background(200, 200, 200); 
    int numRects = rectLengths.length; 
    
    // Redraws the Board for Arrays of Size 28 or Less
    if (numRects <= 28) {
      int rectWidth = 50; 
      int startingX = 750 - (25 * (numRects - 1));
      for (int i = numRects - 1; i >= 0; i--) {
        fill(255, 255, 255); 
        
        // Highlights the Current Rectangle in Green
        if (currentRect == i) {
          fill(0, 255, 0); 
        }
        rect(startingX, yCoordinate, rectWidth, -rectLengths[numRects - i - 1]); 
        currentPosition++; 
        startingX += 50; 
        
      }
    }
  }
}
