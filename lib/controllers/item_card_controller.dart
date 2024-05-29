import 'package:flutter/material.dart';
import '../models/card_item.dart'; // Assurez-vous que ce fichier existe et contient la classe CardItem

class ItemCardController extends ChangeNotifier {
  List<CardItem> _items = [CardItem(numero: 666, nom: 'test dans le notify', Month: "11/02", Year: "2020", isFavorite: true), CardItem(numero: 666, nom: 'test dans le notify', Month: "11/02", Year: "2020", isFavorite: false)];

  List<CardItem> get items => _items;

  var default_card = null; 
  
  void addItem(CardItem card) {
    _items.add(card);
    print(items);
    print("ajouté");
    for(int i = 0; i < items.length; i++){
      print(items[i].nom);
    }
    notifyListeners();

  }

  void removeItem(CardItem cardItem) {
    _items.remove(cardItem);
    notifyListeners();
  }

  void setDefaultCard(int index) {
  for (int i = 0; i < _items.length; i++) {
    _items[i].isFavorite = i == index;
  }
  notifyListeners();
}



}
