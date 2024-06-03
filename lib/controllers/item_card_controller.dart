import 'package:flutter/material.dart';
import 'package:flutter_second/api/user.dart';
import '../models/card_item.dart'; // Assurez-vous que ce fichier existe et contient la classe CardItem

class ItemCardController extends ChangeNotifier {
  List<CardItem> _items = [CardItem(numero: "666", nom: 'test dans le notify', Month: "11/02", Year: "2020", isFavorite: true), CardItem(numero: "666", nom: 'test dans le notify', Month: "11/02", Year: "2020", isFavorite: false)];

  List<CardItem> get items => _items;

  ItemCardController() {
    print("ItemCardController");
    fetchAndInitializeItems();
    print("après ItemCardController");
    
  }

  void fetchAndInitializeItems() async {
    try {
      
      var data = await informationsUtilisateurAPI();
      _items = data.paiements!;
      notifyListeners();  // Mettre à jour l'UI après le chargement des données
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

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
