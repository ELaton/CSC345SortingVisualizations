/*  @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 **  Class: CSC 345-Spring 2023
 **  Description: This program will compile and utilize all of our other classes together
 **  in order to create a final visualization of various sorting algorithms. We hope to be
 **  able to compare the efficiencies of more standard algorithms, like bubbleSort and
 **  selectionSort, against more unconventional ones, like heapSort and mergeSort, using
 **  an array class that keeps track of how many times it has been accessed. We also have
 **  a couple of hybrid sorting algorithms.
 **
 **  This visualization will not only give us a better understanding of how these algorithms
 **  work in an abstract sense, but it will also provide us with a reliable qualification
 **  about their pros and cons through coding practice, array accessing efficiency, and a
 **  naturally intuitive reframing of how we normally perceive computer science (namely, visual). 
 */

// Import Statements
import java.util.Random;

// Global Variable Declaration and Initialization
int numRectangles = 256; //Recommended Maximum: 256
int delay = 1;
int[] rectangleLengths = new int[numRectangles];
boolean recenterNotSkinny = (numRectangles <= 28);
boolean paused = false;
boolean sortingNow = false;
String currentSortingMethod;
Thread t;

// Global Class Declaration and Initialization
SortingAlgorithms sorts = new SortingAlgorithms();
RectangleGUI rectangle = new RectangleGUI();
SelectionScreen startup = new SelectionScreen();
ProjectArray proj = new ProjectArray(rectangleLengths);

/*
** The ProjectArray class behaves very similarly to a normal Java array.
 ** However, it also documents additional information about the number of
 ** times that the data within it has been accessed.
 ** It also allows an additional array to be stored within it, which can
 ** subsequently be used for reference within our other sorting algorithms.
 ** There are a couple of other methods too, which help us when it comes to
 ** modularizing our code and debugging in general.
 */
public class ProjectArray {

  // Class Attributes
  private int[] array;
  private int[] extra;
  private int accessCount;

  // Class Constructor
  public ProjectArray(int[] array) {
    this.array = array;
    this.extra = new int[array.length];
    this.accessCount = 0;
  }

  // Returns the Length of our Array
  public int length() {
    return array.length;
  }

  // Sets the Value in our Main Array at Index "i" to "val"
  public void set(int i, int val) {
    array[i] = val;
    accessCount++;
    pauseScreen();
  }

  // Sets the Value in our Extra Array at Index "i" to "val"
  public void setExtra(int i, int val) {
    extra[i] = val;
    accessCount++;
  }

  // Returns the Value in our Main Array at Index "i"
  public int get(int i) {
    accessCount++;
    return array[i];
  }

  // Returns the Value in our Extra Array at Index "i"
  public int getExtra(int i) {
    accessCount++;
    return extra[i];
  }

  // Swaps the Main Array's Values at Indices "i" and "j"
  public void swap(int i, int j) {
    int tmp = array[i];
    array[i] = array[j];
    array[j] = tmp;
    accessCount += 4;
    pauseScreen();
  }

  // Returns the Number of Array Accesses
  public int getAccessCount() {
    return accessCount;
  }

  // Determines if the Main Array is Sorted in Ascending Order
  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++)
      if (array[i] > array[i+1])
        return false;
    return true;
  }
}

/*
** The SortThread class allows us to manually determine which sorting
 ** method is going to be implemented, depending on the "sort" String
 ** that is passed to it. It also allows us to manually update
 ** the window to reflect any changes made within these algorithms as
 ** they occur.
 */
public class SortThread extends Thread {

  // Class Attribute that Determines Which Sort is Needed
  String sort;

  // Class Constructor
  public SortThread(String sort) {
    this.sort = sort;
  }

  // Determines the Needed Sort Method and Manually Updates the Window Accordingly
  public void run() {
    switch(sort) {
    case "Bubble Sort":
      sorts.bubbleSort(proj);
      break;
    case "Selection Sort":
      sorts.selectionSort(proj);
      break;
    case "Insertion Sort":
      sorts.insertionSort(proj);
      break;
    case "Shell Sort":
      sorts.shellSort(proj);
      break;
    case "Heap Sort":
      sorts.heapSort(proj);
      break;
    case "Radix Sort":
      sorts.radixSort(proj);
      break;
    case "Merge Sort":
      sorts.mergeSort(proj);
      break;
    case "Quick Sort":
      sorts.quickSort(proj);
      break;
    case "Tim Sort":
      sorts.timSort(proj);
      break;
    case "Lotz Sort":
      sorts.lotzSort(proj);
      break;
    case "BOzoO0oO0OoOoOoOo00ooO0o":
      sorts.bOzOsOrT(proj);
      break;
    }
  }
}

// Runs Upon Initial Startup to Set Up the Starting Screen
void setup() {
  size(1600, 900);
  startup.openSelectionScreen();
  rectangle.generateRectangleLengths();
}

// Continuously Loops to Reflect Any Graphical Changes Made to the Window
void draw() {

  // Draws the Rectangle Array as it Updates within the Sorting Methods
  if (sortingNow == true) {
    rectangle.drawRectangles();
    createTextBoxes();
    paused = false;
  }

  // Shows a Sorting Method Selection Screen Upon Startup
  else {
    startup.openSelectionScreen();
  }
}

// Creates Text Messsages on the Sorting Screen
void createTextBoxes() {

  // Displays Which Sorting Method is Being Used
  fill(0, 0, 0);
  textSize(64);
  text("Current Sorting Method: " + currentSortingMethod, 50, 100);

  // Displays the Current Access Count
  textSize(50);
  text("Access Count: ", 100, 175);
  fill(232, 47, 47);
  text(str(proj.getAccessCount()), 400, 175);
}

// Forces the Window to Pause and Manually Update (Instead of Automatically)
void pauseScreen() {
  paused = true;
  while (paused) {
    try {
      Thread.sleep(delay);
    }
    catch (Exception e) {
    };
  }
}
