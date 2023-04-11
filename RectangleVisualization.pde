class RectangleVisualization {
  void drawRectangles() {
    fill(0, 200, 200);
    strokeWeight(1);
    stroke(0, 0, 0);
    int yCoordinate = 750;
    if (recenterNotSkinny) {
      drawRecenteredRectangles(yCoordinate);
    } else {
      drawSkinnyRectangles(yCoordinate);
    }
  }

  private void drawRecenteredRectangles(int yCoord) {
    background(255, 255, 255);
    int currentPos = 0;
    int rectWidth = 50;
    int startingX = 750 - (25 * (numRectangles - 1));
    for (int index = 0; index < numRectangles; index++) {
      rect(startingX, yCoord, rectWidth, -rectangleLengths[currentPos]);
      currentPos++;
      startingX += 50;
    }
  }

  private void drawSkinnyRectangles(int yCoord) {
    background(255, 255, 255);
    int currentPos = 0;
    int rectWidth = 1400 / numRectangles;
    for (int index = 0; index < numRectangles; index++) {
      int offset = 50 - 1400 / numRectangles;
      rect(offset + 100 + rectWidth * index, yCoord, rectWidth, -rectangleLengths[currentPos]);
      currentPos++;
    }
  }
}
