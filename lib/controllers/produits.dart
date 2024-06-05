import 'package:flutter/material.dart';
import '../models/produit.dart';
import 'package:flutter_second/api/produit.dart';


class listeProduits extends ChangeNotifier {

List produits = [];


 listeProduits() {
    retrieveProduits();
    
  }

  Future retrieveProduits() async {
    try {
      produits = await getProduit();
      return produits;
      notifyListeners();
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

}