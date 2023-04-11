import java.util.Random;

public class ThresholdTest {
    // code to determine at which array size insertion sort works best at for
    // the hybrid sorts
    // the program compares the hybrid sorts to the other sort that is similar
    // Timsort is compared to Merge Sort, and Lotz sort to Quicksort
    public static void main(String[] args) {
        for (int i = 2; i < 24; i++) {
            int timAvg = 0;
            int mergeAvg = 0;
            int quickAvg = 0;
            int qsAvg = 0;
            for (int k = 1; k < 1001; k++) {
                Random rand = new Random();
                int[] arr = new int[4096];
                for (int j = 0; j < arr.length; j++)
                    arr[j] = rand.nextInt(1001);
                int[] arr2 = new int[4096];
                for (int j = 0; j < arr2.length; j++)
                    arr2[j] = rand.nextInt(1001);
                ProjectArray array = new ProjectArray(arr);
                ProjectArray array2 = new ProjectArray(arr2);
                Timsort(array, i);
                Sort.mergeSort(array2);
                timAvg += array.getAccessCount();
                mergeAvg += array2.getAccessCount();
                array.clearAccessCount();
                array2.clearAccessCount();
                arr = new int[4096];
                for (int j = 0; j < arr.length; j++)
                    arr[j] = rand.nextInt(1001);
                arr2 = new int[4096];
                for (int j = 0; j < arr2.length; j++)
                    arr2[j] = rand.nextInt(1001);
                array = new ProjectArray(arr);
                array2 = new ProjectArray(arr2);
                Sort.Quicksort(array);
                QuickHybrid(array2, i);
                qsAvg += array.getAccessCount();
                quickAvg += array2.getAccessCount();
            }
            System.out.println("Insertion Value: " + i);
            timAvg = (timAvg/1000) - (mergeAvg/1000);
            quickAvg = (quickAvg/1000) - (qsAvg/1000);
            System.out.println("Tim: " + timAvg + " Quick: " + quickAvg);
            System.out.println();
        }
    }

    public static void Timsort(ProjectArray a, int limit) {
        timRecur(a, 0, a.length() - 1, limit);
    }

    private static void timRecur(ProjectArray a, int lower, int upper, int l) {
        if (upper - lower < l) {
            hybridInsertion(a, lower, upper);
            return;
        }
        int mid = (lower + upper) / 2;
        timRecur(a, lower, mid, l);
        timRecur(a, mid + 1, upper, l);
        merge(a, lower, mid, mid + 1, upper);
    }

    public static void QuickHybrid(ProjectArray array, int limit) {
        QuickHybridRecur(array, 0, array.length() - 1, limit);
    }

    private static void QuickHybridRecur(ProjectArray array, int start, int end, int l) {
        if (end - start < l) {
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
        QuickHybridRecur(array, start, pivot - 1, l);
        QuickHybridRecur(array, startShift, end, l);
    }

    private static void hybridInsertion(ProjectArray array, int lower, int upper) {
        for (int i = lower; i < upper; i++) {
            int compares = i;
            while (compares >= lower && array.get(compares) > array.get(compares+1)) {
                array.swap(compares, compares + 1);
                compares -= 1;
            }
        }
    }

    private static void merge(ProjectArray a, int lower, int mid1, int mid2, int upper) {
        int bottom   = lower;
        int tmpIndex = lower;
       
        // loop while lower or upper array still has elements
        while ((lower <= mid1 || mid2 <= upper) && tmpIndex <= upper){
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
}
