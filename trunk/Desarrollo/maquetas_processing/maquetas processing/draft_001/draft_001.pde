import controlP5.*;
ControlP5 cp5;
ControlP5 cp5Medio;
ControlP5 cp5Perfil;
int offTrianX = 25;    // Con esto desplazo todos los triangulo en 25 pix en eje X para dejarlos centrados en canvas
PFont f;
XML tags,name;
XML[] categorias, perfiles, personas, rss,time ;
Mount politica, economia, espectaculo, deporte, internacional, cultura, otro;
Iceberg ice1, ice2, ice3, ice4, ice5, ice6, ice7;
int politicas, economias, espectaculos, deportes, internacionals, culturas, otros;
int ice1s, ice2s, ice3s, ice4s, ice5s, ice6s, ice7s;

int polBel=350, polCom=350, polAmb=350, polOpt=350;
int ecoBel=350, ecoCom=350, ecoAmb=350, ecoOpt=350;
int espBel=350, espCom=350, espAmb=350, espOpt=350;
int depBel=350, depCom=350, depAmb=350, depOpt=350;
int intBel=350, intCom=350, intAmb=350, intOpt=350;
int culBel=350, culCom=350, culAmb=350, culOpt=350;
int otrBel=350, otrCom=350, otrAmb=350, otrOpt=350;
int start  =0;
Utils util = null;
ListBox  g3,g1,g2; 
Builder build;


//PerfilListener perfilListener;


HashMap<String,Integer> hashCategorias = null;
HashMap<String,String> hashPerfiles=null;
String menuInicialSelected = "";
void setup() {
    
  size(1200, 800);
  f = createFont("Arial", 12, true);
  tags = loadXML("xml_rss.xml", "UTF-8");  
  categorias = tags.getChildren("categorias/data");
  personas = tags.getChildren("persons/person");
  rss = tags.getChildren("rss/data");
  perfiles = tags.getChildren("perfiles/data");
 
  Logic.loadPerfiles(perfiles);
  
  /*TAGS DE TIEMPOS */
  time = tags.getChildren("time");  
  util = new Utils();
  if(util.saveRss(rss, time, categorias) ) {
    /*SE ACTUALIZA XML SOLO SI HA CUMPLIDO EL TIEMPO DE ESPERA*/  
    saveXML(tags, "data/xml_rss.xml");
  }
  
  /*BUSCA MATCH*/
  //XML[] categorias, XML[] rss
  /*SE CARGA MAPA CON LOS CONTADORES DE CATEGORIAS*/
  hashCategorias = util.matching(categorias, rss);
  politicas= (hashCategorias.get("Política")==null)?350:hashCategorias.get("Política");
  economias= (hashCategorias.get("Economía")==null)?350:hashCategorias.get("Economía");
  espectaculos= (hashCategorias.get("Espectáculos")==null)?350:hashCategorias.get("Espectáculos");
  deportes= (hashCategorias.get("Deportes")==null)?350:hashCategorias.get("Deportes");
  internacionals= (hashCategorias.get("Internacional")==null)?350:hashCategorias.get("Internacional");
  culturas= (hashCategorias.get("Cultura")==null)?350:hashCategorias.get("Cultura");
  otros= (hashCategorias.get("Otros")==null)?350:hashCategorias.get("Otros");
  /*
  politica = new Mount(225+(offTrianX), 350, 275+(offTrianX), politicas, 325+(offTrianX), 350);
  economia = new Mount(325+(offTrianX), 350, 375+(offTrianX), economias, 425+(offTrianX), 350);
  espectaculo = new Mount(425+(offTrianX), 350, 475+(offTrianX), espectaculos, 525+(offTrianX), 350);
  deporte = new Mount(525+(offTrianX), 350, 575+(offTrianX), deportes, 625+(offTrianX), 350);
  internacional = new Mount(625+(offTrianX), 350, 675+(offTrianX), internacionals, 725+(offTrianX), 350);
  cultura = new Mount(725+(offTrianX), 350, 775+(offTrianX), culturas, 825+(offTrianX), 350);
  otro = new Mount(825+(offTrianX), 350, 875+(offTrianX), otros, 925+(offTrianX), 350);
  */
  
  

  /*
  ice1s= (hashCategorias.get("Política")==null)?350:hashCategorias.get("Política");
  ice2s= (hashCategorias.get("Economía")==null)y ad?350:hashCategorias.get("Economía");
  ice3s= (hashCategorias.get("Espectáculos")==null)?350:hashCategorias.get("Espectáculos");
  ice4s= (hashCategorias.get("Deportes")==null)?350:hashCategorias.get("Deportes");
  ice5s= (hashCategorias.get("Internacional")==null)?350:hashCategorias.get("Internacional");
  ice6s= (hashCategorias.get("Cultura")==null)?350:hashCategorias.get("Cultura");
  ice7s= (hashCategorias.get("Otros")==null)?350:hashCategorias.get("Otros");
  */
  
  
  
  build = new Builder();  
  loadMenuInicial();
  loadMenuPerfiles();
  loadMenuCategorias();
}

void draw() {
  background(255);
   //superMenu();  // Barras de menu general (superior e inferior)
  // Triangulos (no dinamicos)
  stroke(90);  // color de lineav
  build.loadTriangles(politicas, economias, espectaculos,deportes, internacionals, culturas, otros);
  
  
  
  
  /*
  politica.update();
  politica.display();
  
  economia.update();
  economia.display();

  espectaculo.update();
  espectaculo.display();

  deporte.update();
  deporte.display();

  internacional.update();
  internacional.display();

  cultura.update();
  cultura.display();

  otro.update();
  otro.display();
  */
  
  build.loadLines();

  // Linea mitad
  stroke(150);
  line(225, 350, 975, 350);
  
  //TEXTOS
  textFont(f);
  fill(0);
  //text("Política" ,280,120);
  //text("Deportes" ,380,120);
  //text("Economía" ,480,120);
  
  // Icebergs
  stroke(90);
  fill(0, 70);
  
  
  build.loadIcebergPolitica(polBel,polCom,polAmb,polOpt);
  build.loadIcebergEconomia(ecoBel,ecoCom, ecoAmb, ecoOpt);
  build.loadIceberEspectaculo(espBel, espCom, espAmb,espOpt);
  build.loadIceberDeporte(depBel,depCom,depAmb,depOpt);
  build.loadIceberInternacional(intBel, intCom,intAmb,intOpt);
  build.loadIcebergCultura(culBel,culCom,culAmb,culOpt);
  build.loadIcebergOtro(otrBel,otrCom,otrAmb, otrOpt);
  


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

void loadMenuInicial() {
  cp5 = new ControlP5(this);
  g1 = cp5.addListBox("Principal")
        .setPosition(25,42)
        .setBackgroundHeight(100)
        .setBackgroundColor(color(255,50))
        ;
  g1.actAsPulldownMenu(true);
  
  //g1.captionLabel().set("Emol");    
  g1.close();
  //build.loadGroup(g1, rss);
  build.loadList(g1, rss);  
  g1.setValue(0);
}

void loadMenuCategorias() {
    cp5Medio = new ControlP5(this);
    g3 = cp5Medio.addListBox("Categorias").setPosition(140,280);
    g3.setItemHeight(15);
    g3.setBarHeight(15);
    g3.actAsPulldownMenu(true);
    g3.captionLabel().toUpperCase(true);
    g3.captionLabel().style().marginTop = 3;
    g3.valueLabel().style().marginTop = 3; // the +/- sign
    g3.close();
    build.loadList(g3, categorias);
    g3.setValue(0);
}

void loadMenuPerfiles() {
    cp5Perfil = new ControlP5(this);
    g2 = cp5Perfil.addListBox("Perfil")
      .setPosition(140,360)
      .setBackgroundHeight(100)
      .setBackgroundColor(color(255,50))
      ;
      g2.actAsPulldownMenu(true);
      g2.close();
    build.loadList(g2, perfiles);
    g2.setValue(0);
}

/*
  AREA DE LISTENERS
*/
void controlEvent(ControlEvent theEvent) {
  if( "Perfil".equals(theEvent.group().name()) ) {
     //println("Es el grupo del perfil");
     //println(g2.getCaptionLabel().getText() );
     //matchingPerfiles(categorias, perfiles,g2.getCaptionLabel().getText(),  menuInicialSelected);
     cargaPerfiles(g2.getCaptionLabel().getText(),"" );
     
  } else if("Categorias".equals(theEvent.group().name()) ) {
    //println("Es el grupo del perfil");
    //println(g3.getCaptionLabel().getText() );
    
  } else if("Principal".equals(theEvent.group().name())) {
    //println("Es el grupo del Menu principal");
    menuInicialSelected = g1.getCaptionLabel().getText();
    //println(g1.getCaptionLabel().getText() );
    if(start == 1 ) {
       cargaPerfiles(g2.getCaptionLabel().getText(),"" );    
    }
    start = 1;
    
  }
}

void cargaPerfiles(String nombrePerfil, String nombreCategoria) {
    /*SE CARGA MAPA CON LOS CONTADORES DE PERFILES*/
  //hashPerfiles = util.matchingPerfiles(categorias, perfiles, rss);
  //HashMap<String,String> matchingPerfiles(XML[] categorias, XML[] perfil, String perfilName, String rssName) 
  hashPerfiles = util.matchingPerfiles(categorias, perfiles, nombrePerfil, menuInicialSelected); 
  String[] aPol = hashPerfiles.get("Política").split(",");
  String[] aEco = hashPerfiles.get("Economía").split(",");
  String[] aEsp = hashPerfiles.get("Espectáculos").split(",");
  String[] aDep = hashPerfiles.get("Deportes").split(",");
  String[] aInt = hashPerfiles.get("Internacional").split(",");
  String[] aCul = hashPerfiles.get("Cultura").split(",");
  String[] aOtro = hashPerfiles.get("Otros").split(",");
  polBel= int(aPol[0]);
  polCom=int(aPol[1]);
  polAmb=int(aPol[2]);
  polOpt=int(aPol[3]);
  
  ecoBel=int(aEco[0]);
  ecoCom=int(aEco[1]);
  ecoAmb=int(aEco[2]);
  ecoOpt=int(aEco[3]);
  
  espBel=int(aEsp[0]);
  espCom=int(aEsp[1]);
  espAmb=int(aEsp[2]);
  espOpt=int(aEsp[3]);
  
  depBel=int(aDep[0]);
  depCom=int(aDep[1]);
  depAmb=int(aDep[2]);
  depOpt=int(aDep[3]);
  
  
  intBel=int(aInt[0]);
  intCom=int(aInt[1]);
  intAmb=int(aInt[2]);
  intOpt=int(aInt[3]);
  
  culBel=int(aCul[0]);
  culCom=int(aCul[1]);
  culAmb=int(aCul[2]);
  culOpt=int(aCul[3]);
  
  otrBel=int(aOtro[0]);
  otrCom=int(aOtro[1]);
  otrAmb=int(aOtro[2]);
  otrOpt=int(aOtro[3]);  
  
}

void keyPressed() {
  if(key==' ') {
    //cp5.group("g1").remove();
    println("Tecla Presionada" + key);
  }
}
