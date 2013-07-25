static class Logic {
  
  static HashMap<String,ArrayList> hm = new HashMap<String,ArrayList>();

  static ArrayList getWordsPerfiles(String string, String delimeter) {
      String[] split = string.split(delimeter);
      ArrayList response = new ArrayList();
      for(int x=0; x<split.length; x++) {
          response.add(x, split[x].trim());
          loggin(x + " ----> " + split[x].trim() );
      }
      return response;
  }


  static void printArray(ArrayList array) {
    loggin("Imprimiendo array");  
    for(int x=0; x<array.size(); x++) {
      loggin(array.get(x).toString());
    }
  }

  static ArrayList loadPerfiles(XML[] perfiles) {
      XML name = null;
      XML words = null;
      for(int x=0; x<perfiles.length; x++) {
          name = perfiles[x].getChild("name");
          words = perfiles[x].getChild("words");
          loggin("Words: " + name.getContent() );
          hm.put(name.getContent(), getWordsPerfiles(words.getContent(), ",") );
      }
      
      return null;
  }
  
  
  static void loggin(String message) {
      println(message);
  }

}
