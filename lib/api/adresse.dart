import 'package:http/http.dart' as http;
import 'dart:convert';
import './../assets/ip/ip.dart';
import './../utils/secure_storage.dart';

Future addAdresseAPI(Map<String, dynamic> adresse) async {
  var url = Uri.parse('${IPConfig.getIP()}api/utilisateur/adresse');
  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(adresse),
  );

  // if (response.statusCode == 200) {
  // } else {
  //   throw Exception('Failed to load user data');
  // }
}
