import 'dart:convert';
import 'package:http/http.dart' as http;
import './../models/user_model.dart';

class UserApi {
  static const String apiUrl = 'https://s3-5199.nuage-peda.fr/users';

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<UserModel> users =
          body.map((dynamic item) => UserModel.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}

