import 'package:http/http.dart' as http;
import 'dart:convert';
import './../../utils/secure_storage.dart';
import './../models/user_model.dart'; 

Future<int> registerUser(
    String firstName, String lastName, String email, String password) async {
  var url = Uri.parse('http://127.0.0.1:8080/api/auth/register');

  var headers = {
    'Content-Type': 'application/json',
    'Accept':
        'application/json', // S'assurer que le serveur sait que le client attend du JSON
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
      print(
          "Request failed: Status code ${response.statusCode}, Response: ${response.body}");
      return response.statusCode;
    }
  } catch (e) {
    print("Exception during request: $e");
    return 0;
  }
}



Future<http.Response> login(String email, String password) async {
  final url = Uri.parse('http://localhost:8080/api/auth/login');
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  // var body = jsonEncode({"email": email,"password": password});
  var body = jsonEncode({
  "email": email,
  "motDePasse": password
}); 

  print('email => $email et password => $password');

  final response = await http.post(url, headers: headers, body: body);
  print('response => ${response.body} et status code => ${response.statusCode} et reason => ${response.reasonPhrase}');

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to login: ${response.reasonPhrase}');
  }
}



// Future<List<UserModel>> informationsUtilisateurAPI() async {
//   print('dans le informationsUtilisateurAPI');

//   final url = Uri.parse('http://localhost:8080/api/utilisateur/me');
//     var secureStorage = SecureStorage();
//     String? token = await secureStorage.readToken();
//   final headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer ${token}',
//   };  
  
//   try {
//   final response = await http.get(url, headers: headers);
//   if (response.statusCode == 200) {
 
//   var decodedBody = utf8.decode(response.bodyBytes);
//       var data = jsonDecode(decodedBody);
//       var dataInformations = utf8.decode(response.bodyBytes) as Map<String, dynamic>;
//       print('information sur le dataInfromations[mail] => ${dataInformations['email']}');
//       print(data);
//       var user = List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));
//       print(user);
//       return user;
//   }else{
//     return [];
//   }
    
//   } catch (e) {
//     print("Exception during request: $e");
//     return [];
//   }
  
// }



Future<UserModel> informationsUtilisateurAPI() async {
  final url = Uri.parse('http://localhost:8080/api/utilisateur/me');
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
    print("dans le  informationsUtilisateurAPI email => ${jsonData['email']}");
    print("dans le informationsUtilisateurAPI nom => ${jsonData['nom']}");
    print("dans le informationsUtilisateurAPI prenom => ${jsonData['prenom']}");
    print("dans le informationsUtilisateurAPI prenom => ${jsonData['paiements']}");
    
    // Si l'API retourne l'utilisateur
    UserModel users = UserModel.fromJson(jsonData);
    print(users); 
    print(users.lastName); 
    print(users.paiements); 
    print(users.adresse);
    return users;

    

  } else {
    throw Exception('Failed to load user data');
  }
}


