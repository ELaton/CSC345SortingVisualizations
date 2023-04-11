import java.util.Arrays;
import java.util.Random;

SortingAlgorithms sorts = new SortingAlgorithms();
RectangleVisualization rectangle = new RectangleVisualization();
int currentRectangle = 0;
int numRectangles = 6; //Maximum: 256
int delay = 1;
int[] rectangleLengths = new int[numRectangles];
ProjectArray proj = new ProjectArray(rectangleLengths);
boolean recenterNotSkinny = (numRectangles <= 28);
boolean paused = false;
boolean sortingNow = false;
String currentSortingMethod; 
Thread t;

public class ProjectArray {
  private int[] array;
  private int[] extra;
  private int accessCount;
  public ProjectArray(int[] array) {
    this.array = array;
    this.extra = new int[array.length];
    this.accessCount = 0;
  }
  public int length() {
    return array.length;
  }
  public void set(int i, int val) {
    array[i] = val;
    accessCount++;
    pauseScreen();
  }
  public void setExtra(int i, int val) {
    extra[i] = val;
    accessCount++;
  }
  public int get(int i) {
    accessCount++;
    return array[i];
  }
  public int getExtra(int i) {
    accessCount++;
    return extra[i];
  }
  public void swap(int i, int j) {
    int tmp = array[i];
    array[i] = array[j];
    array[j] = tmp;
    accessCount += 4;
    pauseScreen();
  }
  public int getAccessCount() {
    return accessCount;
  }
  public void clearAccessCount() {
    accessCount = 0;
  }
  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++)
      if (array[i] > array[i+1])
        return false;
    return true;
  }
}

public class SortThread extends Thread {
  String sort;
  public SortThread(String sort) {
    this.sort = sort;
  }
  public void run() {
    switch(sort) {
    case "Bubble":
      sorts.bubbleSort(proj);
      break;
    case "Selection":
      sorts.selectionSort(proj);
      break;
    case "Insertion":
      sorts.insertionSort(proj);
      break;
    case "Shell":
      sorts.shellSort(proj);
      break;
    case "Heap":
      sorts.heapSort(proj);
      break;
    case "Radix":
      sorts.radixSort(proj);
      break;
    case "Merge":
      sorts.mergeSort(proj);
      break;
    case "Quick":
      sorts.quickSort(proj);
      break;
    case "Tim":
      sorts.timSort(proj);
      break;
    case "Lotz":
      sorts.lotzSort(proj);
      break;
    case "bOgO":
      sorts.bOgOsOrT(proj);
      break;
    }
  }
}

void setup() {
  size(1600, 900);
  openSelectionScreen();
  generateRectangleLengths();
}

void draw() {
  if (sortingNow == true) {
    rectangle.drawRectangles();
    fill(0, 0, 0);
    textSize(64); 
    text("Current Sorting Method: " + currentSortingMethod, 50, 100); 
    textSize(50); 
    text("Access Count: ", 100, 175);
    fill(232, 47, 47); 
    text(str(proj.getAccessCount()), 400, 175);
    paused = false;
  } else {
    openSelectionScreen();
  }
}

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
            currentSortingMethod = "Bubble"; 
            sortingNow = true;
            t = new SortThread("Bubble");
            t.start();
          }
          break;
        case 1:
          if (mousePressed) {
            currentSortingMethod = "Shell"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 2:
          if (mousePressed) {
            currentSortingMethod = "Merge"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 3:
          if (mousePressed) {
            currentSortingMethod = "Selection"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 4:
          if (mousePressed) {
            currentSortingMethod = "Heap"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 5:
          if (mousePressed) {
            currentSortingMethod = "Quick"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 6:
          if (mousePressed) {
            currentSortingMethod = "Insertion"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 7:
          if (mousePressed) {
            currentSortingMethod = "Radix"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
          }
          break;
        case 8:
          if (mousePressed) {
            currentSortingMethod = "Bozo"; 
            sortingNow = true;
            t = new SortThread(currentSortingMethod);
            t.start();
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
      currentSortingMethod = "Tim"; 
      t = new SortThread(currentSortingMethod);
      t.start();
    }
  } else {
    noStroke();
  }
  fill(200, 200, 200);
  rect(375, 720, 300, 150, 10);
  fill(0, 0, 0);
  text("Timsort", 470, 810);
  if (mouseX >= 825 && mouseX <= 1125 && mouseY >= 720 && mouseY <= 870) {
    strokeWeight(5);
    stroke(0, 200, 200);
    if (mousePressed) {
      sortingNow = true;
      currentSortingMethod = "Lotz"; 
      t = new SortThread(currentSortingMethod);
      t.start();
    }
  } else {
    noStroke();
  }
  fill(200, 200, 200);
  rect(825, 720, 300, 150, 10);
  fill(0, 0, 0);
  text("Lotzsort", 915, 810);
  noStroke();
  currentButton = 0;
  while (currentButton < 11) {
    switch (currentButton) {
    case 0:
      text("Bubble", 250, 215);
      break;
    case 1:
      text("Selection", 690, 215);
      break;
    case 2:
      text("Insertion", 1140, 215);
      break;
    case 3:
      text("Shell", 270, 415);
      break;
    case 4:
      text("Heap", 715, 415);
      break;
    case 5:
      text("Radix", 1160, 415);
      break;
    case 6:
      text("Merge", 250, 615);
      break;
    case 7:
      text("Quick", 710, 615);
      break;
    case 8:
      text("Bozo", 1165, 615);
      break;
    }
    currentButton++;
  }
}
