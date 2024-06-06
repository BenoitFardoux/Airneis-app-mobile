import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/controllers/checkout.dart';
import 'package:flutter_second/controllers/search_controller_filter.dart';
import 'package:flutter_second/provider/auth_provider.dart';
import 'package:flutter_second/controllers/produits.dart';
import 'package:flutter_second/views/components/navbar.dart';
import 'package:provider/provider.dart';
import 'dart:core'; 

class MainApp extends StatelessWidget {
  MainApp({super.key, this.body});
  final body;
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Airneis';
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ItemCardController()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => ProduitControllerTest()),
          ChangeNotifierProvider(create: (context) => AdresseController()),
          ChangeNotifierProvider(create: (context) => listeProduits()),
          ChangeNotifierProvider(create: (_) => OrderNotifier()),
          ChangeNotifierProvider(create: (_) => SearchControllerFilter()),
          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color(0xFFE6C077),
          ),
          home: Scaffold(
            backgroundColor: Colors.white,
              appBar: NavBar_Icons_Title(nameOfApplication: appTitle),
              drawer: NavBar_Drawer(),
              body: body),
        ));
  }
}
