# CSC345SortingVisualizations

Authors: Adrian Moore, Ellie Laton, Federico Fernandez

Class: CSC 345-Spring 2023

Files: SortingAlgorithmsVisualizer.pde, RectangleGUI.pde, SelectionScreen.pde, SortingAlgorithms.pde

Description: This program is intended to be a visualization of various sorting algorithms at work, each ranging in terms of its complexity. We have around eleven different sorting algorithms implemented right now: 

	~ bubbleSort
	~ insertionSort
	~ selectionSort
	~ shellSort
	~ heapSort
	~ radixSort
	~ mergeSort
	~ quickSort
	~ timSort
	~ lotzSort
	~ bozoSort

In its current state, the program will prompt the user to select from one of these eleven choices using text labels atop interactable buttons. Once the user has selected a button, a randomly generated array of differently-sized rectangles will be given to the chosen sorting algorithm. Then, as each change is made to the original array, the screen will continuously update to reflect these changes. Finally, at the end of it all, the program will display the total amount of array accesses that were made throughout the process of sorting with the chosen algorithm. This will give the user a general sense as to the efficiency and complexity of each sorting algorithm, independent of the time taken to actually run the graphics program. 

-------------------------------------------------------------------------------------------
How to Install: This program runs off of a Java-based IDE called "Processing", which was specifically built to handle complex graphics in a more accessible and user-friendly way. In order to properly run the software, you will need to install the Processing software from their website and run the "SortingAlgorithmsVisualizer.pde" file in the same folder as the other provided files: "RectangleGUI.pde", "SelectionScreen.pde", and "SortingAlgorithms.pde". 

How to Install and Run: Download the Processing IDE from their website. 

1) Go to "https://processing.org/". 
2) Click on the "Download" button on the left-hand side of the screen. 
3) Follow the website's directions for installation. 
4) Open the "SortingAlgorithmsVisualizer" folder using the Processing IDE
	- Go to "File" -> "Open" in the top left hand corner. 
	- Find the "SortingAlgorithmsVisualizer" folder in your files.
	- Open "SortingAlgorithmsVisualizer.pde" by double-clicking on it. 
5) Run the "SortingAlgorithmsVisualizer.pde" file by pressing the triangular play button in the top, left-hand corner. 

-------------------------------------------------------------------------------------------

How to Select and Use a Sorting Algorithm: 

1) Upon initial startup of the "SortingAlgorithmsVisualizer.pde" file, the user will be prompted to click on one of eleven buttons. Each button will be labelled with a different sorting algorithm. 
2) Once the user has clicked on their desired sorting algorithm, then a randomly generated array of differently-sized rectangles will be shown to the console. 
3) As the sorting algorithm works, any changes made to the original array will be shown on the console through either swapping or setting elements. 
4) At the end of it all, you should see a series of rectangles, side-by-side, sorted in ascending order (with larger rectangles on the right and smaller ones on the left). 
5) Lastly, you should see a message that displays the number of array accesses encountered by your rectangle array from your sorting algorithm. 
	- This should give you a general sense as to how efficient your chosen sorting algorithm is compared to the other algorithms. 

-------------------------------------------------------------------------------------------

Notes: 
1) If you would like to change the number of rectangles being generated, then you should find the "numRectangle" variable at the top of the "SortingAlgorithmsVisualizer.pde" file. 
	- Our current recommendation is to input a value no greater than 256, because anything larger tends to look a bit stranger with how the auto-centering function works. 
	- Additionally, having the advised cap at 256 means it is much easier to actually see what is happening to each rectangle in the array. At larger values, the rectangles tend to become so thin that it's hard to tell what is happening. 

2) If you would like to test out the algorithms' best and worst-case runtimes, then you can simply look towards the end of the "RectangleGUI.pde" file. On Line 77, there is a comment that says, "Used for Debugging". 
	- Line 78 will create a rectangle array sorted in descending order, in order to mimic the conditions of each sorts' worst-case scenario. 
	- Line 79 will create an already sorted rectangle array. This will help mimic a best-case scenario in which the array is already sortetd in ascending order. 

3) Currently, the program is set to run at maximum speed for all rectangle array sizes. However, if you would like to slow the sorting algorithms down, then you can modify the "delay" variable at the top of "SortingAlgorithmsVisualizer.pde" to a value larger than 1. As the name implies, larger values for "delay" will cause the program to run slower and vice versa. 
	- Keep in mind, however, that the maximum the program can run would indicate a delay of 1. Our variable does not accept non-integer numbers or 0.

-------------------------------------------------------------------------------------------

Included Files (5): 
"SortingAlgorithmsVisualizer.pde"
"RectangleGUI.pde"
"SelectionScreen.pde"
"SortingAlgorithms.pde"
"README.txt"