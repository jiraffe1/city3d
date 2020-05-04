float xrot = 0;
float yrot  = 0;
float zrot = 0;
float zoom = 1;
int[] value = new int[2500];
float density = random(5,25);

void setup() {
  scale(zoom);
  size(1080,780,P3D);
  background(0,150,255);
  ortho();
  
  for(int i = 0; i < 50; i++) {
    for(int j = 0; j < 50; j++) {
      value[(i * 50) + j] = int(random(0, density));
    }
  }
}

void draw() {
  scale(zoom);
  background(0,150,255);
  fill(0);
  text("framerate",50,30);
  text(frameRate,50,50); 
  text("density",50,70);
  text(100*(1/density),50,90);
  fill(0,200,10);
  ///fill(255,255,255);
  
  translate(width/2,height/2);

  rotateX(xrot);
  rotateY(yrot);
  rotateZ(zrot);
  directionalLight(255,255,255,50,50,50);
  box(1200,5,1200);
  translate(-500,-25,-500);
  // IMPORTANT!! all rendering stuff in here!!
  for(int i = 0; i < 50; i++) {
    for(int j = 0; j < 50; j++) {
      if(value[(i * 50) + j] == 0) {
        fill(100);
        translate(i*10,0,j*10);
        box(15,50,15);
        translate(i*-10,0,j*-10);
      }
      else if(value[(i * 50) + j] == 1) {
        fill(150);
        translate(i*7,-12,j*7);
        box(15,74,15);
        translate(i*-7,12,j*-7);
      }
      else if(value[(i * 50) + j] == 2) {
        
        fill(200);
        translate(i*4,-20,j*4);
        box(10,90,10);
        translate(i*-4,20,j*-4);
        
      }
      else if(value[(i * 50) + j] == 3) {
        fill(75);
        translate(i*12,10,j*12);
        box(15,30,15);
        translate(i*-12,-10,j*-12);
      }

      else if(value[(i * 50) + j] == 4) {
        fill(75);
        translate(i*13,20,j*13);
        box(15,10,15);
        translate(i*-13,-20,j*-13);
      }
    }
    translate(0,-25,0);
    fill(230);
    box(30,100,30);
    translate(0,-25,0);
    box(20,100,20);
    translate(0,-25,0);
    box(10,150,10);
    translate(0,-25,0);
    box(5,200,5);
    translate(0,100,0);
  }
  
  if(keyPressed) {
    if(key == 'a') {
      yrot += 0.005;
    }
    else if(key == 'd') {
      yrot -= 0.005;
    }
    else if(key == 's'){
      xrot += 0.005;
    }
    else if(key == 'w'){
      xrot -= 0.005;
    }
    //else if(key == 'q'){
      //zoom += 0.005;
    //}
    //else if(key == 'e'){
      //zoom -= 0.005;
    //}
  }
  
  
}
