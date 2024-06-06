import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../utils/secure_storage.dart';
import 'dart:convert';
import 'package:flutter_second/assets/ip/ip.dart';

class OrderNotifier extends ChangeNotifier {
  List<Map<String, dynamic>> _produits = [];
  Map<String, dynamic> _adresse = {};
  Map<String, dynamic> _paiement = {};
  var numeroConfirmation = null;

  List<Map<String, dynamic>> get produits => _produits;
  Map<String, dynamic> get adresse => _adresse;
  Map<String, dynamic> get paiement => _paiement;

  void addProduit(String id, int quantite) {
    _produits.add({'id': id, 'quantite': quantite});
    notifyListeners();
  }

  void setAdresse(Map<String, dynamic> adresse) {
    _adresse = adresse;
    notifyListeners();
  }

  void setPaiement(Map<String, dynamic> paiement) {
    _paiement = paiement;
    sendOrder();
    notifyListeners();
  }

  Future<void> sendOrder() async {
    final url =
        Uri.parse('${IPConfig.getIP()}api/utilisateur/panier/commander/');
    var secureStorage = SecureStorage();
    String? token = await secureStorage.readToken();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({'adresse': _adresse, 'moyenDePaiement': _paiement});

    final response = await http.patch(url, headers: headers, body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to send order');
    }
  }
}
