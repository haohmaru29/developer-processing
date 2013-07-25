class Iceberg {
  float iXposA;
  float iYposA;
  float iXposB;
  float iYposB;
  float iXposC;
  float iYposC;
  float iXposD;
  float iYposD;
  float iXposE;
  float iYposE;

  Iceberg(float iXpointA, float iYpointA, float iXpointB, float iYpointB, float iXpointC, float iYpointC, float iXpointD, float iYpointD, float iXpointE, float iYpointE) {
    iXposA = iXpointA;
    iYposA = iYpointA;
    iXposB = iXpointB;
    iYposB = iYpointB;
    iXposC = iXpointC;
    iYposC = iYpointC; 
    iXposD = iXpointD; 
    iYposD = iYpointD;
    iXposE = iXpointE;
    iYposE = iYpointE;
  }

  void update() {
  }

  void display() {
    stroke(90);
    fill(0, 70);
    beginShape();                  // Iceberg 01
    vertex(iXposA, iYposA);
    vertex(iXposB, iYposB);
    vertex(iXposC, iYposC);  // Punto Inferior
    vertex(iXposD, iYposD);
    vertex(iXposE, iYposE);
    endShape(CLOSE);
  }
}

