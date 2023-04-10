import java.util.Arrays;

public class ProjectArray {
    
    private int[] array;
    private int[] extra;
    private int accessCount;

    public ProjectArray(int[] array) {
        this.array       = array;
        this.extra       = new int[array.length];
        this.accessCount = 0;
    }

    public int length() {
        return array.length;
    }

    public void set(int i, int val) {
        array[i] = val;
        accessCount++;
    }

    public void setExtra(int i, int val) {
        extra[i] = val;
        accessCount++;
    }

    public int get(int i) {
        accessCount++;
        return array[i];
    }

    public int getExtra(int i) {
        accessCount++;
        return extra[i];
    }

    public void swap(int i, int j) {
        int tmp = array[i];
        array[i] = array[j];
        array[j] = tmp;
        accessCount += 4;
    }

    public int getAccessCount() {
        return accessCount;
    }

    public String toString() {
        return Arrays.toString(array);
    }

}
