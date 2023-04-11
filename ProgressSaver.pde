import java.util.Arrays;
import java.util.Random;

SortingAlgorithms sorts = new SortingAlgorithms();
RectangleVisualization rectangle = new RectangleVisualization();
int currentRectangle = 0;
int numRectangles = 256;
int delay = 1;
int[] rectangleLengths = new int[numRectangles];
ProjectArray proj = new ProjectArray(rectangleLengths);
boolean recenterNotSkinny = (numRectangles <= 28);
boolean paused = false;

boolean sortingNow = false;



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
    char sort;
    
    public SortThread(char sort) {
        this.sort = sort; 
    }
    
    public void run() {
        switch(sort) {
        case '0':
            sorts.bubbleSort(proj);
            break;
        case '1':
            sorts.selectionSort(proj);
            break;
        case '2':
            sorts.insertionSort(proj);
            break;
        case '3':
            sorts.shellSort(proj);
            break;  
        case '4':
            sorts.heapSort(proj);
            break;
        case '5':
            sorts.radixSort(proj);
            break;
        case '6':
            sorts.mergeSort(proj);
            break;
        case '7':
            sorts.quickSort(proj);
            break;         
        case '8':
            sorts.timSort(proj);
            break;  
        case '9':
            sorts.lotzSort(proj);
            break;
        case '?':
            sorts.bOgOsOrT(proj);
            break;
      
            
        }
    }
}

Thread t;
/*  public void run() {
    
    //sorts.bubbleSort(proj);
    //sorts.selectionSort(proj);
    //sorts.insertionSort(proj);
    //sorts.radixSort(proj);
    //sorts.heapSort(proj);
    //sorts.mergeSort(proj);
    //sorts.Shellsort(proj);
    //sorts.Quicksort(proj);
    //sorts.BOGOSort(proj);
    //sorts.lotzSort(proj);
    //sorts.Timsort(proj);
  }
};*/

void setup() {
  size(1600, 900);
}

void draw() {
  fill(200, 200, 200);
  rectangle.drawRectangles(); 
  
  if (sortingNow == false) {
  drawOptionButtons();
  }
  
  paused = false;
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

void keyPressed() {
 
    
  
  if (key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || 
      key == '5' || key == '6' || key == '7' || key == '8' || key == '9' ||
      key == '?') {
        sortingNow = true; 
    generateRectangleLengths();
    t = new SortThread(key);
  }
  t.start();
}





































void drawOptionButtons() {
  textSize(64);
  if (sortingNow == false) {
    fill(0, 0, 0);
    text("Press the Letter of the Sorting Algorithm You Want", 120, 80);
    textSize(32);
    for (int xCoord = 150; xCoord <= 1050; xCoord += 450) {
      for (int yCoord = 130; yCoord <= 530; yCoord += 200) {
        fill(200, 200, 200);
        rect(xCoord, yCoord, 300, 150, 10);
      }
    }
    fill(200, 200, 200);
    rect(375, 720, 300, 150, 10);
    fill(0, 0, 0);
    text("Timsort", 470, 715);
    fill(200, 200, 200);
    rect(825, 720, 300, 150, 10);
    fill(0, 0, 0);
    text("Lotzsort", 915, 715);
    int currentButton = 0;
    while (currentButton < 11) {
      switch (currentButton) {
      case 0:
        text("Bubble", 250, 125);
        textSize(64);
        text("0", 280, 225);
        textSize(32);
        break;
      case 1:
        text("Selection", 690, 125);
        textSize(64);
        text("1", 735, 225);
        textSize(32);
        break;
      case 2:
        text("Insertion", 1140, 125);
        textSize(64);
        text("2", 1195, 225);
        textSize(32);
        break;
      case 3:
        text("Shell", 270, 325);
        textSize(64);
        text("3", 280, 425);
        textSize(32);
        break;
      case 4:
        text("Heap", 715, 325);
        textSize(64);
        text("4", 735, 425);
        textSize(32);
        break;
      case 5:
        text("Radix", 1160, 325);
        textSize(64);
        text("5", 1190, 425);
        textSize(32);
        break;
      case 6:
        text("Merge", 250, 525);
        textSize(64);
        text("6", 280, 625);
        textSize(32);
        break;
      case 7:
        text("Quick", 710, 525);
        textSize(64);
        text("7", 735, 625);
        textSize(32);
        break;
      case 8:
        text("Bozo", 1165, 525);
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
    noStroke();
  } else {
    stroke(0, 0, 0);
    fill(0, 0, 0);
    text("Access Count: ", 600, 150);
    fill(0, 200, 200);
    text(str(proj.getAccessCount()), 1000, 150);
    rectangle.drawRectangles(); 
  }
}
