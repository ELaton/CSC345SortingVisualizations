import java.util.Random;
import java.util.Arrays;

public class Test {


    public static void main(String[] args) {
        String type = args[0];
        int size = Integer.parseInt(args[1]);
        int iterations = Integer.parseInt(args[2]);

        for (int i = 0; i < iterations; i++) {
            int[] array = new int[size];
            for (int j = 0; j < size; j++)
                array[j] = j;
            shuffle(array, size);
            ProjectArray pa = new ProjectArray(array);
            //System.out.println("Before: " + Arrays.toString(array));
            //System.out.println("Entering sort:");
            if (type.equals("merge"))
                Sort.mergeSort(pa);
            else if (type.equals("heap"))
                Sort.heapSort(pa);
            else if (type.equals("radix"))
                Sort.radixSort(pa);
            //System.out.println("Ending sort: ");
            //System.out.println("After:  " + Arrays.toString(array));
            System.out.println("Access Count was: " + pa.getAccessCount());
            System.out.println();
            check(array, size);
        }


    }

    private static void shuffle(int[] a, int size) {
        Random rand = new Random();
        for (int i = size - 1; i > 0; i--) {
            int index = rand.nextInt(i + 1);
            int tmp = a[index];
            a[index] = a[i];
            a[i] = tmp;
        }
    }

    private static void check(int[] a, int size) {
        for (int i = 0; i < size; i++) {
            if (a[i] != i) {
                System.out.println("Index " + i + " has value " + a[i]);
                System.out.println(Arrays.toString(a));
                break;
            }
        }
    }
}
