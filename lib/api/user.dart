import 'package:http/http.dart' as http;
import 'dart:convert';
import './../../utils/secure_storage.dart';
import './../models/user_model.dart';
import './../assets/ip/ip.dart';

Future<int> registerUser(
    String firstName, String lastName, String email, String password) async {
  var url = Uri.parse('${IPConfig.getIP()}api/auth/register');

  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  var body = jsonEncode({
    "email": email,
    "motDePasse": password,
    "nom": firstName,
    "prenom": lastName,
    "telephone": "06 060 606060"
  });

  try {
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  } catch (e) {
    print("Exception during request: $e");
    return 0;
  }
}

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse("${IPConfig.getIP()}api/auth/login");

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  var body = jsonEncode({"email": email, "motDePasse": password});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to login: ${response.reasonPhrase}');
  }
}

Future<UserModel> informationsUtilisateurAPI() async {
  final url = Uri.parse('${IPConfig.getIP()}api/utilisateur/me');
  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    UserModel users = UserModel.fromJson(jsonData);

    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<UserModel> recupererPanier() async {
  final url = Uri.parse('${IPConfig.getIP()}api/utilisateur/me');
  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    UserModel users = UserModel.fromJson(jsonData);

    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<UserModel> ajouterProduitPanier(String id, int quantite) async {
  final url = Uri.parse(
      '${IPConfig.getIP()}api/utilisateur/panier?idArticle=$id&quantite=$quantite');

  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();

  final response =
      await http.put(url, headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    UserModel users = UserModel.fromJson(jsonData);

    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}

Future deleteProduitPanier(String idArticle) async {
  final url =
      Uri.parse('${IPConfig.getIP()}api/utilisateur/panier/article/$idArticle');
  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final response = await http.delete(url, headers: headers);
}

Future<UserModel> patchProduitPanier({
  required String id,
  required int quantite,
  String adresse = "string",
  String codePostal = "string",
  String numeroDeRue = "string",
  String informations = "string",
  String ville = "string",
  String pays = "string",
  String telephone = "string",
  String prenom = "string",
  String nom = "string",
}) async {
  final url = Uri.parse('${IPConfig.getIP()}api/utilisateur/panier');
  var secureStorage = SecureStorage();
  String? token = await secureStorage.readToken();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var body = jsonEncode({
    "produits": [
      {"id": "$id", "quantite": quantite}
    ],
    "adresse": {
      "codePostal": "string",
      "numeroDeRue": "string",
      "informations": "string",
      "ville": "string",
      "pays": "string",
      "telephone": "string",
      "prenom": "string",
      "nom": "string",
      "departement": "string"
    },
    "paiements": {
      "numeroCarte": "string",
      "dateExpiration": "string",
      "codeSecurite": "string",
      "nomCarte": "string",
      "estParDefaut": true
    },
    "dateDeCommande": "2024-06-05T07:35:19.838Z",
    "dateDeLivraison": "2024-06-05T07:35:19.838Z"
  });

  final response = await http.patch(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    UserModel users = UserModel.fromJson(jsonData);

    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}
