import 'package:flutter/material.dart';
import '../models/adresse.dart'; 
import 'package:flutter_second/api/user.dart';

class AdresseController extends ChangeNotifier {
  List<Adresse> _adresse = [];

  List<Adresse> get items => _adresse;

  AdresseController() {
    fetchAndInitializeItems();
  }

  void fetchAndInitializeItems() async {
    try {
      
      var user = await informationsUtilisateurAPI();
      List<Adresse> adresses = user.adresses;      
      _adresse.addAll(adresses);      
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


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
