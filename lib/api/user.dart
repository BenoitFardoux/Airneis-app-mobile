import 'package:http/http.dart' as http;
import 'dart:convert';

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
    print("Sending request to URL: $url");
    print("Headers: $headers");
    print("Body: $body");

    var response = await http.post(url, headers: headers, body: body);

    print("Response Status: ${response.statusCode}");
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
