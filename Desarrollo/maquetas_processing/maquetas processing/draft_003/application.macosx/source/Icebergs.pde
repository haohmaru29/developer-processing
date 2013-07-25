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
  float iXposF;
  float iYposF;
  float iXposG;
  float iYposG;
  float iXposH;
  float iYposH;
  float iXposI;
  float iYposI;
  float iChange;

  Iceberg(float ixbaseA, float iybaseA, float ixsummitB, float iysummitB, float ixbaseC, float iybaseC, float ixbaseD, float iybaseD, float ixbaseE, float iybaseE, float ixbaseF, float iybaseF, float ixbaseG, float iybaseG, float ixbaseH, float iybaseH, float ixbaseI, float iybaseI, float iChg) {
    iXposA = ixbaseA;
    iYposA = iybaseA;
    iXposB = ixsummitB;
    iYposB = iysummitB;
    iXposC = ixbaseC;
    iYposC = iybaseC;
    iXposD = ixbaseD;
    iYposD = iybaseD;
    iXposE = ixbaseE;
    iYposE = iybaseE;
    iXposF = ixbaseF;
    iYposF = iybaseF;
    iXposG = ixbaseG;
    iYposG = iybaseG;
    iXposH = ixbaseH;
    iYposH = iybaseH;
    iXposI = ixbaseI;
    iYposI = iybaseI;
    iChange = iChg;
  }

  void update() {
  } 

  void display() {
    stroke(140);
    fill(255);
    beginShape();
    vertex(iXposA, iYposA);
    vertex(iXposB, iYposB+((iYposA-iYposB)*2)+(iChange));
    vertex(iXposC, iYposC+((iYposA-iYposC)*2)+(iChange));
    vertex(iXposD, iYposD+((iYposA-iYposD)*2)+(iChange));
    vertex(iXposE, iYposE+((iYposA-iYposE)*2)+(iChange));
    vertex(iXposF, iYposF+((iYposA-iYposF)*2)+(iChange));
    vertex(iXposG, iYposG+((iYposA-iYposG)*2)+(iChange));
    vertex(iXposH, iYposH+((iYposA-iYposH)*2)+(iChange));
    vertex(iXposI, iYposI);
    endShape(CLOSE);
    
    noStroke();
    fill(0);
    beginShape();
    vertex(iXposA+4, iYposA);
    vertex(iXposB+7, iYposB+((iYposA-iYposB)*2)+3+(iChange));
    vertex(iXposC+3, iYposC+((iYposA-iYposC)*2)+(iChange));
    vertex(iXposD+3, iYposD+((iYposA-iYposD)*2)+(iChange));
    vertex(iXposE, iYposE+((iYposA-iYposE)*2)-5+(iChange));
    vertex(iXposF-7, iYposF+((iYposA-iYposF)*2)+2+(iChange));
    vertex(iXposG-3, iYposG+((iYposA-iYposG)*2)+2+(iChange));
    vertex(iXposH-5, iYposH+((iYposA-iYposH)*2)+(iChange));
    vertex(iXposI-2, iYposI);
    endShape(CLOSE);
    
    stroke(255);
    // LINEA QUEBRADA (serie de 3)
    line(iXposA, iYposA, iXposA+40, iYposA+20-(3));
    line(iXposA+40, iYposA+20-(3), iXposG-40, iYposG+((iYposA-iYposG)*2)-20+(iChange));
    line(iXposG-40, iYposG+((iYposA-iYposG)*2)-20+(iChange), iXposG, iYposG+((iYposA-iYposG)*2)+(iChange));
    
    // LINEA UNICA 1
    line(iXposA, iYposA, iXposF-7+(5), iYposF+((iYposA-iYposF)*2)+2+(3)+(iChange));
    
    // LINEA UNICA 2
    line(iXposD+3, iYposD+((iYposA-iYposD)*2)+(iChange), iXposF-7+(5), iYposF+((iYposA-iYposF)*2)+2+(3)+(iChange));
 
    
  }
}

