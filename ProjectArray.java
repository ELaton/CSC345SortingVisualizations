import java.util.Arrays;

/**
 * The class ProjectArray is used to keep track of the accessCounts
 * of any given sorting algorithm on an array.
 * It also contains a temporary array that keep track of accessCounts.
 */
public class ProjectArray {
    
    private int[] array;
    private int[] extra;
    private int accessCount;

    public ProjectArray(int[] array) {
        this.array = array;
        this.extra = new int[array.length];
        this.accessCount = 0;
    }

    /**
     * @return the length of the array
     */
    public int length() {
        return array.length;
    }

    /**
     * Sets the element at index i with the value val
     * @param i the index to set
     * @param val the value to set
     */
    public void set(int i, int val) {
        array[i] = val;
        accessCount++;
    }

    /**
     * Sets the element at index i in the temporary array
     * with the value val
     * @param i the index in the temporary array to set
     * @param val the value to set
     */
    public void setExtra(int i, int val) {
        extra[i] = val;
        accessCount++;
    }

    /**
     * Gets the element at index i
     * @param i the index to get
     */
    public int get(int i) {
        accessCount++;
        return array[i];
    }

    /**
     * Gets the element at index i in the temporary array
     * @param i the index to get in the temporary array
     */
    public int getExtra(int i) {
        accessCount++;
        return extra[i];
    }

    /**
     * Swaps the element at index i with the element at index j
     * @param i the index to swap
     * @param j the index to swap
     */
    public void swap(int i, int j) {
        int tmp = array[i];
        array[i] = array[j];
        array[j] = tmp;
        accessCount += 4;
    }
    
    /**
     * @return the current accessCount
     */
    public int getAccessCount() {
        return accessCount;
    }

    /**
     * Sets the accessCount to 0
     */ 
    public void clearAccessCount() {
        accessCount = 0;
    }

    /**
     * @return a String representation of the array
     */
    public String toString() {
        return Arrays.toString(array);
    }

    /**
     * Checks if the array is sorted
     * @return True if the array is sorted, False otherwise
     */
    public boolean isSorted() {
        for (int i = 0; i < array.length - 1; i++)
            if (array[i] > array[i+1])
                return false;
        return true;
    }

}
