import 'package:flutter_second/views/main_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import './components/carousel.dart';
import './components/categorie/categorie_homepage.dart';
import 'dart:core';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainApp(body: HomePageWidget());
  }
}

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var produitController =
          Provider.of<ProduitControllerTest>(context, listen: false);

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCarouselWidget(),
              CategoryPage(id: "6661275984c9fc1fb0499c34"),
              CategoryPage(id: "6661275984c9fc1fb0499c34"),
            ],
          ),
        ),
      );
    });
  }
}
