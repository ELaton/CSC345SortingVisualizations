/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 ** Class: CSC 345-Spring 2023
 ** Description: This file will create a class that stores all of our relevant sorting algorithms.
 ** This is where our program will actually access each sorting methods' algorithms and where it
 ** will be able to compare the efficiencies of said algorithms.
 */

class sortingAlgorithms {

  // Implements the Algorithm for Bubble Sort
  void bubbleSort(int inputArray[]) {
    int numElements = inputArray.length;
    for (int firstPosition = 0; firstPosition < numElements - 1; firstPosition++) {
      for (int secondPosition = 0; secondPosition < numElements - firstPosition - 1; secondPosition++) {
        if (inputArray[secondPosition] > inputArray[secondPosition + 1]) {
          int originalElement = inputArray[secondPosition];
          inputArray[secondPosition] = inputArray[secondPosition + 1];
          inputArray[secondPosition + 1] = originalElement;
        }
      }
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
      int originalElement = inputArray[minimumPosition];
      inputArray[minimumPosition] = inputArray[unsortedPosition];
      inputArray[unsortedPosition] = originalElement;
    }
  }

  // Displays the Input Array to the Console for Debugging Purposes
  void arrayToString(int inputArray[]) {
    int numElements = inputArray.length;
    for (int index = 0; index < numElements; index++) {
      System.out.print(inputArray[index] + " ");
    }
    System.out.println();
  }

  // Used to Test Our Sorting Algorithms
  void debugSortingAlgorithms() {
    // Selection Sort Debugging
    int arr1[] = {12, 11, 13, 5, 6};
    selectionSort(arr1);
    arrayToString(arr1);
    int arr2[] = {5, 4, 3, 2, 1};
    selectionSort(arr2);
    arrayToString(arr2);
    int arr3[] = {1, 2, 3, 4, 5};
    selectionSort(arr3);
    sort.arrayToString(arr3);
    int arr4[] = {1, 1, 1, 1, 1};
    selectionSort(arr4);
    arrayToString(arr4);

    // Bubble Sort Debugging
    int arr5[] = {12, 11, 13, 5, 6};
    bubbleSort(arr5);
    arrayToString(arr5);
    int arr6[] = {5, 4, 3, 2, 1};
    bubbleSort(arr6);
    arrayToString(arr6);
    int arr7[] = {1, 2, 3, 4, 5};
    bubbleSort(arr7);
    arrayToString(arr7);
    int arr8[] = {1, 1, 1, 1, 1};
    bubbleSort(arr8);
    arrayToString(arr8);

    // Insertion Sort Debugging
    int arr9[] = {12, 11, 13, 5, 6};
    insertionSort(arr9);
    arrayToString(arr9);
    int arr10[] = {5, 4, 3, 2, 1};
    insertionSort(arr10);
    arrayToString(arr10);
    int arr11[] = {1, 2, 3, 4, 5};
    insertionSort(arr11);
    arrayToString(arr11);
    int arr12[] = {1, 1, 1, 1, 1};
    insertionSort(arr12);
    arrayToString(arr12);
  }
}
