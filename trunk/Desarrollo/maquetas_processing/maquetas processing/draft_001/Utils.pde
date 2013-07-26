class Utils {

  void logger(String message) {
      println(message);
  }
    
  
  boolean saveRss(XML[] xmlNode, XML[] time) {
    boolean reponse = false;
    XML minute = time[0].getChild("minute");
    XML hour = time[0].getChild("hour");
    XML day = time[0].getChild("day");
    XML month = time[0].getChild("month");
    XML year = time[0].getChild("year");
    XML diff = time[0].getChild("diff");
    XML desc = time[0].getChild("desc");
    String xmlTime = day.getContent() + "-" + month.getContent()+ "-" + year.getContent() + "_" + hour.getContent() + "_" + minute.getContent();
    logger(" time ---> " + xmlTime);
    
    if("".equals(xmlTime.replace("-", "").replace("_", "") )) {   
       logger("No se ha buscado informacion desde los rss");     
        minute.setContent(minute() +"" );
        hour.setContent(hour()+"");
        day.setContent(day()+"");  
        month.setContent(month()+"" );
        year.setContent(year()+"");   
        logger("Actualizando rss");
        saveToFileStringsFromXMl(xmlNode);   
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
               saveToFileStringsFromXMl(xmlNode);
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
             saveToFileStringsFromXMl(xmlNode);
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
  
  boolean findText(String txt, String expresionRegular) {
      return false;
  }
  
  HashMap<String,Integer> matching(XML[] categorias, XML[] rss) {
      HashMap hash = new HashMap();
      XML catWords = null, catName=null, data=null;
      String[] strings = null;
      for(int x=0; x<categorias.length; x++) {
          catWords = categorias[x].getChild("words");
          catName = categorias[x].getChild("name");
          //logger("Buscando categoria: " + catName.getContent());
          String[] words = catWords.getContent().split(",");
          int links = 0;
          for(int k=0; k< words.length; k++) {
              //logger("Buscando palabra: " + words[k]);
              for(int i=0; i<rss.length; i++) {
                 data = rss[i].getChild("name");
                 //logger("en RSS: " + data.getContent() );
                 strings = loadStrings("data/rss/" + data.getContent() + ".xml");                                
                 for(int j = 0; j<strings.length; j++) {
                    String[] m = match(strings[j], words[k] );                     
                    if (m != null){
                      links = links+1;
                    }
                 }
              }  
          }
          links = 350 -links;
          hash.put(catName.getContent(), links );          
      }
      
      return hash;
  }
  
  HashMap<String,String> matchingPerfiles(XML[] categorias, XML[] perfil, XML[] rss) {
      HashMap hash = new HashMap();
      XML words = null, catName = null, perfilName=null, data=null;
      String[] strings = null;
      int beligerante=0, complaciente=0, ambiguo=0, optimista=0, total=0;

      for(int x=0; x<categorias.length; x++) { //ITERO LAS CATEGORIAS
        catName = categorias[x].getChild("name");
        logger("CATEGORIA :" + catName.getContent());
        for(int i=0; i<perfil.length; i++) { // ITERO LOS PERFILES
            words = perfil[i].getChild("words");
            perfilName = perfil[i].getChild("name");
            String[] array = words.getContent().split(",");
            logger("Perfil: " + perfilName.getContent() );                       
            for(int j=0; j<rss.length; j++) { //ITERO LOS RSS
               data = rss[j].getChild("name");  
               logger("en RSS: " + data.getContent() );
               strings = loadStrings("data/rss/" + data.getContent() + ".xml");
               for(int k = 0; k<strings.length; k++) { //ITERO EL CONTENIDO DEL RSS
                  for(int f=0; f< array.length; f++) { //ITERO LAS PALABRAS DE LOS PERFILES
                      String[] m = match(strings[k], array[f].trim() );                     
                      if (m != null){
                        total = total + 1;
                      }
                  }  
               }
            }
            
            logger("Perfil: " + perfilName.getContent() + "total: " + total);                  
            if("Beligerante".equals(perfilName.getContent())) {
              beligerante = total;
            } else if("Complaciente".equals(perfilName.getContent())) {
              complaciente = total;
            } else if("Ambiguo".equals(perfilName.getContent())) {
              ambiguo = total;
            } else if("Optimista".equals(perfilName.getContent())) {
              optimista = total;
            }
            total = 0;
             
        }
        
        String r = beligerante + "," + complaciente + "," + ambiguo + "," + optimista;
        logger(catName.getContent() + " --> " + r);
        hash.put(catName.getContent(), r );       
        beligerante=0; 
        complaciente=0;
        ambiguo=0;
        optimista=0;
        total=0;
      }
      return hash;
  }
}
