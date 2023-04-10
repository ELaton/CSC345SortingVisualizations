import java.util.Random;

public class Sort {
    
    public static void radixSort(ProjectArray a) {
        int size = a.length();

        // get the maximum element
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

            // count how many elements with radix 0
            for (int j = 0; j < size; j++) {
                if ((a.get(j) / i) % 2 == 0)
                    zeros++;
            }

            // copy elements of radix 0 and 1 separately into tmp array in order
            for (int j = size - 1; j >= 0; j--) {
                tmp = a.get(j);
                if ((tmp / i) % 2 == 0)
                    a.setExtra(--zeros,  tmp);
                else
                    a.setExtra(--ones, tmp);
            }

            // copy values from tmp array back into array
            for (int j = 0; j < size; j++)
                a.set(j, a.getExtra(j));
        }
    }


    public static void heapSort(ProjectArray a) {
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

    private static void sink(ProjectArray a, int parent, int size) {
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


    //public static void mergeSort(ProjectArray a) {
    //    mergeRecur(a, 0, a.length() - 1);
    //}

    public static void mergeSort(ProjectArray a) {
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

    private static void merge(ProjectArray a, int lower, int mid1, int mid2, int upper) {
        int bottom   = lower;
        int tmpIndex = lower;
        
        // loop while lower or upper array still has elements
        while (lower <= mid1 || mid2 <= upper) {
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
    
    public static void BOGOSort(ProjectArray array) {
        while (!(array.isSorted())) {
            Random rand = new Random();
            int randOne = rand.nextInt(array.length());
            int randTwo = rand.nextInt(array.length());
            array.swap(randOne, randTwo);
        }
    }

    public static void Shellsort(ProjectArray array) {
        int h = 1;
        while (h < array.length()/3)
            h = 3*h + 1;
        ShellsortRecur(array, (h-1)/3);
    }

    private static void ShellsortRecur(ProjectArray array, int h) {
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

    public static void Quicksort(ProjectArray array) {
        QuicksortRecur(array, 0, array.length() - 1);
    }

    private static void QuicksortRecur(ProjectArray array, int start, int end) {
        if (start >= end || start < 0 || end >= array.length())
            return;
        int pivot = start;
        int pivotVal = array.get(pivot);
        int startShift = pivot + 1;
        for (int i = startShift; i <= end; i++) {
            if (array.get(i) < pivotVal) {
                array.swap(startShift, i);
                array.swap(startShift, pivot);
                pivot++; startShift++;
            }
            else if (array.get(i) == pivotVal) {
                array.swap(startShift, i);
                startShift++;
            }
        }
        QuicksortRecur(array, start, pivot - 1);
        QuicksortRecur(array, startShift, end);
    }
    
    public static void Timsort(ProjectArray a) {
        timRecur(a, 0, a.length() - 1);
    }

    private static void timRecur(ProjectArray a, int lower, int upper) {
        if (upper - lower < 16) {
            hybridInsertion(a, lower, upper);
            return;
        }
        int mid = (lower + upper) / 2;
        timRecur(a, lower, mid);
        timRecur(a, mid + 1, upper);
        merge(a, lower, mid, mid + 1, upper);
    }
    
    public static void QuickHybrid(ProjectArray array) {
        QuickHybridRecur(array, 0, array.length() - 1);
    }

    private static void QuickHybridRecur(ProjectArray array, int start, int end) {
        if (end - start < 16) {
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
                pivot++; startShift++;
            }
            else if (array.get(i) == pivotVal) {
                array.swap(startShift, i);
                startShift++;
            }
        }
        QuickHybridRecur(array, start, pivot - 1);
        QuickHybridRecur(array, startShift, end);
    }

    private static void hybridInsertion(ProjectArray array, int lower, int upper) {
        for (int i = lower; i < upper; i++) {
            int compares = i;
            while (compares >= 0 && array.get(compares) > array.get(compares+1)) {
                array.swap(compares, compares + 1);
                compares -= 1;
            }
        }
    }
}
