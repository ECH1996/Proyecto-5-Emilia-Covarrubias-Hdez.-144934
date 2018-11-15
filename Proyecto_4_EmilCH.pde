import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;
Capture cam;

int p;
PImage i1, i2, i3, i4;

void setup() {
  size(640,480);
  cam = new Capture(this, 640, 480);
  cam.start();
  opencv = new OpenCV(this, cam);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
  
  i1 = loadImage("3e1aad4cf94dbee43e5878f36e8d20e2.png");
  i2 = loadImage("png-star-logo-mandala-art-ccb0b76ddf86bf46bb245b5c10c3ef8b-900x0.png");
  i3 = loadImage("Mandala-Line-Art.png");
  i4 = loadImage("1000px-Mandala_52.svg.png");
}

void draw() {
  opencv.loadImage(cam);
  image(cam, 0, 0);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
   if(faces[i].x <= width/2 && faces[i].y <= height/2){
      pushMatrix();
      scale(.6);
      image(i1,faces[i].x*1.5, faces[i].y*1.5);
      popMatrix();
    }
    else if(faces[i].x >= width/2 && faces[i].y >= height/2){
      pushMatrix();
      scale(.3);
      image(i2,faces[i].x*3, faces[i].y*3);
      popMatrix();
    }
    else if(faces[i].x >= width/2 && faces[i].y <= height/2){
      pushMatrix();
      scale(.1);
      image(i3,faces[i].x*9, faces[i].y*6);
      popMatrix();
    }
    else if(faces[i].x <= width/2 && faces[i].y >= height/2){
      pushMatrix();
      scale(.2);
      image(i4,faces[i].x*4, faces[i].y*4);
      popMatrix();
    }

  }
}

void captureEvent(Capture c) {
  c.read();
}