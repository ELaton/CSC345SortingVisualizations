/* @Authors: Adrian Moore, Ellie Laton, Federico Fernandez
 **  Class: CSC 345-Spring 2023
 **  Description: This class formats a startup screen for the main "SortingAlgorithmVisualizer"
 **  program. It will allow the user to choose from one of the eleven options by letting them
 **  click on labelled buttons that highlight when the mouse hovers over it. It will also
 **  seamlessly transition from the selection screen to the main sorting visualizer screen.
 */

class SelectionScreen {

  // Creates and Formats the Startup Screen with Text and Buttons
  void openSelectionScreen() {
    fill(255, 255, 255);
    rect(0, 0, 1600, 900);
    drawOptionButtons();
    createTextFields();
  }

  // Creates the Sorting Algorithm Buttons
  void drawOptionButtons() {

    // Draws the Rectangles for the Buttons and Keeps Track of Mouse Hovering Locations
    int currentButton = 0;
    for (int xCoord = 150; xCoord <= 1050; xCoord += 450) {
      for (int yCoord = 130; yCoord <= 530; yCoord += 200) {

        // Highlights Any Buttons that the Mouse is Hovering Over in Teal
        if (mouseX >= xCoord && mouseX <= xCoord + 300 && mouseY >= yCoord && mouseY <= yCoord + 150) {
          strokeWeight(5);
          stroke(0, 200, 200);

          // Calls the Respective Sorting Algorithms Depending on If and Which Button was Clicked
          executeButtonActions(currentButton);
        } else {
          noStroke();
        }

        // Draws the Actual Button
        fill(200, 200, 200);
        rect(xCoord, yCoord, 300, 150, 10);
        currentButton++;
      }
    }
    createTimSortButton();
    createLotzSortButton();
  }




  // Creates all of the Text Fields for the Startup Screen
  void createTextFields() {

    // Writes Instructions for the User
    textSize(50);
    fill(0, 0, 0);
    text("Click the Sorting Algorithm You Want", 420, 70);

    // Writes Sorting Algorithm Text Labels for the Buttons
    textSize(32);
    noStroke();
    int currentButton = 0;
    while (currentButton < 11) {
      switch (currentButton) {
      case 0:
        text("Bubble", 250, 215);
        break;
      case 1:
        text("Selection", 690, 215);
        break;
      case 2:
        text("Insertion", 1140, 215);
        break;
      case 3:
        text("Shell", 270, 415);
        break;
      case 4:
        text("Heap", 715, 415);
        break;
      case 5:
        text("Radix", 1160, 415);
        break;
      case 6:
        text("Merge", 250, 615);
        break;
      case 7:
        text("Quick", 710, 615);
        break;
      case 8:
        text("Bozo", 1165, 615);
        break;
      case 9:
        text("TimSort", 470, 810);
        break;
      case 10:
        text("LotzSort", 915, 810);
        break;
      }
      currentButton++;
    }
  }

  // Calls the Appropriate Sorting Method for Each Button Pressed
  private void executeButtonActions(int currentButton) {

    // Keeps Track of Which Buttons were Clicked
    switch (currentButton) {
    case 0:
      if (mousePressed) {
        currentSortingMethod = "Bubble Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 1:
      if (mousePressed) {
        currentSortingMethod = "Shell Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 2:
      if (mousePressed) {
        currentSortingMethod = "Merge Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 3:
      if (mousePressed) {
        currentSortingMethod = "Selection Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 4:
      if (mousePressed) {
        currentSortingMethod = "Heap Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 5:
      if (mousePressed) {
        currentSortingMethod = "Quick Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 6:
      if (mousePressed) {
        currentSortingMethod = "Insertion Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 7:
      if (mousePressed) {
        currentSortingMethod = "Radix Sort";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    case 8:
      if (mousePressed) {
        currentSortingMethod = "BOzoO0oO0OoOoOoOo00ooO0o";
        sortingNow = true;
        t = new SortThread(currentSortingMethod);
        t.start();
      }
      break;
    }
  }

  // Creates the timSort Button
  void createTimSortButton() {

    // Highlights the timSort Button
    if (mouseX >= 375 && mouseX <= 675 && mouseY >= 720 && mouseY <= 870) {
      strokeWeight(5);
      stroke(0, 200, 200);

      // Keeps Track of and Executes timSort Button Presses
      if (mousePressed) {
        sortingNow = true;
        currentSortingMethod = "Tim Sort";
        t = new SortThread(currentSortingMethod);
        t.start();
      }
    } else {
      noStroke();
    }

    // Creates the Actual Button
    fill(200, 200, 200);
    rect(375, 720, 300, 150, 10);
    fill(0, 0, 0);
  }

  // Creates the lotzSort Button
  void createLotzSortButton() {

    // Highlights the lotzSort Button
    if (mouseX >= 825 && mouseX <= 1125 && mouseY >= 720 && mouseY <= 870) {
      strokeWeight(5);
      stroke(0, 200, 200);

      // Keeps Track of and Executes lotzSort Button Presses
      if (mousePressed) {
        sortingNow = true;
        currentSortingMethod = "Lotz Sort";
        t = new SortThread(currentSortingMethod);
        t.start();
      }
    } else {
      noStroke();
    }

    // Creates the lotzSort Button
    fill(200, 200, 200);
    rect(825, 720, 300, 150, 10);
  }
}
