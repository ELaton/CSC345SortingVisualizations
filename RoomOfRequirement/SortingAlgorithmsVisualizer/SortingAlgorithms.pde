/**
 * The class SortingAlgorithms contains all the sorting algorithms used in the project
 * as well as any helper methods that they require.
 */

class SortingAlgorithms {

  /**
   * radixSort lexicographically sorts the integer array from least
   * significant to most significant bit. For each bit, each element
   * is placed into the 0s or 1s bucket, until the most significant
   * bit is reached, at which the elements will be sorted.
   * @param a the array to be sorted
   */
  void radixSort(ProjectArray a) {
    int size = a.length();

    // get the maximum element so we know how many bits to iterate through
    int max = a.get(0);
    int tmp = max;
    for (int i = 1; i < size; i++) {
      tmp = a.get(i);
      if (tmp > max)
        max = tmp;
    }

    // compare bits while max element still has bits
    for (int i = 1; max / i > 0; i *= 2) {
      int ones  = size;
      int zeros = 0;

      // count how many elements with current bit 0
      for (int j = 0; j < size; j++) {
        if ((a.get(j) / i) % 2 == 0)
          zeros++;
      }

      // copy elements with current bit 0 and 1 separately into tmp array preserving order
      for (int j = size - 1; j >= 0; j--) {
        tmp = a.get(j);
        if ((tmp / i) % 2 == 0)
          a.setExtra(--zeros, tmp);
        else
          a.setExtra(--ones, tmp);
      }

      // copy values from tmp array back into array
      for (int j = 0; j < size; j++)
        a.set(j, a.getExtra(j));
    }
  }

  /**
   * mergeSort divides the array into smaller and smaller subarrays, then
   * combines sorted subarrays together to obtain the sorted original array.
   * @param array the array to be sorted
   */
  void mergeSort(ProjectArray array) {
    mergeSortRecur(array, 0, array.length() - 1);
  }

  /**
   * mergeSortRecur recursively divides the array into subarrays until the
   * the subarrays are of size 1. The subarrays are then merged together.
   * All bounds are inclusive.
   * @param a the array to be sorted
   * @param lower the lower bound of the subarray
   * @param upper the upper bound of the subarray
   */
  void mergeSortRecur(ProjectArray a, int lower, int upper) {
    if (upper - lower < 1)
      return;
    int mid = (lower + upper) / 2;
    mergeSortRecur(a, lower, mid);
    mergeSortRecur(a, mid + 1, upper);
    merge(a, lower, mid, mid + 1, upper);
  }

  /**
   * merge combines sorted subarrays into a single sorted subarray.
   * All bounds are inclusive.
   * @param a the array to be sorted
   * @param lower the lower bound of the first subarray
   * @param mid1 the upper bound of the first subarray
   * @param mid2 the lower bound of the second subarray
   * @param upper the upper bound of the second subarray
   */
  void merge(ProjectArray a, int lower, int mid1, int mid2, int upper) {
    int bottom   = lower;
    int tmpIndex = lower;

    // loop while lower or upper array still has elements
    while ((lower <= mid1 || mid2 <= upper) && tmpIndex <= upper) {
      if (lower > mid1) // lower array is fully copied, so copy rest of upper array
        a.setExtra(tmpIndex++, a.get(mid2++));
      else if (mid2 > upper) // upper array is fully copied, so copy rest of lower array
        a.setExtra(tmpIndex++, a.get(lower++));
      else if (a.get(lower) <= a.get(mid2)) // copy the smaller element among the two arrays
        a.setExtra(tmpIndex++, a.get(lower++));
      else
        a.setExtra(tmpIndex++, a.get(mid2++));
    }

    // copy values from tmp array back into array
    for (int i = bottom; i <= upper; i++)
      a.set(i, a.getExtra(i));
  }

  /**
   * Shellsort sorts the array using shell sort
   * the first h value follows the recurrence relation h = 3h + 1, and it is
   * the last value such that h < N/3
   * @param array the array to be sorted
   */
  void shellSort(ProjectArray array) {
    int h = 1;
    while (h < array.length()/3)
      h = 3*h + 1;
    shellSortRecur(array, (h-1)/3);
  }

  /**
   * shellSortRecur recursively calls Shellsort with decreasing h values until
   * h = 1
   * @param array the array to be sorted
   * @param h the size of the "shells" to sort
   */
  void shellSortRecur(ProjectArray array, int h) {
    for (int i = 0; i < h; i++) {
      int start = i;
      while (start + h < array.length()) {
        int compares = start;
        while (compares >= 0 && array.get(compares) > array.get(compares+h)) {
          array.swap(compares, compares + h);
          compares -= h;
        }
        start += h;
      }
    }
    if (h == 1)
      return;
    shellSortRecur(array, (h-1)/3);
  }

  /**
   * quickSort sorts the array using Quicksort
   * the pivot values is always the first value in the array
   * @param array the array to be sorted
   */
  void quickSort(ProjectArray array) {
    quickSortRecur(array, 0, array.length() - 1);
  }

  /**
   * quickSortRecur recursively divides the array at its selected pivot, until
   * the array is sorted
   * @param array the array to be sorted
   * @param start the index of the pivot
   * @param end the last index to compare to the pivot
   */
  void quickSortRecur(ProjectArray array, int start, int end) {
    if (start >= end || start < 0 || end >= array.length())
      return;
    int pivot = start;
    int pivotVal = array.get(pivot);
    int startShift = pivot + 1;
    for (int i = startShift; i <= end; i++) {
      if (array.get(i) < pivotVal) {
        array.swap(startShift, i);
        array.swap(startShift, pivot);
        pivot++;
        startShift++;
      } else if (array.get(i) == pivotVal) {
        array.swap(startShift, i);
        startShift++;
      }
    }
    quickSortRecur(array, start, pivot - 1);
    quickSortRecur(array, startShift, end);
  }

  /**
   * heapSort puts the array max into heap order, then sorts the array
   * by repeatedly swapping the max element with the last,
   * then sinking the new first element.
   * @param a the array to be sorted
   */
  void heapSort(ProjectArray a) {
    int size = a.length();

    // put into heap order
    for (int i = size / 2 - 1; i >= 0; i--)
      sink(a, i, size);

    // sortdown
    for (int i = size - 1; i > 0; i--) {
      a.swap(i, 0);
      sink(a, 0, i);
    }
  }

  /**
   * sink moves the element at index parent to its appropriate
   * place in the max heap by repeatedly swapping it with its
   * children until it has no greater children
   * @param a the array to be sorted
   * @param parent the index of the element to sink
   * @param size the length of the array a to sort
   */
  void sink(ProjectArray a, int parent, int size) {
    int leftChild  = 2 * parent + 1;
    int rightChild = 2 * parent + 2;

    // loop while parent has children
    while (leftChild < size || rightChild < size) {

      // no left child
      if (leftChild >= size) {
        if (a.get(rightChild) > a.get(parent))
          a.swap(rightChild, parent);
        break;
      }

      // no right child
      if (rightChild >= size) {
        if (a.get(leftChild) > a.get(parent))
          a.swap(leftChild, parent);
        break;
      }

      // parent greater than children
      if (a.get(parent) > a.get(leftChild) && a.get(parent) > a.get(rightChild))
        break;

      // swap parent with largest child
      if (a.get(leftChild) > a.get(rightChild)) {
        a.swap(leftChild, parent);
        parent = leftChild;
      } else {
        a.swap(rightChild, parent);
        parent = rightChild;
      }
      leftChild  = 2 * parent + 1;
      rightChild = 2 * parent + 2;
    }
  }

  /**
   * bubbleSort sorts the array by repeatedly swapping
   * adjacent elements if the larger element comes first.
   * @param inputArray the array to be sorted
   */
  void bubbleSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int index = 0; index < numElements - 1; index++) {
      for (int position = 0; position < numElements - index - 1; position++) {
        if (inputArray.get(position) > inputArray.get(position + 1)) {
          inputArray.swap(position, position + 1);
        }
      }
    }
  }

  /**
   * selectionSort sorts the array by repeatedly selecting
   * the minimum element in the remaining unsorted part of
   * the array and putting it in the next unsorted spot
   * @param inputArray the array to be sorted
   */
  void selectionSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int unsorted = 0; unsorted < numElements - 1; unsorted++) {
      int minimum = unsorted;
      for (int compared = unsorted + 1; compared < numElements; compared++) {
        if (inputArray.get(compared) < inputArray.get(minimum)) {
          minimum = compared;
        }
      }
      inputArray.swap(minimum, unsorted);
    }
  }

  /**
   * insertionSort sorts the array by inserting the current
   * element into its correct place in the already sorted
   * part of the array.
   * @param inputArray the array to be sorted
   */
  void insertionSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int index = 1; index < numElements; index++) {
      int position = index;
      while (position > 0 && inputArray.get(position - 1) > inputArray.get(position)) {
        inputArray.swap(position, position - 1);
        position--;
      }
    }
  }

  /**
   * bOzOsOrT sorts the array using Bozo sort
   * Random elements are swapped until the array is sorted
   * @param array the array to be sorted
   */
  void bOzOsOrT(ProjectArray array) {
    while (!(array.isSorted())) {
      Random rand = new Random();
      int randOne = rand.nextInt(array.length());
      int randTwo = rand.nextInt(array.length());
      array.swap(randOne, randTwo);
    }
  }

  /**
   * timSort uses an insertion sort and Merge sort hybrid to sort the array
   * @param array the array to be sorted
   */
  void timSort(ProjectArray array) {
    timRecur(array, 0, array.length() - 1);
  }

  /**
   * timRecur recursively divides the array into subarrays, which are sorted
   * using insertion sort. The subarrays are then merged like in Merge sort
   * @param a the array to be sorted
   * @param lower the lower bound of the subarray
   * @param upper the upper bound of the subarray
   */
  void timRecur(ProjectArray a, int lower, int upper) {
    if (upper - lower < 7) {
      hybridInsertion(a, lower, upper);
      return;
    }
    int mid = (lower + upper) / 2;
    timRecur(a, lower, mid);
    timRecur(a, mid + 1, upper);
    merge(a, lower, mid, mid + 1, upper);
  }

  /**
   * lotzSort uses an insertion sort and Quicksort hybrid to sort the array. It
   * is named after our professor, Melanie Lotz, since there was no better name
   * for it that already existed
   * @param array the array to be sorted
   */
  void lotzSort(ProjectArray array) {
    lotzSortRecur(array, 0, array.length() - 1);
  }

  /**
   * lotzSortRecur recursively divides the array around a pivot similar to
   * Quicksort. When the subarrays are of a certain length, insertion sort is
   * used
   * @param array the array to be sorted
   * @param start the first index of the subarray
   * @param end the last index of the subarray
   */
  void lotzSortRecur(ProjectArray array, int start, int end) {
    if (end - start < 7) {
      hybridInsertion(array, start, end);
      return;
    }
    if (start >= end || start < 0 || end >= array.length())
      return;
    int pivot = start;
    int pivotVal = array.get(pivot);
    int startShift = pivot + 1;
    for (int i = startShift; i <= end; i++) {
      if (array.get(i) < pivotVal) {
        array.swap(startShift, i);
        array.swap(startShift, pivot);
        pivot++;
        startShift++;
      } else if (array.get(i) == pivotVal) {
        array.swap(startShift, i);
        startShift++;
      }
    }
    lotzSortRecur(array, start, pivot - 1);
    lotzSortRecur(array, startShift, end);
  }

  /**
   * hybridInsertion is a version of insertion sort that can be implemented
   * as part of a hybrid sorting algorithm such as Timsort
   * @param array the array to be sorted
   * @param lower the lower bound of the subarray to be sorted
   * @param upper the upper bound of the subarray to be sorted
   */
  void hybridInsertion(ProjectArray array, int lower, int upper) {
    for (int i = lower; i < upper; i++) {
      int compares = i;
      while (compares >= lower && array.get(compares) > array.get(compares+1)) {
        array.swap(compares, compares + 1);
        compares -= 1;
      }
    }
  }
}
