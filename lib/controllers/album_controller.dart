import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';

class AlbumController {
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Album> fetchAlbumDetail(var id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> Poster() async {
    final response = await http.get(Uri.parse('https://www.omdbapi.com/?t=batman&apikey=5e975dd0'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(data['Poster']);

      return data['Poster'];
    } else {
      throw Exception('Failed to load album');
    }
  }
}
