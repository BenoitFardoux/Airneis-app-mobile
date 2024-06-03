
import 'package:flutter_second/views/main_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_second/controllers/produit_controller.dart';
import './resultat_search_filter.dart';
import './components/carousel.dart';



import 'dart:core'; // Import dart:core pour identityHashCode

class HomePageScreen extends StatelessWidget{
  HomePageScreen({super.key}); 

  @override
  Widget build(BuildContext context){
    return MainApp(body: HomePageWidget());
  }
}

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
      
        var produitController = Provider.of<ProduitControllerTest>(context, listen: false);
     
        return Container(
          child: Column(
            children: [
              MyCarouselWidget(),
              CategorieHomePage(ProviderName: produitController.items[0]),
            ],
          )
        );
      }
    );
  }
}




class CategorieHomePage extends StatelessWidget {
  final ProviderName;
  CategorieHomePage({super.key, this.ProviderName = null});

  @override
  Widget build(BuildContext context) {
    return 
    
    Material(child: 
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailPageScreen(produit: ProviderName)),
          // builder: (context) => Categorie()),
        );
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
          child: Column(children: [
            Stack(children: <Widget>[
              Container(
                width: 250,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(15) // Adjust the radius as needed
                    ),
                child: Image.network(ProviderName.images[0].url ??
                    'https://media.istockphoto.com/id/1466564449/fr/photo/salon-%C3%A9cologique-avec-canap%C3%A9-jaune-plantes-vertes-lampadaire-et-mur-de-briques.jpg?s=2048x2048&w=is&k=20&c=fckW2-CtIp4Xu53kIwp5wibZ5J905j__AdYFUNej2Ks='),
              ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(ProviderName.nom ?? 'par défaut',
                        style: TextStyle(
                            color: Color.fromARGB(255, 213, 25, 25),
                            fontSize: 27,
                            fontWeight: FontWeight.bold))),
              ),
            ]),
          ])),
    ),
    
    
    );
  }
}
