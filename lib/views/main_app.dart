import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';

import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/auth_provider.dart';
import 'package:flutter_second/provider/panier_provider.dart';
import 'package:flutter_second/colors/colors.dart';
import 'package:provider/provider.dart';
import 'dart:core';  // Import dart:core pour identityHashCode
import 'components/navbar.dart';
import 'components/carousel.dart';
import 'components/categorie.dart';
import 'components/produit.dart';
import './../../../models/produit.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Airneis';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemCardController()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => panierProvider()),
        ChangeNotifierProvider(create: (context) => ProduitControllerTest()),
        ChangeNotifierProvider(create: (context) => AdresseController()),
      ],
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFFE6C077),
        ),
        home: Scaffold(
          appBar: NavBar_Icons_Title(nameOfApplication: appTitle),
          drawer: NavBar_Drawer(),
          body: Builder(  // Utiliser Builder pour accéder au contexte avec les providers
            builder: (context) {
              // Accéder à l'instance du ProduitControllerTest
              var produitController = Provider.of<ProduitControllerTest>(context, listen: false);
              // Afficher l'identifiant unique
              print('Identifiant unique de ProduitControllerTest: ${identityHashCode(produitController)}');

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyCarouselWidget(),
                  SizedBox(height: 10),
                  // Ajouter d'autres widgets si nécessaire
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
