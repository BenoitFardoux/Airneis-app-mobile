import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class MyCarouselWidget extends StatelessWidget {
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg',
    'https://m.media-amazon.com/images/M/MV5BZjRjOTFkOTktZWUzMi00YzMyLThkMmYtMjEwNmQyNzliYTNmXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_SX300.jpg',
    'https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Obtenez la taille de l'écran

    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.3, // Hauteur personnalisée du carrousel
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction:
            1.0, // Assurez-vous que chaque image prend toute la largeur du viewport
      ),
      items: imageUrls
          .map((url) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(imageUrl: url),
                      ));
                },
                child: Container(
                  width: size
                      .width, // Appliquez la largeur de l'écran au conteneur
                  child: Image.network(url,
                      fit: BoxFit
                          .cover), // Utilisez BoxFit.cover pour remplir l'espace
                ),
              ))
          .toList(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  DetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Detail')),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}