int     nFramesInLoop = 10; 
int     nElapsedFrames;
boolean bRecording; 

String myName="wanfangdiao";
//===================================================
void setup() {
  size (500, 300); 
  
  bRecording = false;
  nElapsedFrames = 0;
  frameRate (nFramesInLoop); 
}
//===================================================
void keyPressed() { 
  // Press a key to export frames to the output folder
  bRecording = true;
  nElapsedFrames = 0;
}
 
//===================================================
void draw() {
// Compute a percentage (0...1) representing where we are in the loop.
  float percentCompleteFraction = 0; 
  if (bRecording) {
    percentCompleteFraction = (float) nElapsedFrames / (float)nFramesInLoop;
  } 
  else {
    float modFrame = (float) (frameCount % nFramesInLoop);
    percentCompleteFraction = modFrame / (float)nFramesInLoop;
  }
 
  // Render the design, based on that percentage. 
  renderMyDesign (percentCompleteFraction);
 
  // If we're recording the output, save the frame to a file. 
  if (bRecording) {
    saveFrame("output/"+ myName + "-loop-" + nf(nElapsedFrames, 4) + ".png");
    nElapsedFrames++; 
    if (nElapsedFrames == nFramesInLoop) {
      bRecording = false;
    }
  }
}
 
//===================================================
void renderMyDesign (float percent) {
 background(255);
 strokeWeight(1);
 smooth();
 for(int i=0; i<= 200; i+=5)
 {
drawCardioid(percent, i);
 }

}

void drawCardioid (float change, int startpoint)
{
float a=startpoint+10*change;
int centerX=250;
int centerY=150;
//
//stroke(0,30);
//noFill();

stroke(20,50,70);
float x, y;
float lastx=-999;
float lasty=-999;
for(float t=0; t <= 360; t+=1){
float rad=radians(t);
x=centerX+a*(2*cos(rad)-cos(3*rad));
y=centerY+a*(2*sin(rad)-sin(3*rad));
translate(x,y,0);
box(x,y);

}
}
