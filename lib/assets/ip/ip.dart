import 'package:flutter/foundation.dart' show kIsWeb;

class IPConfig {
  static String getIP() {
    // Vérifie si l'application s'exécute sur le web
    if (kIsWeb) {
      return "http://localhost:8080/";
    } else {
      // Si ce n'est pas le web, c'est probablement Android ou iOS
      // Utilisez l'adresse IP du réseau local de votre PC (remplacer avec votre IP locale)
      return "http://192.168.248.199:8080/"; 
    }
  }
}
