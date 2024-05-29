import 'package:flutter/material.dart';

class panierProvider extends ChangeNotifier{
  
  List<String> _panier = [];

  List<String> get panier => _panier;

  panierProvider(){
    addPanier("item 1");
    notifyListeners(); 

  }

  void addPanier(String item) {
    _panier.add(item);
    notifyListeners();
  }

  void removePanier(String item) {
    _panier.remove(item);
    notifyListeners();
  }

}