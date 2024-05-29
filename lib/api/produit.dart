import 'package:http/http.dart' as http;
import 'dart:convert';
import './../models/produit.dart';

Future<List<Produit>> getProduit() async {
  var url = Uri.parse('http://localhost:8080/api/airneis/produits?pageNumber=0&pageSize=10');
  
  try {
    var response = await http.get(url);
    
    // Vérifier le statut de la réponse avant de traiter le corps de la réponse
    if (response.statusCode == 200) {
      // Utilisation de response.bodyBytes pour une gestion sûre de l'encodage UTF-8
      var decodedBody = utf8.decode(response.bodyBytes);
      var data = jsonDecode(decodedBody)['_embedded'];
      print(data);
      // List<Produit> produits = data.map<Produit>((item) => Produit.fromJson(item)).toList();
      List<Produit> produits = List<Produit>.from(data['produitRestRessourceList'].map((x) => Produit.fromJson(x)));
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
