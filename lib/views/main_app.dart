import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/auth_provider.dart';
import 'package:flutter_second/provider/panier_provider.dart';
import 'package:provider/provider.dart';
import 'components/navbar.dart';
import 'components/carousel.dart';
import 'components/categorie.dart';
import 'components/produit.dart';


class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Airneis';
    return 
   
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemCardController()),
         ChangeNotifierProvider(create: (_) => AuthProvider()),
         ChangeNotifierProvider(create: (context) => panierProvider()), 
        //  ChangeNotifierProvider(create: (context) => ProduitControllerTest()),
      ],
      child:
    Container(
      child:
    
    MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFE6C077),



      ),
      home: Scaffold(
        appBar: NavBar_Icons_Title(nameOfApplication: appTitle),
        drawer: 
        
        
        NavBar_Drawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyCarouselWidget(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(48.0),
                child: Categorie(),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Categorie(),
              ),
              Container(
                child: Text("section"),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Produit(),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Produit(),
              ),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }
}
