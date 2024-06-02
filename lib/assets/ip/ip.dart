import 'dart:io' show Platform;



class IPConfig {
  static String getIP() {
    if (Platform.isAndroid || Platform.isIOS) {
      // Utilisez l'adresse IP du réseau local de votre PC (remplacer avec votre IP locale)
      return "http://192.168.248.199:8080/"; 
    } else {
      // Utilisez 'localhost' pour Chrome ou autres navigateurs
      return "http://localhost:8080/";
    }
  }
}
