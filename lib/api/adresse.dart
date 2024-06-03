import 'package:http/http.dart' as http;
import 'dart:convert';
import './../models/adresse.dart';
import './../assets/ip/ip.dart';

Future<List<Adresse>> getProduit() async {
  var url = Uri.parse(
      '${IPConfig.getIP()}api/airneis/produits?pageNumber=0&pageSize=10');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedBody = utf8.decode(response.bodyBytes);
      var data = jsonDecode(decodedBody)['_embedded'];
      List<Adresse> produits = List<Adresse>.from(
          data['produitRestRessourceList'].map((x) => Adresse.fromJson(x)));
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
