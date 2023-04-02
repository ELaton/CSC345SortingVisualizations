/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 ** Class: CSC 345-Spring 2023
 ** Description: This file will create a class that stores all of our relevant sorting algorithms.
 ** This is where our program will actually access each sorting methods' algorithms and where it
 ** will be able to compare the efficiencies of said algorithms.
 */


class sortingAlgorithms {

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

  void arrayToString(int inputArray[]) {
    int numElements = inputArray.length;
    for (int index = 0; index < numElements; index++) {
      System.out.print(inputArray[index] + " ");
    }
    System.out.println();
  }
}

int arr[] = {12, 11, 13, 5, 6};
sortingAlgorithms sort = new sortingAlgorithms();
sort.selectionSort(arr);
sort.arrayToString(arr);

int arr2[] = {5, 4, 3, 2, 1};
sort.selectionSort(arr2);
sort.arrayToString(arr2);

int arr3[] = {1, 2, 3, 4, 5};
sort.selectionSort(arr3);
sort.arrayToString(arr3);

int arr4[] = {1, 1, 1, 1, 1};
sort.selectionSort(arr4);
sort.arrayToString(arr4);

int arr6[] = {12, 11, 13, 5, 6};
sort.bubbleSort(arr6);
sort.arrayToString(arr6);

int arr7[] = {5, 4, 3, 2, 1};
sort.bubbleSort(arr7);
sort.arrayToString(arr7);

int arr8[] = {1, 2, 3, 4, 5};
sort.bubbleSort(arr8);
sort.arrayToString(arr8);

int arr9[] = {1, 1, 1, 1, 1};
sort.bubbleSort(arr9);
sort.arrayToString(arr9);

int arr10[] = {12, 11, 13, 5, 6};
sort.insertionSort(arr10);
sort.arrayToString(arr10);

int arr11[] = {5, 4, 3, 2, 1};
sort.insertionSort(arr11);
sort.arrayToString(arr11);

int arr12[] = {1, 2, 3, 4, 5};
sort.insertionSort(arr12);
sort.arrayToString(arr12);

int arr13[] = {1, 1, 1, 1, 1};
sort.insertionSort(arr13);
sort.arrayToString(arr13);
