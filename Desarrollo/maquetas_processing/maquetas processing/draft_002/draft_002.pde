
// -------- Clases propias --------
Mount m1, m2, m3, m4, m5, m6, m7;
Iceberg ice1, ice2, ice3, ice4, ice5, ice6, ice7;

int offTrianX = 25;    // Con esto desplazo todos los triangulo en 25 pix en eje X para dejarlos centrados en canvas

// -------- Librerias --------
import controlP5.*;
ControlP5 cp5;



// -------- El Setup --------
void setup() {
  size(1200, 700);
  //noLoop();
  // botones
  cp5 = new ControlP5(this);
  Group g1 = cp5.addGroup("menu")
                .setPosition(25,42)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(255,50))
                ;
                g1.close();
  
  cp5.addButton("background")
     .setValue(0)
     .setPosition(0,5)
     .setSize(70,19)
     .setGroup(g1)
     ;
                  

  // the Mounts (tercer y cuerto valor dan el "pick" del monte)
  m1 = new Mount(225+(offTrianX), 350, 275+(offTrianX), 180, 325+(offTrianX), 350);
  m2 = new Mount(325+(offTrianX), 350, 375+(offTrianX), 220, 425+(offTrianX), 350);
  m3 = new Mount(425+(offTrianX), 350, 475+(offTrianX), 200, 525+(offTrianX), 350);
  m4 = new Mount(525+(offTrianX), 350, 575+(offTrianX), 250, 625+(offTrianX), 350);
  m5 = new Mount(625+(offTrianX), 350, 675+(offTrianX), 280, 725+(offTrianX), 350);
  m6 = new Mount(725+(offTrianX), 350, 775+(offTrianX), 310, 825+(offTrianX), 350);
  m7 = new Mount(825+(offTrianX), 350, 875+(offTrianX), 325, 925+(offTrianX), 350);

  // the Icebergs (quinto y sexto valor dan el "pick" del iceberg)
  ice1 = new Iceberg(225+(offTrianX), 350, 325+(offTrianX), 350, 275+(offTrianX), 475, 255+(offTrianX), 400, 245+(offTrianX), 400);
  ice2 = new Iceberg(325+(offTrianX), 350, 425+(offTrianX), 350, 375+(offTrianX), 420, 355+(offTrianX), 400, 345+(offTrianX), 400);
  ice3 = new Iceberg(425+(offTrianX), 350, 525+(offTrianX), 350, 475+(offTrianX), 430, 455+(offTrianX), 400, 445+(offTrianX), 400);
  ice4 = new Iceberg(525+(offTrianX), 350, 625+(offTrianX), 350, 575+(offTrianX), 390, 555+(offTrianX), 370, 545+(offTrianX), 370);
  ice5 = new Iceberg(625+(offTrianX), 350, 725+(offTrianX), 350, 675+(offTrianX), 390, 655+(offTrianX), 370, 645+(offTrianX), 370);
  ice6 = new Iceberg(725+(offTrianX), 350, 825+(offTrianX), 350, 775+(offTrianX), 380, 755+(offTrianX), 370, 745+(offTrianX), 370);
  ice7 = new Iceberg(825+(offTrianX), 350, 925+(offTrianX), 350, 875+(offTrianX), 390, 855+(offTrianX), 370, 845+(offTrianX), 370);
}

// -------- El Draw --------
void draw() {
  background(255);

  superMenu();  // Barras de menu general (superior e inferior)
  //contextMenu(); // Menú contextual

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
  stroke(0);
  for (int i = 225; i <= 975; i += 10) {
    for (int j = 360; j <= 575; j += 10) {
      point(i+random(1, 10), j+random(1, 10));
    }
  }
}

// -------- Funciones --------
void superMenu() {
  stroke(214);
  line(21, 21, width-21, 21);
  line(21, height-21, width-21, height-21);
}

//void contextMenu() {
//  
//}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    println("got an event from group "
            +theEvent.getGroup().getName()
            +", isOpen? "+theEvent.getGroup().isOpen()
            );
            
  } else if (theEvent.isController()){
    println("got something from a controller "
            +theEvent.getController().getName()
            );
  }
}

void keyPressed() {
  if(key==' ') {
    if(cp5.getGroup("g1")!=null) {
      cp5.getGroup("g1").remove();
    }
  }
}

