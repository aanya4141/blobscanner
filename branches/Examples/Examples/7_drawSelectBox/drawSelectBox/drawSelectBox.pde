/* 
 * Blobscanner Processing library 
 * by Antonio Molinaro - 01/01/2011.
 * Draws the blobs boundingbox only
 * for the blobs with mass equals or bigger
 * to the specified value.
 *
 */
import Blobscanner.*;

Detector bd;

PImage img = loadImage("blobs.jpg");

size(img.width, img.height);

img.filter(THRESHOLD);

bd = new Detector( this, 0, 0, img.width, img.height, 254 );

image(img, 0, 0);

color boundingBoxCol = color(255, 0, 0);
int boundingBoxThickness = 2;
int minimumWeight = 1900;

img.loadPixels();

bd.findBlobs(img.pixels, img.width, img.height);
bd.loadBlobsFeatures();// to call always before to use a method returning or processing a blob feature
bd.weightBlobs(true);  // to call always before an operation involving the blob's weight( mass )
bd.drawSelectBox(minimumWeight, boundingBoxCol, boundingBoxThickness);
 

 
