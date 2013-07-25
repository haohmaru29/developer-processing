class Mount {
  float xposA;
  float yposA;
  float xposB;
  float yposB;
  float xposC;
  float yposC;
  float xposD;
  float yposD;
  float xposE;
  float yposE;
  float xposF;
  float yposF;
  float xposG;
  float yposG;
  float xposH;
  float yposH;
  float xposI;
  float yposI;
  float change;

  Mount(float xbaseA, float ybaseA, float xsummitB, float ysummitB, float xbaseC, float ybaseC, float xbaseD, float ybaseD, float xbaseE, float ybaseE, float xbaseF, float ybaseF, float xbaseG, float ybaseG, float xbaseH, float ybaseH, float xbaseI, float ybaseI, float chg) {
    xposA = xbaseA;
    yposA = ybaseA;
    xposB = xsummitB;
    yposB = ysummitB;
    xposC = xbaseC;
    yposC = ybaseC;
    xposD = xbaseD;
    yposD = ybaseD;
    xposE = xbaseE;
    yposE = ybaseE;
    xposF = xbaseF;
    yposF = ybaseF;
    xposG = xbaseG;
    yposG = ybaseG;
    xposH = xbaseH;
    yposH = ybaseH;
    xposI = xbaseI;
    yposI = ybaseI;
    change = chg; 
  }

  void update() {
  } 

  void display() {
    // VERTEX NEGRO-FONDO
    noStroke();
    fill(0);
    beginShape();
    vertex(xposA, yposA);
    vertex(xposB, yposB-(change));
    vertex(xposC, yposC-(change));
    vertex(xposD, yposD-(change));
    vertex(xposE, yposE-(change));
    vertex(xposF, yposF-(change));
    vertex(xposG, yposG-(change));
    vertex(xposH, yposH-(change));
    vertex(xposI, yposI);
    endShape(CLOSE);
    
    // VERTEX BLANCO-SOBRE
    fill(255);
    beginShape();
    vertex(xposA+4, yposA);
    vertex(xposB+7, yposB+3-(change));
    vertex(xposC+3, yposC-(change));
    vertex(xposD+3, yposD-(change));
    vertex(xposE, yposE+5-(change));
    vertex(xposF-7, yposF+2-(change));
    vertex(xposG-3, yposG+2-(change));
    vertex(xposH-5, yposH-(change));
    vertex(xposI-2, yposI);
    endShape(CLOSE);
    
    stroke(0);
    // LINEA QUEBRADA (serie de 3)
    line(xposA, yposA, xposA+40, yposA-20+(3));
    line(xposA+40, yposA-20+(3), xposG-40, yposG+20-(change));
    line(xposG-40, yposG+20-(change), xposG, yposG-(change));
    
    // LINEA UNICA 1
    line(xposA, yposA, xposF-7+(5), yposF+2+(3)-(change));
    
    // LINEA UNICA 2
    line(xposD+3, yposD-(change), xposF-7+(5), yposF+2+(3)-(change));
    
  }
}

