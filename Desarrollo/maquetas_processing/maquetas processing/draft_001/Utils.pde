class Utils {

  void logger(String message) {
      println(message);
  }
      
  boolean saveRss(XML[] xmlNode, XML[] time, XML[] categorias) {
    boolean reponse = false;
    XML minute = time[0].getChild("minute");
    XML hour = time[0].getChild("hour");
    XML day = time[0].getChild("day");
    XML month = time[0].getChild("month");
    XML year = time[0].getChild("year");
    XML diff = time[0].getChild("diff");
    XML desc = time[0].getChild("desc");
    XML internet = time[0].getChild("internet");
    String xmlTime = day.getContent() + "-" + month.getContent()+ "-" + year.getContent() + "_" + hour.getContent() + "_" + minute.getContent();
    logger(" time ---> " + xmlTime);
    if(!"false".equals(internet.getContent()) ) {
        if("".equals(xmlTime.replace("-", "").replace("_", "") )) {   
           logger("No se ha buscado informacion desde los rss");     
            minute.setContent(minute() +"" );
            hour.setContent(hour()+"");
            day.setContent(day()+"");  
            month.setContent(month()+"" );
            year.setContent(year()+"");   
            logger("Actualizando rss");
            saveToFileStringsFromXMl(xmlNode, categorias);                    
            reponse = true;    
        } else {
           int intMinute = int(minute.getContent());
           int intHour = int(hour.getContent());
           int intDay = int(day.getContent());
           int intMonth = int(month.getContent());
           int intYear = int(year.getContent() );
           if(day() == intDay && hour() == intHour && minute() == intMinute) {
               logger("No debo buscar actualizaciones");
           } else if(day() == intDay && hour()== intHour && minute() != intMinute ) {
               logger("Minutos son distinto, validando si debo actualizar rss");
               intMinute = intMinute + int(diff.getContent());
               if(minute() >= intMinute) {
                   logger("Debo actualizar rss");
                   //saveToFileStringsFromXMl(xmlNode);
                   saveToFileStringsFromXMl(xmlNode, categorias);
                   logger("Fin actualizacion rss");   
                   logger("Actualizando datos time XML");
                   minute.setContent(minute() + "");
                   hour.setContent(hour()+ "");
                   day.setContent(day()+ "");  
                   month.setContent(month() + "");
                   year.setContent(year()+ "");    
                   reponse = true;              
               } else {
                 logger("No debo actualizar rss");
               }
               
           } else {
               logger("Debo actualizar rss");
               saveToFileStringsFromXMl(xmlNode, categorias);
               logger("Fin actualizacion rss");   
               logger("Actualizando datos time XML");
               minute.setContent(minute()+ "");
               hour.setContent(hour()+ "");
               day.setContent(day()+ "");  
               month.setContent(month()+ "" );
               year.setContent(year()+ "");
               reponse = true;
           }
        }
    }
    return reponse; 
  }
  
  void saveToFileStringsFromXMl(XML[] xmlNode) {
      String[] xmlStr = null;
      XML url = null, name = null;     
      for(int x=0; x<xmlNode.length; x++) {
          url = xmlNode[x].getChild("url");
          name = xmlNode[x].getChild("name");
          String urlContent = url.getContent();
          logger("Cargando rss ---> " + name.getContent());
          xmlStr = loadStrings(urlContent);            
          saveStrings("data/rss/" + name.getContent() + ".xml", xmlStr);                  
      }
  }
  
  void removeChilds(XML files, XML categoria) {
      XML[] childs = categoria.getChildren();
      for(int x=0; x<childs.length; x++) {
          XML xml = childs[x].getChild("rss");
          if(xml!=null)
            files.removeChild(xml);
      }
  }
  
  void saveToFileStringsFromXMl(XML[] xmlNode, XML[] categorias) {
      String[] xmlStr = null;
      XML url = null, name = null, cateName=null, cateWords=null, fileRss=null,fileRss2=null;     
      for(int x=0; x<xmlNode.length; x++) {
          url = xmlNode[x].getChild("url");
          name = xmlNode[x].getChild("name");
          String urlContent = url.getContent();
          logger("Cargando rss ---> " + name.getContent());
          xmlStr = loadStrings(urlContent);    
          for(int y=0; y<categorias.length; y++) {
              boolean perteneceAcategoria= false;
              cateName = categorias[y].getChild("name");
              cateWords = categorias[y].getChild("words");
              fileRss = categorias[y].getChild("files");
              //removeChilds(fileRss, categorias[y]);
              logger("Categoria ---> " + cateName.getContent() );
              String[] words = cateWords.getContent().split(",");
              for(int z=0; z<words.length; z++) {
                  String word = words[z];                  
                  for(int i=0; i<xmlStr.length; i++) {
                      String[] m = match(xmlStr[i], word);
                      if(m!= null) {
                          perteneceAcategoria = true;                              
                      }
                      if(perteneceAcategoria==true) break;
                      
                  }                 
                  if(perteneceAcategoria== true)  break;
                  
              }
              if(perteneceAcategoria== true) {
                  if(!"".equals(name.getContent()) ) {
                      XML newChild = fileRss.addChild("rss");
                      newChild.setContent(name.getContent().replace(" ","_") + ".xml");
                      saveStrings("data/rss/" + cateName.getContent() +"/" + name.getContent().replace(" ","_") + ".xml", xmlStr);
                  }
              }               
          }        
             
      }
  }
  
  
  boolean findText(String txt, String expresionRegular) {
      return false;
  }
  
  HashMap<String,Integer> matching(XML[] categorias, XML[] rss, String rssName) {
      HashMap hash = new HashMap();
      XML[] files = null;
      XML catWords = null, catName=null, data=null;
      String[] strings = null;
      logger("RSS NAME: " + rssName);
      for(int x=0; x<categorias.length; x++) {
          catWords = categorias[x].getChild("words");
          catName = categorias[x].getChild("name");
          files = categorias[x].getChildren("files");
          logger("Buscando categoria: " + catName.getContent());
          String[] words = catWords.getContent().split(",");
          int links = 0;
          for(int k=0; k< words.length; k++) {
              for(int i=0; i<files.length; i++) {
                 data = files[i].getChild("rss");    
                 if(catName.getContent() != null) {
                     if(data!=null) {
                       if((rssName.replace(" ", "_")+".xml").equals(data.getContent()) ) {
                           logger("RSS CATEGORIAS -> " + data.getContent());
                           strings = loadStrings("data/rss/" + catName.getContent() + "/" + data.getContent());                                
                           for(int j = 0; j<strings.length; j++) {
                              String[] m = match(strings[j], words[k] );                     
                              if (m != null){
                                links = links+1;
                              }
                           }
                       }
                     }
                 }
              }  
          }
          links = 350 -(links*8);
          hash.put(catName.getContent(), links );          
      }
      
      return hash;
  }  
  
  float[] matchingPerfilesPorCategoria(XML[] categorias, XML[] perfil, String perfilName, String rssName) {      
      float[] valoresMapeados = new float[categorias.length];
      XML wordsBeligerante = null,wordsComplaciente = null,wordsAmbiguo = null,wordsOptimista = null, catName = null, namePerfil=null, data=null, rss=null, words=null, wordsSelected=null;
      String[] strings = null, sacoPalabras=null;
      int[] palabrasPorCategoria = new int[categorias.length];
      int beligerante=350, complaciente=350, ambiguo=350, optimista=350, total=350;
      
      for(int x=0; x<perfil.length; x++) {
          namePerfil = perfil[x].getChild("name");
          if(perfilName.equals(namePerfil.getContent())) {
              logger("Perfil Encontrado");
              words = perfil[x].getChild("words");
              break;
          }
      }
      
      if(words != null ) {
        sacoPalabras = words.getContent().split(",");
        for(int x=0; x<categorias.length; x++) { //ITERO LAS CATEGORIAS
            total = 350;
            catName = categorias[x].getChild("name");
            palabrasPorCategoria[x] = 0;
            XML[] files =  categorias[x].getChild("files").getChildren("rss");
            for(int y=0; y<files.length; y++) { //ITERO LOS RSS     
                if((rssName.replace(" ", "_") + ".xml").equals(files[y].getContent())) {    
                    logger("Cargando... " + "data/rss/" + catName.getContent() + "/" + files[y].getContent() );       
                    strings = loadStrings("data/rss/" + catName.getContent() + "/" + files[y].getContent()); //Cargo Strings para comparar              
                    for(int k = 0; k<strings.length; k++) { //ITERO EL CONTENIDO DEL ARRAY DE STRINGS                    
                       for(int f=0; f< sacoPalabras.length; f++) { //ITERO LAS PALABRAS DEL PERFIL SELECCIONADO         
                            String[] palabrasEncontradas = match(strings[k], sacoPalabras[f].trim() );
                            if (palabrasEncontradas != null) {
                               palabrasPorCategoria[x] = palabrasPorCategoria[x]+palabrasEncontradas.length;
                            }
                       }
                    }
                }
             }
        }
       for(int t=0; t<palabrasPorCategoria.length; t++) {
         println("total Econtrados:"+palabrasPorCategoria[t]);
         if(palabrasPorCategoria[t] <= 400) { 
             valoresMapeados[t] = map(palabrasPorCategoria[t], 0, 400, 350, 700);
         } else {
           valoresMapeados[t] = map(palabrasPorCategoria[t], 0, 900, 350, 750);
         }              
       }
      } else {
        logger("Perfil no encontrado :::::D " + perfilName);
      }
      
      return valoresMapeados;
  }
}
