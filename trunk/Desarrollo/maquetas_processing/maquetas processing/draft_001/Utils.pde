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
            //saveToFileStringsFromXMl(xmlNode);
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
                 //saveToFileStringsFromXMl(xmlNode);
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
      //XML[] files=null;
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
                          //logger("---> " + xmlStr[i] + " ----> " + word);
                          //println("Size = " + m.length);
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
  
  HashMap<String,Integer> matching(XML[] categorias, XML[] rss) {
      HashMap hash = new HashMap();
      XML[] files = null;
      XML catWords = null, catName=null, data=null;
      String[] strings = null;
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
          links = 350 -links;
          hash.put(catName.getContent(), links );          
      }
      
      return hash;
  }
  
  HashMap<String,String> matchingPerfiles(XML[] categorias, XML[] perfil, String perfilName, String rssName) {
      HashMap hash = new HashMap();
      XML wordsBeligerante = null,wordsComplaciente = null,wordsAmbiguo = null,wordsOptimista = null, catName = null, namePerfil=null, data=null, rss=null, words=null, wordsSelected=null;
      String[] strings = null, sacoPalabras=null;
      int beligerante=350, complaciente=350, ambiguo=350, optimista=350, total=350;
      logger("Se inicia busqueda de palabras");
      /*
      for(int x=0; x<categorias.length; x++) {
          catName = categorias[x].getChild("name");
          logger("--> " + categoriaName + " ---> " + catName.getContent() );
          if(categoriaName.equals(catName.getContent())) {
              files =  cetegorias[x].getChild("files");
              break;
          }
      }
      */
      for(int x=0; x<perfil.length; x++) {
          namePerfil = perfil[x].getChild("name");
          logger("--> " + perfilName + " ---> " + namePerfil.getContent() );
          if(perfilName.equals(namePerfil.getContent())) {
              logger("Encontrado");
              words = perfil[x].getChild("words");
              break;
          }
      }
      
      if(words != null ) {
        sacoPalabras = words.getContent().split(",");
        for(int x=0; x<categorias.length; x++) { //ITERO LAS CATEGORIAS
            total = 350;
            catName = categorias[x].getChild("name");
            XML[] files =  categorias[x].getChild("files").getChildren("rss");
            for(int y=0; y<files.length; y++) { //ITERO LOS RSS     
                if((rssName.replace(" ", "_") + ".xml").equals(files[y].getContent())) {    
                    logger("Cargando... " + "data/rss/" + catName.getContent() + "/" + files[y].getContent() );       
                    strings = loadStrings("data/rss/" + catName.getContent() + "/" + files[y].getContent()); //Cargo Strings para comparar              
                    for(int k = 0; k<strings.length; k++) { //ITERO EL CONTENIDO DEL ARRAY DE STRINGS                    
                       for(int f=0; f< sacoPalabras.length; f++) { //ITERO LAS PALABRAS DEL PERFIL SELECCIONADO         
                              //logger(strings[k] + " --> " + sacoPalabras[f].trim() );   
                              String[] aBeligerante = match(strings[k], sacoPalabras[f].trim() );
                              if (aBeligerante != null) {
                                 logger("Encontrado ...... ");
                                 ambiguo = ambiguo + 1;
                                 complaciente = complaciente+1;
                                 break;
                              }
                       }
                    }
                }
             }
             String r = beligerante + "," + complaciente + "," + ambiguo + "," + optimista;
             logger(catName.getContent() + " --> " + r);
             hash.put(catName.getContent().trim(), r );       
             beligerante=350; 
             complaciente=350;
             ambiguo=350;
             optimista=350;
             total=350;
        }
      } else {
        logger("Perfil no encontrado :::::> " + perfilName);
      }
      
      /*
      for(int x=0; x<categorias.length; x++) { //ITERO LAS CATEGORIAS
        catName = categorias[x].getChild("name");
        logger("CATEGORIA :" + catName.getContent());
        wordsBeligerante = perfil[0].getChild("words");
        wordsComplaciente = perfil[1].getChild("words");
        wordsAmbiguo = perfil[2].getChild("words");
        wordsOptimista = perfil[3].getChild("words");
        
        String[] array = wordsBeligerante.getContent().split(",");
        String[] arrayComplaciente = wordsComplaciente.getContent().split(",");
        String[] arrayAmbiguo = wordsAmbiguo.getContent().split(",");
        String[] arrayOptimista = wordsOptimista.getContent().split(",");
        
        for(int j=0; j<rss.length; j++) { //ITERO LOS RSS
           data = rss[j].getChild("name");  
           logger("en RSS: " + data.getContent() );
           strings = loadStrings("data/rss/" + data.getContent() + ".xml");
           for(int k = 0; k<strings.length; k++) { //ITERO EL CONTENIDO DEL RSS                    
               for(int f=0; f< array.length; f++) { //ITERO LAS PALABRAS DE LOS PERFILES 
                  String[] aBeligerante = match(strings[k], array[f].trim() );
                  if (aBeligerante != null){     
                    beligerante = beligerante + 1;
                  }
               }
               for(int f=0; f< arrayComplaciente.length; f++) { //ITERO LAS PALABRAS DE LOS PERFILES 
                  String[] aComplaciente = match(strings[k], arrayComplaciente[f].trim() );
                  if (aComplaciente != null){     
                    complaciente = complaciente + 1;
                  }
              }
              for(int f=0; f< arrayAmbiguo.length; f++) { //ITERO LAS PALABRAS DE LOS PERFILES 
                  String[] aAmbiguo = match(strings[k], arrayAmbiguo[f].trim() );
                  if (aAmbiguo != null){     
                    ambiguo = ambiguo + 1;
                  }
              }
              for(int f=0; f< arrayOptimista.length; f++) { //ITERO LAS PALABRAS DE LOS PERFILES 
                  String[] aOptimista = match(strings[k], arrayOptimista[f].trim() );
                  if (aOptimista != null){     
                    optimista = optimista + 1;
                  }
              }  
           }
        }
        String r = beligerante + "," + complaciente + "," + ambiguo + "," + optimista;
        logger(catName.getContent() + " --> " + r);
        hash.put(catName.getContent().trim(), r );       
        beligerante=350; 
        complaciente=350;
        ambiguo=350;
        optimista=350;
        total=0;
      }
      */
      return hash;
  }
}
