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

      List<Produit> produits = List<Produit>.from(
          data['produitRestRessourceList'].map((x) => Produit.fromJson(x)));
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
