import 'package:flutter/material.dart';
import '../models/card_item.dart'; // Assurez-vous que ce fichier existe et contient la classe CardItem

class ItemCardController extends ChangeNotifier {
  List<CardItem> _items = [CardItem(numero: 666, nom: 'test dans le notify')];

  List<CardItem> get items => _items;

  void addItem() {
    _items.add(CardItem(numero: 555, nom: "arnaud rein"));
    notifyListeners();
  }

  void removeItem(CardItem cardItem) {
    _items.remove(cardItem);
    notifyListeners();
  }
}
