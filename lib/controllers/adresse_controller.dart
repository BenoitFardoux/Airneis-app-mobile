import 'package:flutter/material.dart';
import '../models/adresse.dart'; 

class AdresseController extends ChangeNotifier {
  List<Adresse> _adresse = [];

  List<Adresse> get items => _adresse;

  addItem(Adresse adresse) {
    _adresse.add(adresse);

    notifyListeners();
  }

  void removeItem(Adresse adresse) {
    _adresse.remove(adresse);
    notifyListeners();
  }

  retrieveProduits() {
    return _adresse.length;
  }

  void createAndAddProduct() {}
}
