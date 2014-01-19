size(500,300);
background(255);
strokeWeight(3);
smooth();

float a=20;
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
x=centerX+a*(2*cos(rad)-cos(2*rad));
y=centerY+a*(2*sin(rad)-sin(2*rad));
point(x,y);
}

