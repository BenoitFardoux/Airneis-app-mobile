import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselWidget extends StatelessWidget {
  final List<String> imageUrls = [
    'https://media.istockphoto.com/id/1312439845/fr/photo/int%C3%A9rieur-%C3%A9l%C3%A9gant-de-salle-de-salon-avec-de-belles-usines-de-maison.jpg?s=2048x2048&w=is&k=20&c=AVuJePyuQRPCPUt9B93IvkrU5i7-RkgwoNTpNOeMR8E=',
    'https://media.istockphoto.com/id/1392982688/fr/photo/salon-scandinave-en-bois-gros-plan-dans-des-tons-blancs-maquette-de-cadre-avec-espace-de.jpg?s=2048x2048&w=is&k=20&c=6W95qF63aZSTl4ry6rBoq2cF1su5wU-KgMQubgRm3cw=',
    'https://media.istockphoto.com/id/1191672500/fr/photo/int%C3%A9rieur-moderne-de-salon-scandinave-avec-le-sofa-%C3%A0-la-menthe-%C3%A9l%C3%A9gant-les-meubles-la-carte.jpg?s=2048x2048&w=is&k=20&c=EIF1UJCKfTiT9eE9Huj1nKHcAvi5SMEAJyJ5YP2GmIc=',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.3,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
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
                  width: size.width,
                  child: Image.network(url, fit: BoxFit.cover),
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
