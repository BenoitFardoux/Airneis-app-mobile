import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';

import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/auth_provider.dart';
import 'package:flutter_second/provider/panier_provider.dart';
import 'package:flutter_second/views/homepage.dart';
import'package:flutter_second/views/components/navbar.dart';
import 'package:flutter_second/views/resultat_search_filter.dart';

import 'package:provider/provider.dart';
import 'dart:core'; // Import dart:core pour identityHashCode

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
            body: body),

          )
          
          
           
    );
  }
}

// class CategorieHomePage extends StatelessWidget {
//   final ProviderName;
//   CategorieHomePage({super.key, this.ProviderName = null});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => ProductDetailPage(produit: ProviderName)),
//           // builder: (context) => Categorie()),
//         );
//       },
//       child: Container(
//           padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
//           child: Column(children: [
//             Stack(children: <Widget>[
//               Container(
//                 width: 250,
//                 height: 200,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                     borderRadius:
//                         BorderRadius.circular(15) // Adjust the radius as needed
//                     ),
//                 child: Image.network(ProviderName.images[0].url ??
//                     'https://media.istockphoto.com/id/1466564449/fr/photo/salon-%C3%A9cologique-avec-canap%C3%A9-jaune-plantes-vertes-lampadaire-et-mur-de-briques.jpg?s=2048x2048&w=is&k=20&c=fckW2-CtIp4Xu53kIwp5wibZ5J905j__AdYFUNej2Ks='),
//               ),
//               Positioned.fill(
//                 child: Align(
//                     alignment: Alignment.center,
//                     child: Text(ProviderName.nom ?? 'par défaut',
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 213, 25, 25),
//                             fontSize: 27,
//                             fontWeight: FontWeight.bold))),
//               ),
//             ]),
//           ])),
//     );
//   }
// }
