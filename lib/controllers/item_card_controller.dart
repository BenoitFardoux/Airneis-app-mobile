import 'package:flutter/material.dart';
import 'package:flutter_second/api/user.dart';
import '../models/card_item.dart';

class ItemCardController extends ChangeNotifier {
  List<CardItem> _items = [];

  List<CardItem> get items => _items;

  ItemCardController() {
    fetchAndInitializeItems();
  }

  void fetchAndInitializeItems() async {
    try {
      var data = await informationsUtilisateurAPI();
      _items = data.paiements!;
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  var default_card = null;

  void addItem(CardItem card) {
    _items.add(card);
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
