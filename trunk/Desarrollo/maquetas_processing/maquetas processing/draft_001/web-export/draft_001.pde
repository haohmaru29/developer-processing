int offTrianX = 25;    // Con esto desplazo todos los triangulo en 25 pix en eje X para dejarlos centrados en canvas

void setup() {
  size(1200, 700);
  noLoop();
}

void draw() {
  background(255);

  // Triangulos (no dinamicos)
  stroke(90);  // color de linea
  triangle(225+(offTrianX), 350, 275+(offTrianX), 180, 325+(offTrianX), 350);    // triangulo 01
  triangle(325+(offTrianX), 350, 375+(offTrianX), 220, 425+(offTrianX), 350);    // triangulo 02
  triangle(425+(offTrianX), 350, 475+(offTrianX), 200, 525+(offTrianX), 350);    // triangulo 03
  triangle(525+(offTrianX), 350, 575+(offTrianX), 250, 625+(offTrianX), 350);    // triangulo 04
  triangle(625+(offTrianX), 350, 675+(offTrianX), 280, 725+(offTrianX), 350);    // triangulo 05
  triangle(725+(offTrianX), 350, 775+(offTrianX), 310, 825+(offTrianX), 350);    // triangulo 06
  triangle(825+(offTrianX), 350, 875+(offTrianX), 325, 925+(offTrianX), 350);    // triangulo 07


  // Linea mitad
  stroke(150);
  line(225, 350, 975, 350);
  
  
  // Icebergs
  stroke(90);
  fill(0, 70);
  
  beginShape();                  // Iceberg 01
  vertex(225+(offTrianX), 350);
  vertex(325+(offTrianX), 350);
  vertex(275+(offTrianX), 475);  // Punto Inferior
  vertex(255+(offTrianX), 400);
  vertex(245+(offTrianX), 400);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 02
  vertex(325+(offTrianX), 350);
  vertex(425+(offTrianX), 350);
  vertex(375+(offTrianX), 420);  // Punto Inferior
  vertex(355+(offTrianX), 400);
  vertex(345+(offTrianX), 400);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 03
  vertex(425+(offTrianX), 350);
  vertex(525+(offTrianX), 350);
  vertex(475+(offTrianX), 430);  // Punto Inferior
  vertex(455+(offTrianX), 400);
  vertex(445+(offTrianX), 400);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 04
  vertex(525+(offTrianX), 350);
  vertex(625+(offTrianX), 350);
  vertex(575+(offTrianX), 390);  // Punto Inferior
  vertex(555+(offTrianX), 370);
  vertex(545+(offTrianX), 370);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 05
  vertex(625+(offTrianX), 350);
  vertex(725+(offTrianX), 350);
  vertex(675+(offTrianX), 390);  // Punto Inferior
  vertex(655+(offTrianX), 370);
  vertex(645+(offTrianX), 370);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 06
  vertex(725+(offTrianX), 350);
  vertex(825+(offTrianX), 350);
  vertex(775+(offTrianX), 380);  // Punto Inferior
  vertex(755+(offTrianX), 370);
  vertex(745+(offTrianX), 370);
  endShape(CLOSE);
  
  beginShape();                  // Iceberg 07
  vertex(825+(offTrianX), 350);
  vertex(925+(offTrianX), 350);
  vertex(875+(offTrianX), 390);  // Punto Inferior
  vertex(855+(offTrianX), 370);
  vertex(845+(offTrianX), 370);
  endShape(CLOSE);


  // Puntos "mar"
  stroke(0);
  for (int i = 225; i <= 975; i += 10) {
    for (int j = 360; j <= 575; j += 10) {
      point(i+random(1, 10), j+random(1, 10));
    }
  }
}


