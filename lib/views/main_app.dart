import 'package:flutter/material.dart';
import 'components/navbar.dart';
import 'components/carousel.dart';
import 'components/categorie.dart';
import 'components/produit.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Test';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: NavBar_Icons_Title(nameOfApplication: appTitle),
        drawer: NavBar_Drawer(),
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
    );
  }
}
