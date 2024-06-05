import 'package:flutter/material.dart';
import '../models/produit.dart';
import 'package:flutter_second/api/produit.dart';

class ProduitControllerTest extends ChangeNotifier {
  List _produits = [];

  List get items => _produits;

  addItem(Produit produit) {
    _produits.add(produit);

    notifyListeners();
  }

  void removeItem(Produit produit) {
    _produits.remove(produit);
    notifyListeners();
  }

  retrieveProduits() {
    return _produits.length;
  }
}

