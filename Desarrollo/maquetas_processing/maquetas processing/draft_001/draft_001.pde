import controlP5.*;
ControlP5 cp5;
ControlP5 cp5Medio;
ControlP5 cp5Perfil;
int offTrianX = 25;    // Con esto desplazo todos los triangulo en 25 pix en eje X para dejarlos centrados en canvas
PFont f;
XML tags,name;
XML[] categorias, perfiles, personas, rss;
Group g1;
Group g2;
ListBox  g3; 
Builder build;

void setup() {
  size(1200, 700);
  f = createFont("Arial", 12, true);
  /*CARGA XML desde donde se leeran los RSS*/
  tags = loadXML("xml_rss.xml", "UTF-8");  
  categorias = tags.getChildren("categorias/data");
  personas = tags.getChildren("persons/person");
  rss = tags.getChildren("rss/data");
  perfiles = tags.getChildren("perfiles/data");
  Logic.loadPerfiles(perfiles);
  build = new Builder();
  cp5 = new ControlP5(this);
  g1 = cp5.addGroup("Medios")
        .setPosition(25,42)
        .setBackgroundHeight(100)
        .setBackgroundColor(color(255,50))
        ;
  g1.close();
  build.loadGroup(g1, rss);
}

void draw() {
  background(255);
  
  // Triangulos (no dinamicos)
  stroke(90);  // color de lineav
  build.loadTriangles(200,220,230,250,260,100,310);
  
  build.loadLines();

  // Linea mitad
  stroke(150);
  line(225, 350, 975, 350);
  
  //TEXTOS
  textFont(f);
  fill(0);
  text("Política" ,280,120);
  text("Deportes" ,380,120);
  text("Economía" ,480,120);
  
  // Icebergs
  stroke(90);
  fill(0, 70);
  build.loadIcebergs();
  


  // Puntos "mar"
  /*
  stroke(0);
  for (int i = 225; i <= 975; i += 10) {
    for (int j = 360; j <= 575; j += 10) {
      point(i+random(1, 10), j+random(1, 10));
    }
  }
  */
}


/*
  AREA DE LISTENERS
*/
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()){
    //ControlP5 cp5Perfil
    if(g2==null) {
      cp5Medio = new ControlP5(this);
      cp5.addListener(new ControlListener() {
          @Override          
          public void controlEvent(ControlEvent arg0) {          
             if(arg0.isController()){
                 println("Menu ----> " + arg0.controller().id());
             }
          
          }
      });
      g2 = cp5Medio.addGroup("Medios")
        .setPosition(140,260)
        .setBackgroundHeight(100)
        .setBackgroundColor(color(255,50))
        ;
        g2.close();
    }
    
    if(g3==null) {
      cp5Perfil = new ControlP5(this);
      g3 = cp5Perfil.addListBox("myList").setPosition(140,280);
      cp5Perfil.addListener(new ControlListener() {
          @Override          
          public void controlEvent(ControlEvent arg0) {          
             if(arg0.isController()){
                 println("Perfil -----> " + arg0.controller().id());
             }
          }
      });
        
      g3.setItemHeight(15);
      g3.setBarHeight(15);
      g3.actAsPulldownMenu(true);
      g3.captionLabel().toUpperCase(true);
      //g3.captionLabel().set("SELECT A NAME");
      g3.captionLabel().style().marginTop = 3;
      g3.valueLabel().style().marginTop = 3; // the +/- sign
      g3.close();
      Logic.printArray(Logic.hm.get("Beligerante"));
      build.loadList(g3, categorias);
    }
    
    if(theEvent.controller().id()==1) { //Politica
      g3.captionLabel().set("Politica");
    } else if(theEvent.controller().id()==2) { //Economia
      
    } else if(theEvent.controller().id()==3) { //Espectaculos
    
    } else if(theEvent.controller().id()==4) { //Deportes 
    
    } else if(theEvent.controller().id()==5) { //Internacional
    
    } else if(theEvent.controller().id()==6) { //Cultura
    
    } else {//OTROS
    
    }
    
  }
}


void keyPressed() {
  if(key==' ') {
    //cp5.group("g1").remove();
    println("Tecla Presionada" + key);
  }
}

