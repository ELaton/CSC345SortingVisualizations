/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 ** Class: CSC 345-Spring 2023
 ** Description: This program will use all of our other programs to create
 ** a final visualization of various algorithms. We hope to have each
 ** sorting algorithm "race" against one another in order to compare runtime
 ** efficiencies, as well as demonstrate the differences between each algorithm
 ** in a more abstract sense.
 */

// Global Variable and Class Declaration and Initialization
int numRectangles = 50;
int ticSpeed = 10; 
int[] rectangleLengths = new int[numRectangles];
visualRepresentation randomizedRectangles = new visualRepresentation();
sortingAlgorithms sort = new sortingAlgorithms();

// Sets Up the Startup Window and Initial Program Properties
void setup() {
  size(1600, 900);
  background(200, 200, 200);
  randomizedRectangles.drawRectangles(numRectangles);
  frameRate(ticSpeed);

  // Used for Debugging Purposes
  sort.arrayToString(rectangleLengths);
  sort.debugSortingAlgorithms();
}
