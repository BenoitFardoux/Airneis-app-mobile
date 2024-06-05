import 'package:http/http.dart' as http;
import 'dart:convert';
import './../models/produit.dart';
import './../assets/ip/ip.dart';

Future<List<Produit>> getProduit() async {
  var url = Uri.parse(
      '${IPConfig.getIP()}api/airneis/produits?pageNumber=0&pageSize=10');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedBody = utf8.decode(response.bodyBytes);
      var data = jsonDecode(decodedBody)['_embedded'];
    

      List<Produit> produits = List<Produit>.from(data['produitRestRessourceList'].map((x) => Produit.fromJson(x)));
         
      return produits;
    } else {
      
      return [];
    }
  } catch (e) {
    print("Exception during request: $e");
    return [];
  }
}


Future<Produit> getProduitById(String id) async {
  
  var url = Uri.parse('${IPConfig.getIP()}api/airneis/produits/$id');

  try {
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var decodedBody = utf8.decode(response.bodyBytes);
      var json = jsonDecode(decodedBody);
      

      Produit produit = Produit.fromJson(json);
   
      return produit;
    } else {
     
      throw Exception('Failed to load product');
    }
  } catch (e) {
    print("Exception during request: $e");
    throw Exception('Failed to execute request');
  }
}
