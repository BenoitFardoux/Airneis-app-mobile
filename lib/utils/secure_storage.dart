import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  static const _keyEmail = 'email';
  static const _keyPassword = 'passwordB6??8B';
  static const _keyToken = 'token';

  Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<Map<String, String?>> readCredentials() async {
    String? email = await _storage.read(key: _keyEmail);
    String? password = await _storage.read(key: _keyPassword);
    return {
      'email': email,
      'password': password,
    };
  }

  Future<String?> readToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<void> deleteCredentials() async {
    await _storage.delete(key: _keyEmail);
    await _storage.delete(key: _keyPassword);
    await _storage.delete(key: _keyToken);
  }
}
