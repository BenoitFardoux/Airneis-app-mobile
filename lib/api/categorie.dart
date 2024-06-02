import 'package:http/http.dart' as http;
import 'dart:convert';
import './../models/adresse.dart';
import './../assets/ip/ip.dart';

Future<List<Adresse>> getProduit() async {
  var url = Uri.parse('${IPConfig.getIP()}api/airneis/produits?pageNumber=0&pageSize=10');// URL pour l'adresse
  
  try {
    var response = await http.get(url);
    
    // Vérifier le statut de la réponse avant de traiter le corps de la réponse
    if (response.statusCode == 200) {
      
      var decodedBody = utf8.decode(response.bodyBytes);
      var data = jsonDecode(decodedBody)['_embedded']; 
      print(data);
      // List<Produit> produits = data.map<Produit>((item) => Produit.fromJson(item)).toList();
      List<Adresse> produits = List<Adresse>.from(data['produitRestRessourceList'].map((x) => Adresse.fromJson(x)));
      return produits;
    } else {
      print("Request failed: Status code ${response.statusCode}, Response: ${response.body}");
      return [];  // Retourner une liste vide ou lever une exception selon votre gestion d'erreur
    }
  } catch (e) {
    print("Exception during request: $e");
    return [];  // Retourner une liste vide ou lever une exception selon votre gestion d'erreur
  }
}
