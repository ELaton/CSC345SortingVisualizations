class SortingAlgorithms {
  void radixSort(ProjectArray a) {
    int size = a.length();
    int max = a.get(0);
    int tmp = max;
    for (int i = 1; i < size; i++) {
      tmp = a.get(i);
      if (tmp > max)
        max = tmp;
    }
    for (int i = 1; max / i > 0; i *= 2) {
      int ones  = size;
      int zeros = 0;
      for (int j = 0; j < size; j++) {
        if ((a.get(j) / i) % 2 == 0)
          zeros++;
      }
      for (int j = size - 1; j >= 0; j--) {
        tmp = a.get(j);
        if ((tmp / i) % 2 == 0)
          a.setExtra(--zeros, tmp);
        else
          a.setExtra(--ones, tmp);
      }
      for (int j = 0; j < size; j++)
        a.set(j, a.getExtra(j));
    }
  }

  void mergeSort(ProjectArray a) {
    int len = a.length();
    if (len < 1)
      return;
    for (int size = 1; size < len; size *= 2) {
      for (int lower = 0; lower < len - 1; lower += 2 * size) {
        int mid1 = size + lower - 1;
        int mid2 = mid1 + 1;
        int upper  = (2 * size) + lower - 1;
        if (len - 1 < mid1)
          mid1 = len - 1;
        if (len - 1 < mid2)
          mid2 = len - 1;
        if (len - 1 < upper)
          upper = len - 1;
        merge(a, lower, mid1, mid2, upper);
      }
    }
  }

  void merge(ProjectArray a, int lower, int mid1, int mid2, int upper) {
    int bottom   = lower;
    int tmpIndex = lower;
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
    for (int i = bottom; i <= upper; i++)
      a.set(i, a.getExtra(i));
  }

  void shellSort(ProjectArray array) {
    int h = 1;
    while (h < array.length()/3)
      h = 3*h + 1;
    ShellsortRecur(array, (h-1)/3);
  }

  void ShellsortRecur(ProjectArray array, int h) {
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
    ShellsortRecur(array, (h-1)/3);
  }

  void quickSort(ProjectArray array) {
    QuicksortRecur(array, 0, array.length() - 1);
  }

  void QuicksortRecur(ProjectArray array, int start, int end) {
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
    QuicksortRecur(array, start, pivot - 1);
    QuicksortRecur(array, startShift, end);
  }

  void heapSort(ProjectArray a) {
    int size = a.length();
    for (int i = size / 2 - 1; i >= 0; i--)
      sink(a, i, size);
    for (int i = size - 1; i > 0; i--) {
      a.swap(i, 0);
      sink(a, 0, i);
    }
  }

  void sink(ProjectArray a, int parent, int size) {
    int leftChild  = 2 * parent + 1;
    int rightChild = 2 * parent + 2;
    while (leftChild < size || rightChild < size) {
      if (leftChild >= size) {
        if (a.get(rightChild) > a.get(parent))
          a.swap(rightChild, parent);
        break;
      }
      if (rightChild >= size) {
        if (a.get(leftChild) > a.get(parent))
          a.swap(leftChild, parent);
        break;
      }
      if (a.get(parent) > a.get(leftChild) && a.get(parent) > a.get(rightChild))
        break;
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

  void bubbleSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int firstPosition = 0; firstPosition < numElements - 1; firstPosition++) {
      for (int secondPosition = 0; secondPosition < numElements - firstPosition - 1; secondPosition++) {
        if (inputArray.get(secondPosition) > inputArray.get(secondPosition + 1)) {
          inputArray.swap(secondPosition, secondPosition + 1);
        }
      }
    }
  }

  void selectionSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int unsortedPosition = 0; unsortedPosition < numElements - 1; unsortedPosition++) {
      int minimumPosition = unsortedPosition;
      for (int comparedPosition = unsortedPosition + 1; comparedPosition < numElements; comparedPosition++) {
        if (inputArray.get(comparedPosition) < inputArray.get(minimumPosition)) {
          minimumPosition = comparedPosition;
        }
      }
      inputArray.swap(minimumPosition, unsortedPosition);
    }
  }

  void insertionSort(ProjectArray inputArray) {
    int numElements = inputArray.length();
    for (int originalPosition = 1; originalPosition < numElements; originalPosition++) {
      int originalElement = inputArray.get(originalPosition);
      int comparedPosition = originalPosition - 1;
      while (comparedPosition >= 0 && inputArray.get(comparedPosition) > originalElement) {
        inputArray.set(comparedPosition + 1, comparedPosition);
        comparedPosition--;
      }
      inputArray.set(comparedPosition + 1, originalElement);
      pauseScreen();
    }
  }

  void bOgOsOrT(ProjectArray array) {
    while (!(array.isSorted())) {
      Random rand = new Random();
      int randOne = rand.nextInt(array.length());
      int randTwo = rand.nextInt(array.length());
      array.swap(randOne, randTwo);
    }
  }

  void timSort(ProjectArray a) {
    timRecur(a, 0, a.length() - 1);
  }

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

  void lotzSort(ProjectArray array) {
    lotzSortRecur(array, 0, array.length() - 1);
  }

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
