import 'dart:convert';
import 'package:http/http.dart' as http;
import './../models/commande.dart';
import 'package:flutter_second/assets/ip/ip.dart';
import './../utils/secure_storage.dart';

class ApiUtilisateur {
  static Future<Utilisateur> fetchUtilisateur() async {
    final url = Uri.parse('${IPConfig.getIP()}api/utilisateur/me');
    var secureStorage = SecureStorage();
    String? token = await secureStorage.readToken();

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Utilisateur.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load utilisateur');
    }
  }
}
