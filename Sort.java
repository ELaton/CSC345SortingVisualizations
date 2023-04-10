public class Sort {

    public static void heapSort(ProjectArray a) {
        int size = a.length();

        //System.out.println("Starting heapify: ");
        // put into heap order
        for (int i = size / 2 - 1; i >= 0; i--) {
            //System.out.println("Sinking element i = " + i);
            sink(a, i, size);
        }
        //System.out.println("Starting sortdown: ");
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
            //System.out.println("Parent is: " + parent);
            //System.out.println("leftChild is: " + leftChild);
            //System.out.println("rightChild is: " + rightChild);
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


    public static void mergeSort(ProjectArray a) {
        mergeRecur(a, 0, a.length() - 1);
    }

    private static void mergeRecur(ProjectArray a, int lower, int upper) {
        if (upper - lower < 1)
            return;
        int mid = (lower + upper) / 2;
        mergeRecur(a, lower, mid);
        mergeRecur(a, mid + 1, upper);
        merge(a, lower, mid, mid + 1, upper);
    }

    private static void merge(ProjectArray a, int lower, int mid1, int mid2, int upper) {
        int bottom   = lower;
        int tmpIndex = lower;
        
        while (lower <= mid1 || mid2 <= upper) {
            if (lower > mid1)
                a.setExtra(tmpIndex++, a.get(mid2++));
            else if (mid2 > upper)
                a.setExtra(tmpIndex++, a.get(lower++));
            else if (a.get(lower) <= a.get(mid2))
                a.setExtra(tmpIndex++, a.get(lower++));
            else
                a.setExtra(tmpIndex++, a.get(mid2++));
        }

        for (int i = 0; i < upper; i++)
            a.set(i, a.getExtra(i));
    }

}
