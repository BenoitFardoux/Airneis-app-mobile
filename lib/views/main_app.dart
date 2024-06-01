import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';

import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/auth_provider.dart';
import 'package:flutter_second/provider/panier_provider.dart';
import 'package:flutter_second/views/resultat_search_filter.dart';

import 'package:provider/provider.dart';
import 'dart:core'; // Import dart:core pour identityHashCode
import 'components/navbar.dart';
import 'components/carousel.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';

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
          body: Builder(
            // Utiliser Builder pour accéder au contexte avec les providers
            builder: (context) {
              // Accéder à l'instance du ProduitControllerTest
              var produitController =
                  Provider.of<ProduitControllerTest>(context, listen: false);
              // Afficher l'identifiant unique
              print(
                  'Identifiant unique de ProduitControllerTest: ${identityHashCode(produitController)}');

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCarouselWidget(),
                  SizedBox(height: 70),


                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage(produit: produitController.items[0])),
                      );
                    },
                    
                    child: 
                  Container(
                      padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: Column(children: [
                        Stack(children: <Widget>[
                          Container(
                            width: 250,
                            height: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                                ),
                            child: Image.network(
                                produitController.items[0].images[0].url),
                          ),
                          Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(produitController.items[0].nom,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 213, 25, 25), fontSize: 27, fontWeight: FontWeight.bold))),
                          ),
                        ]),
                        
                      ])),


                  ),

                  CategorieHomePage(ProviderName: produitController.items[0]),

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



class CategorieHomePage extends StatelessWidget{
  final ProviderName; 
CategorieHomePage({super.key, this.ProviderName});

  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage(produit: ProviderName)),
                      );
                    },
                    
                    child: 
                  Container(
                      padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: Column(children: [
                        Stack(children: <Widget>[
                          Container(
                            width: 250,
                            height: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                                ),
                            child: Image.network(
                                ProviderName.images[0].url),
                          ),
                          Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(ProviderName.nom,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 213, 25, 25), fontSize: 27, fontWeight: FontWeight.bold))),
                          ),
                        ]),
                        
                      ])),


                  );

  }
}
