/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 **  Class: CSC 345-Spring 2023
 **  Description: This class can convert a global integer array called "rectangleLengths"
 **  into a graphical representation using a series of side-by-side rectangles. It accomplishes
 **  this by looping through "rectangleLengths" and drawing rectangles of varying lengths using
 **  the integer values within. Large integer values equate to taller rectangles and vice versa.
 **
 **  In order to properly account for all situations, the program has two cases: one wherein an
 **  added rectangle requires recentering of the entire structure and one in which adding another
 **  rectangle necessitates thinner widths for every rectangle, in order to remain on screen.
 */

class RectangleGUI {

  // Draws Teal Rectangles Outlined in Black at the Specified yCoordinate
  void drawRectangles() {
    fill(0, 200, 200);
    strokeWeight(1);
    stroke(0, 0, 0);
    int yCoordinate = 750;

    // Accounts for Recentering the Combined Rectangle Structure
    if (recenterNotSkinny) {
      drawRecenteredRectangles(yCoordinate);
    }

    // Accounts for Making All Rectangles Skinnier to Stay on Screen
    else {
      drawSkinnyRectangles(yCoordinate);
    }
  }

  // Private Helper Method to Recenter the Rectangle Array
  private void drawRecenteredRectangles(int yCoord) {
    background(255, 255, 255);
    int currentPos = 0;
    int rectWidth = 50;

    // This Value will Differ Based on the Number of Rectangles
    int startingX = 750 - (25 * (numRectangles - 1));

    // Looks Through the Integer Array and Draws Rectangles Accordingly
    for (int index = 0; index < numRectangles; index++) {
      rect(startingX, yCoord, rectWidth, -rectangleLengths[currentPos]);
      currentPos++;
      startingX += 50;
    }
  }

  // Private Helper Method to Adjust All Widths in the Rectangle Array
  private void drawSkinnyRectangles(int yCoord) {
    background(255, 255, 255);
    int currentPos = 0;

    // This Value will Differ Based on the Number of Rectangles
    int rectWidth = 1400 / numRectangles;

    // Looks Through the Integer Array and Draws Rectangles Accordingly
    for (int index = 0; index < numRectangles; index++) {
      int offset = 50 - 1400 / numRectangles;
      rect(offset + 100 + rectWidth * index, yCoord, rectWidth, -rectangleLengths[currentPos]);
      currentPos++;
    }
  }

  // Generates a Random Integer Array for the RectangleGUI Representation to Reference
  void generateRectangleLengths() {
    int currentPos = 0;

    // Creates an Integer Array with numRectangles Elements
    for (int index = 0; index < numRectangles; index++) {

      // Randomizes the Integer Array to Represent Randomized Rectangle Heights
      int heightModifier = (int) random(1, 50);
      rectangleLengths[currentPos] = heightModifier * 10;

      // Used for Debugging
      //rectangleLengths[currentPos] = (numRectangles - index);    // Creates the Worst-Case Scenario: A Reverse-Sorted Array
      //rectangleLengths[currentPos] = index;    // Creates the Best-Case Scenario: An Already-Sorted Array

      currentPos++;
    }
  }
}
