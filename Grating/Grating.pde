// GRATING for Patterned Illumination
// by: WALIII+AB
// d02.05.2016

// 
int W = 3; // Pixel size (white region)
int B = W*(3); // Pixel size (black region) needs to be *(n+1) to displace the black
int offset = 0; //pixel offset from top



void setup() {  //setup function called initially, only once
  size(684,608);
  // size(608, 684); // for the other orientation
   background(0);
  noLoop();
}
 
void draw() {
strokeWeight(W);// thickness of white line
stroke(255); // color of white line
for (int i= 0+offset; i < 800; i = i+B) {
line(0, i, 684, i);
//line(0,i,608,i); // For the other orientation 
}

save("diagonal.tif"); // Saves the file with this name, in the code directory 

}