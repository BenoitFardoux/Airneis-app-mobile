import 'package:flutter/material.dart';
import 'package:flutter_second/api/user.dart';
import '../models/card_item.dart';
import './../assets/ip/ip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './../utils/secure_storage.dart';

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
    updateCartes();
    notifyListeners();
  }

  void removeItem(CardItem cardItem) {
    _items.remove(cardItem);
    updateCartes();
    notifyListeners();
  }

  void setDefaultCard(int index) {
    for (int i = 0; i < _items.length; i++) {
      _items[i].estParDefaut = i == index;
    }

    updateCartes();
    notifyListeners();
  }

  Future<void> updateCartes() async {
    var url =
        Uri.parse('${IPConfig.getIP()}api/utilisateur/moyens-de-paiements');
    var secureStorage = SecureStorage();
    String? token = await secureStorage.readToken();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body =
        jsonEncode({'cartes': _items.map((card) => card.toJson()).toList()});

    final response = await http.patch(url, headers: headers, body: body);

    // if (response.statusCode == 200) {
    //   print('Cartes mises à jour avec succès');
    // } else {
    //   print('Erreur lors de la mise à jour des cartes: ${response.statusCode}');
    //   throw Exception('Failed to update cartes');
    // }
  }
}
