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
      print(data); 

      List<Produit> produits = List<Produit>.from(data['produitRestRessourceList'].map((x) => Produit.fromJson(x)));
          print("produits=========================>");
          print(produits);
      return produits;
    } else {
      print(
          "Request failed: Status code ${response.statusCode}, Response: ${response.body}");
      return [];
    }
  } catch (e) {
    print("Exception during request: $e");
    return [];
  }
}


Future<Produit> getProduitById(String id) async {
  print('dans le get produit by ID');
  var url = Uri.parse('${IPConfig.getIP()}api/airneis/produits/$id');

  try {
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var decodedBody = utf8.decode(response.bodyBytes);
      var json = jsonDecode(decodedBody);
      print(json);

      Produit produit = Produit.fromJson(json);
      print('Produit: $produit'); 
      return produit;
    } else {
      print("Request failed: Status code ${response.statusCode}, Response: ${response.body}");
      throw Exception('Failed to load product');
    }
  } catch (e) {
    print("Exception during request: $e");
    throw Exception('Failed to execute request');
  }
}
