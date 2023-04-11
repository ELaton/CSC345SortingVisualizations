import java.util.Arrays;
import java.util.Random;

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

  public String toString() {
    return Arrays.toString(array);
  }

  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++)
      if (array[i] > array[i+1])
        return false;
    return true;
  }
}

Sorts sort = new Sorts();
RectangleVisualization rectangle = new RectangleVisualization();
int currentRectangle = 0;
int numRectangles = 128;
int delay = 1;
int[] rectangleLengths = new int[numRectangles];
ProjectArray proj = new ProjectArray(rectangleLengths);
boolean recenterNotSkinny = (numRectangles <= 28);
boolean paused = false;

Thread t = new Thread() {
  public void run() {
    //sort.bubbleSort(proj);
    //sort.selectionSort(proj);
    //sort.insertionSort(proj);
    //sort.radixSort(proj);
    //sort.heapSort(proj);
    //sort.mergeSort(proj);
    //sort.Shellsort(proj);
    //sort.Quicksort(proj);
    //sort.BOGOSort(proj);
    //sort.lotzSort(proj); 
    //sort.Timsort(proj); 
    print(proj.getAccessCount());
  }
};

void setup() {
  size(1600, 900);
  generateRectangleLengths();
  t.start();
}

void draw() {
  rectangle.drawRectangles();
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
    int heightModifier = (int) random(1, 50);
    rectangleLengths[currentPos] = heightModifier * 10;
    currentPos++;
    //// Debugging
    //rectangleLengths[currentPos] = (numRectangles - index) * 5;
    //currentPos++;
  }
}
