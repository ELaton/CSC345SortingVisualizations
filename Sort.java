import java.util.Random;

public class Sort {
    public void BOGOSort(ProjectArray array) {
        while (!(array.isSorted())) {
            Random rand = new Random();
            int randOne = rand.nextInt(array.length());
            int randTwo = rand.nextInt(array.length());
            array.swap(randOne, randTwo);
        }
    }

    public void Shellsort(ProjectArray array) {
        int h = 1;
        while (h < array.length()/3)
            h = 3*h + 1;
        ShellsortRecur(array, (h-1)/3);
    }

    private void ShellsortRecur(ProjectArray array, int h) {
        System.out.println(h);
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
        System.out.println(array.toString());
        if (h == 1)
            return;
        ShellsortRecur(array, (h-1)/3);
    }

    public void Quicksort(ProjectArray array) {
        QuicksortRecur(array, 0, array.length());
    }

    private void QuicksortRecur(ProjectArray array, int start, int end) {
        if (start >= end || start < 0 || end > array.length())
            return;
        int pivot = start;
        int pivotVal = array.get(pivot);
        int startShift = pivot + 1;
        for (int i = pivot + 1; i < end; i++) {
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
        QuicksortRecur(array, 0, pivot - 1);
        QuicksortRecur(array, startShift, end);
    }
}