import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class draft_003 extends PApplet {


// -------- Clases propias --------
Mount m1, m2, m3, m4, m5, m6, m7;
Iceberg ice1, ice2, ice3, ice4, ice5, ice6, ice7;

int offTrianX = 25;    // Con esto desplazo todos los triangulo en 25 pix en eje X para dejarlos centrados en canvas
int fondo = 255;

// Variaciones Montes
float chgMount01 = 40;
float chgMount02 = 25;
float chgMount03 = -10;
float chgMount04 = -20;
float chgMount05 = 0;
float chgMount06 = 10;
float chgMount07 = -10;

// Variaciones Icebergs
float chgIce01 = 0;
float chgIce02 = -20;
float chgIce03 = 40;
float chgIce04 = 0;
float chgIce05 = 20;
float chgIce06 = -10;
float chgIce07 = 0;

// -------- Librerias --------

ControlP5 cp5;



// -------- El Setup --------
public void setup() {
  size(1200, 700);
  //noLoop();
  // botones
  cp5 = new ControlP5(this);
  Group g1 = cp5.addGroup("menu")
    .setPosition(25, 42)
      .setBackgroundHeight(100)
        .setBackgroundColor(color(255, 0))
          ;
  g1.close();


  cp5.addButton("negro")
    .setValue(1)
      .setPosition(0, 25)
        .setSize(70, 19)
          .setGroup(g1)
            ;

  cp5.addButton("blanco")  // El boton que est\u00e1 m\u00e1s abajo en l\u00ednea de c\u00f3digo, parte autom\u00e1ticamente
    .setValue(0)           // Por eso importante, dejar ac\u00e1 el que se quiere sea "por defecto"
      .setPosition(0, 5)
        .setSize(70, 19)
          .setGroup(g1)
            ;


  // the Mounts (tercer y cuerto valor dan el "pick" del monte)
  m1 = new Mount(225+(offTrianX)+(0), 350, 235+(offTrianX)+(0), 330, 250+(offTrianX)+(0), 310, 256+(offTrianX)+(0), 290, 275+(offTrianX)+(0), 270, 305+(offTrianX)+(0), 300, 310+(offTrianX)+(0), 320, 320+(offTrianX)+(0), 330, 325+(offTrianX)+(0), 350, chgMount01);
  m2 = new Mount(225+(offTrianX)+(100), 350, 235+(offTrianX)+(100), 330, 250+(offTrianX)+(100), 310, 256+(offTrianX)+(100), 290, 275+(offTrianX)+(100), 270, 305+(offTrianX)+(100), 300, 310+(offTrianX)+(100), 320, 320+(offTrianX)+(100), 330, 325+(offTrianX)+(100), 350, chgMount02);
  m3 = new Mount(225+(offTrianX)+(200), 350, 235+(offTrianX)+(200), 330, 250+(offTrianX)+(200), 310, 256+(offTrianX)+(200), 290, 275+(offTrianX)+(200), 270, 305+(offTrianX)+(200), 300, 310+(offTrianX)+(200), 320, 320+(offTrianX)+(200), 330, 325+(offTrianX)+(200), 350, chgMount03);
  m4 = new Mount(225+(offTrianX)+(300), 350, 235+(offTrianX)+(300), 330, 250+(offTrianX)+(300), 310, 256+(offTrianX)+(300), 290, 275+(offTrianX)+(300), 270, 305+(offTrianX)+(300), 300, 310+(offTrianX)+(300), 320, 320+(offTrianX)+(300), 330, 325+(offTrianX)+(300), 350, chgMount04);
  m5 = new Mount(225+(offTrianX)+(400), 350, 235+(offTrianX)+(400), 330, 250+(offTrianX)+(400), 310, 256+(offTrianX)+(400), 290, 275+(offTrianX)+(400), 270, 305+(offTrianX)+(400), 300, 310+(offTrianX)+(400), 320, 320+(offTrianX)+(400), 330, 325+(offTrianX)+(400), 350, chgMount05);
  m6 = new Mount(225+(offTrianX)+(500), 350, 235+(offTrianX)+(500), 330, 250+(offTrianX)+(500), 310, 256+(offTrianX)+(500), 290, 275+(offTrianX)+(500), 270, 305+(offTrianX)+(500), 300, 310+(offTrianX)+(500), 320, 320+(offTrianX)+(500), 330, 325+(offTrianX)+(500), 350, chgMount06);
  m7 = new Mount(225+(offTrianX)+(600), 350, 235+(offTrianX)+(600), 330, 250+(offTrianX)+(600), 310, 256+(offTrianX)+(600), 290, 275+(offTrianX)+(600), 270, 305+(offTrianX)+(600), 300, 310+(offTrianX)+(600), 320, 320+(offTrianX)+(600), 330, 325+(offTrianX)+(600), 350, chgMount07);

  // the Icebergs (quinto y sexto valor dan el "pick" del iceberg)
  ice1 = new Iceberg(225+(offTrianX)+(0), 350, 235+(offTrianX)+(0), 330, 250+(offTrianX)+(0), 310, 256+(offTrianX)+(0), 290, 275+(offTrianX)+(0), 270, 305+(offTrianX)+(0), 300, 310+(offTrianX)+(0), 320, 320+(offTrianX)+(0), 330, 325+(offTrianX)+(0), 350, chgIce01);
  ice2 = new Iceberg(225+(offTrianX)+(100), 350, 235+(offTrianX)+(100), 330, 250+(offTrianX)+(100), 310, 256+(offTrianX)+(100), 290, 275+(offTrianX)+(100), 270, 305+(offTrianX)+(100), 300, 310+(offTrianX)+(100), 320, 320+(offTrianX)+(100), 330, 325+(offTrianX)+(100), 350, chgIce02);
  ice3 = new Iceberg(225+(offTrianX)+(200), 350, 235+(offTrianX)+(200), 330, 250+(offTrianX)+(200), 310, 256+(offTrianX)+(200), 290, 275+(offTrianX)+(200), 270, 305+(offTrianX)+(200), 300, 310+(offTrianX)+(200), 320, 320+(offTrianX)+(200), 330, 325+(offTrianX)+(200), 350, chgIce03);
  ice4 = new Iceberg(225+(offTrianX)+(300), 350, 235+(offTrianX)+(300), 330, 250+(offTrianX)+(300), 310, 256+(offTrianX)+(300), 290, 275+(offTrianX)+(300), 270, 305+(offTrianX)+(300), 300, 310+(offTrianX)+(300), 320, 320+(offTrianX)+(300), 330, 325+(offTrianX)+(300), 350, chgIce04);
  ice5 = new Iceberg(225+(offTrianX)+(400), 350, 235+(offTrianX)+(400), 330, 250+(offTrianX)+(400), 310, 256+(offTrianX)+(400), 290, 275+(offTrianX)+(400), 270, 305+(offTrianX)+(400), 300, 310+(offTrianX)+(400), 320, 320+(offTrianX)+(400), 330, 325+(offTrianX)+(400), 350, chgIce05);
  ice6 = new Iceberg(225+(offTrianX)+(500), 350, 235+(offTrianX)+(500), 330, 250+(offTrianX)+(500), 310, 256+(offTrianX)+(500), 290, 275+(offTrianX)+(500), 270, 305+(offTrianX)+(500), 300, 310+(offTrianX)+(500), 320, 320+(offTrianX)+(500), 330, 325+(offTrianX)+(500), 350, chgIce06);
  ice7 = new Iceberg(225+(offTrianX)+(600), 350, 235+(offTrianX)+(600), 330, 250+(offTrianX)+(600), 310, 256+(offTrianX)+(600), 290, 275+(offTrianX)+(600), 270, 305+(offTrianX)+(600), 300, 310+(offTrianX)+(600), 320, 320+(offTrianX)+(600), 330, 325+(offTrianX)+(600), 350, chgIce07);
}

// -------- El Draw --------
public void draw() {
  background(fondo);

  superMenu();  // Barras de menu general (superior e inferior)
  //contextMenu(); // Men\u00fa contextual

  // Montes (triangulos no dinamicos aun)
  m1.update();
  m1.display();

  m2.update();
  m2.display();

  m3.update();
  m3.display();

  m4.update();
  m4.display();

  m5.update();
  m5.display();

  m6.update();
  m6.display();

  m7.update();
  m7.display();

  // Icebergs (vertex no dinamicos aun)
  ice1.update();
  ice1.display();

  ice2.update();
  ice2.display();

  ice3.update();
  ice3.display();

  ice4.update();
  ice4.display();

  ice5.update();
  ice5.display();

  ice6.update();
  ice6.display();

  ice7.update();
  ice7.display();

  // Linea mitad
  stroke(150);
  line(225, 350, 975, 350);


  // Icebergs
  stroke(90);
  fill(0, 70);

  //  beginShape();                  // Iceberg 01
  //  vertex(225+(offTrianX), 350);
  //  vertex(325+(offTrianX), 350);
  //  vertex(275+(offTrianX), 475);  // Punto Inferior
  //  vertex(255+(offTrianX), 400);
  //  vertex(245+(offTrianX), 400);
  //  endShape(CLOSE);


  // Puntos "mar"
  stroke(0); // Negros
  for (int i = 225; i <= 975; i += 10) {
    for (int j = 360; j <= 575; j += 10) {
      point(i+random(1, 10), j+random(1, 10));
    }
  }
  stroke(255); // Blancos
  for (int i = 225; i <= 975; i += 10) {
    for (int j = 360; j <= 575; j += 10) {
      point(i+random(1, 10), j+random(1, 10));
    }
  }
}

// -------- Funciones --------
public void superMenu() {
  stroke(214);
  line(21, 21, width-21, 21);
  line(21, height-21, width-21, height-21);
}

//void contextMenu() {
//  
//}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println("got an event from group "
      +theEvent.getGroup().getName()
      +", isOpen? "+theEvent.getGroup().isOpen()
      );
  } 
  else if (theEvent.isController()) {
    println("got something from a controller "
      +theEvent.getController().getName()
      );
  }
}

public void blanco(int theValue) {
  println("a button event from blanco: "+theValue);
  fondo = 255;
}

public void negro(int theValue) {
  println("a button event from negro: "+theValue);
  fondo = 0;
}


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

  public void update() {
  } 

  public void display() {
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

  public void update() {
  } 

  public void display() {
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "draft_003" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
