import 'dart:convert';
import 'package:http/http.dart' as http;
import './../utils/secure_storage.dart';
import './../assets/ip/ip.dart';


Future<void> updateCartes(_items) async {
    var url = Uri.parse('${IPConfig.getIP()}api/utilisateur/moyens-de-paiements');
    var secureStorage = SecureStorage();
    String? token = await secureStorage.readToken();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({'cartes': _items.map((card) => card.toJson()).toList()});

    final response = await http.patch(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Cartes mises à jour avec succès');
    } else {
      print('Erreur lors de la mise à jour des cartes: ${response.statusCode}');
      throw Exception('Failed to update cartes');
    }

    
  }