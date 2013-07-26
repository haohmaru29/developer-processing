class Mount {
  float xposA;
  float yposA;
  float xposB;
  float yposB;
  float xposC;
  float yposC;
  int offX;

  Mount(float xbase1, float ybase1, float xAltura, float yAltura, float xbase2, float ybase2 ) {
    xposA = xbase1;
    yposA = ybase1;
    xposB = xAltura;
    yposB = yAltura;
    xposC = xbase2;
    yposC = ybase2;
    //this.offX = offX;
  }

  void update() {
  } 

  void display() {
    noStroke();
    fill(0, 140);
    triangle(xposA, yposA, xposB, yposB, xposC, yposC);

//    for (float i = 0; i < xposB/10; i++) {
//      noStroke();
//      fill(0, 100);
//      triangle(xposA+random(-i/2, i/2), yposA, xposB+random(-i/2, i/2), yposB+random(-i/3, i/2), xposC-random(-i/3, i/2), yposC);
//      println(i/2);
//    }

    for (float i = 0; i < xposB/10; i++) {
      noStroke();
      fill(228, 252, 254, 10);
      triangle(xposA+random(0, 30), yposA, xposB+random(0, 40), yposB+random(-20, 20), xposC-random(0, 20), yposC);
    }
    
    for (float i = 0; i < xposB/5; i++) {
      noStroke();
      fill(255, 211, 224, 2);
      triangle(xposA+random(-i/2, i), yposA, xposB+random(-i/2, i), yposB+random(-i/2, i), xposC-random(-i/2, i), yposC);
    }
    


//    noStroke();
//    fill(228, 252, 254, 180);
//    triangle(xposA+random(50, 80), yposA, xposB, yposB, xposC-random(0, 15), yposC);
//    triangle(xposA+random(30, 80), yposA, xposB, yposB+random(0, 30), xposC-random(15, 40), yposC);
//    triangle(xposA+random(10, 50), yposA, xposB, yposB+random(10, 40), xposC-random(30, 70), yposC);
//    triangle(xposA+random(50, 80), yposA, xposB, yposB, xposC-random(0, 15), yposC);
//    fill(255, 211, 224, 80);
//    triangle(xposA+random(70, 90), yposA, xposB, yposB, xposC-random(5, 25), yposC);
  }
}

