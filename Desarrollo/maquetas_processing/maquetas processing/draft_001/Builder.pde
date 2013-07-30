class Builder {

    void loadTriangles(int politica, int economia, int espectaculo, 
        int deporte, int internacional, int cultura, int otro) {
      //350 es el minimo que puede tener
      triangle(225+(offTrianX), 350, 275+(offTrianX), politica, 325+(offTrianX), 350);    // triangulo 01
      triangle(325+(offTrianX), 350, 375+(offTrianX), economia, 425+(offTrianX), 350);    // triangulo 02  
      triangle(425+(offTrianX), 350, 475+(offTrianX), espectaculo, 525+(offTrianX), 350);    // triangulo 03
      triangle(525+(offTrianX), 350, 575+(offTrianX), deporte, 625+(offTrianX), 350);    // triangulo 04
      triangle(625+(offTrianX), 350, 675+(offTrianX), internacional, 725+(offTrianX), 350);    // triangulo 05
      triangle(725+(offTrianX), 350, 775+(offTrianX), cultura, 825+(offTrianX), 350);    // triangulo 06
      triangle(825+(offTrianX), 350, 875+(offTrianX), otro, 925+(offTrianX), 350);    // triangulo 07
    }
    
    void loadLines() {
      //izquierda inferior, alto linea, izquierda superior,   
      line(250, 480, 250, 100); //1ERA LINEA
      line(350, 480, 350, 100); //2DA LINEA
      line(450, 480, 450, 100); //3RA LINEA
      line(550, 480, 550, 100); //4TA LINEA
      line(650, 480, 650, 100); //5TA LINEA
      line(750, 480, 750, 100); //6TA LINEA
      line(850, 480, 850, 100); //8VA LINEA
    }
    
    void loadIcebergPolitica(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 01
      vertex(225+(offTrianX), 350);
      vertex(325+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(275+(offTrianX), complaciente);  // Punto Inferior      
      vertex(255+(offTrianX), ambiguo);
      vertex(245+(offTrianX), optimista);
      endShape(CLOSE);
    }
    
    void loadIcebergEconomia(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 02
      vertex(325+(offTrianX), 350);
      vertex(425+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(375+(offTrianX), complaciente);  // Punto Inferior
      vertex(355+(offTrianX), ambiguo);
      vertex(345+(offTrianX), optimista);
      endShape(CLOSE);
    }
    
    void loadIceberEspectaculo(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 03
      vertex(425+(offTrianX), 350);
      vertex(525+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(475+(offTrianX), complaciente);  // Punto Inferior
      vertex(455+(offTrianX), ambiguo);
      vertex(445+(offTrianX), optimista);
      endShape(CLOSE);
    }
    
    void loadIceberDeporte(int beligerante, int complaciente, int ambiguo, int optimista) {
       beginShape();                  // Iceberg 04
      vertex(525+(offTrianX), 350);
      vertex(625+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(575+(offTrianX), complaciente);  // Punto Inferior
      vertex(555+(offTrianX), ambiguo);
      vertex(545+(offTrianX), optimista);
      endShape(CLOSE);
    }
    
    void loadIceberInternacional(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 05
      vertex(625+(offTrianX), 350);
      vertex(725+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(675+(offTrianX), complaciente);  // Punto Inferior
      vertex(655+(offTrianX), ambiguo);
      vertex(645+(offTrianX), optimista);
      endShape(CLOSE);
    }
    
    void loadIcebergCultura(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 06
      vertex(725+(offTrianX), 350);
      vertex(825+(offTrianX), 350);
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      
      vertex(775+(offTrianX), complaciente);  // Punto Inferior
      vertex(755+(offTrianX), ambiguo);
      vertex(745+(offTrianX), optimista);
      endShape(CLOSE);
    
    }
    
    void loadIcebergOtro(int beligerante, int complaciente, int ambiguo, int optimista) {
      beginShape();                  // Iceberg 07
      vertex(825+(offTrianX), 350);
      vertex(925+(offTrianX), 350);
      
      if(complaciente>700){
        complaciente = 600 + (complaciente-700)/10;
      }
      if(optimista>700){
        optimista = 600 + (optimista-700)/10;
      }
      if(ambiguo>700){
        ambiguo = 600 + (ambiguo-700)/10;
      }
      vertex(875+(offTrianX), complaciente);  // Punto Inferior
      vertex(855+(offTrianX), optimista);
      vertex(845+(offTrianX), ambiguo);
      endShape(CLOSE);
    }
      
     
      
     
      
    void loadIceberg(float politica, float economia, float espectaculo, 
        float deporte, float internacional, float cultura, float otro) {        
        triangle(225+(offTrianX), 350, 275+(offTrianX), politica, 325+(offTrianX), 350);    // triangulo 01
        triangle(325+(offTrianX), 350, 375+(offTrianX), economia, 425+(offTrianX), 350);    // triangulo 02  
        triangle(425+(offTrianX), 350, 475+(offTrianX), espectaculo, 525+(offTrianX), 350);    // triangulo 03
        triangle(525+(offTrianX), 350, 575+(offTrianX), deporte, 625+(offTrianX), 350);    // triangulo 04
        triangle(625+(offTrianX), 350, 675+(offTrianX), internacional, 725+(offTrianX), 350);    // triangulo 05
        triangle(725+(offTrianX), 350, 775+(offTrianX), cultura, 825+(offTrianX), 350);    // triangulo 06
        triangle(825+(offTrianX), 350, 875+(offTrianX), otro, 925+(offTrianX), 350);    // triangulo 07
  
    }     
      
      
      
      
    
    
    void loadGroup(Group g1, XML[] medios) {
      for (int i = 0; i < medios.length; i++) {
        XML name = medios[i].getChild("name");
        XML id = medios[i].getChild("id");
        int catId = int(id.getContent());
        String catName = name.getContent();
        cp5.addButton(catName + "")
             .setPosition(10,20*i).setId(catId)
             .setSize(70,19).setGroup(g1)
             ;
      }
    }
    
    void loadList(ListBox l, XML[] medios) {
      for (int i = 0; i < medios.length; i++) {
        XML name = medios[i].getChild("name");
        XML id = medios[i].getChild("id");
        String catName = name.getContent();    
        ListBoxItem lbi = l.addItem(catName +"", i);
        lbi.setColorBackground(0xffff0000);    
      }
    }
}
