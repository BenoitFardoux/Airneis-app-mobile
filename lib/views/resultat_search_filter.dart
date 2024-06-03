import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/views/main_app.dart';
// import 'package:flutter_second/controllers/produit_controller.dart';

import './../colors/colors.dart';
// import '../models/produit.dart'; // Assurez-vous que le chemin d'import est correct

import 'package:carousel_slider/carousel_slider.dart';
import './main_app.dart';


class FilteredResultPageScreen extends StatelessWidget {
  FilteredResultPageScreen({super.key, this.filteredArticles, this.NomRecherche});
  final  filteredArticles;
  final NomRecherche;
  @override
  Widget build(BuildContext context) {
    return MainApp(body: FilteredResultsPage(filteredArticles: filteredArticles, NomRecherche: NomRecherche));
  }
}

class FilteredResultsPage extends StatelessWidget {
  final List filteredArticles;
  final NomRecherche; // Assurez-vous que le type est correctement spécifié comme List<Produit>

  const FilteredResultsPage(
      {Key? key, required this.filteredArticles, required this.NomRecherche})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: filteredArticles.length,
        itemBuilder: (context, index) {
          final produit = filteredArticles[index];
          final imageUrl = produit.images.isNotEmpty
              ? produit.images[0].url
              : 'https://via.placeholder.com/150';

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => ProductDetailPage(produit: produit),
                  builder: (context) => ProductDetailPageScreen(produit: produit),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // make images stretch to fill card width
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    height: 200, // Set the image height
                    fit: BoxFit.cover, // Cover the card width
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          produit.nom,
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'NotosansRegular'),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: ColorsApp
                                .priceColor, // Modifier la couleur ici selon besoin
                            borderRadius: BorderRadius.circular(
                                20), // Rayon pour les coins arrondis
                          ),
                          child: Text(
                            '${produit.prix} €',
                            style: TextStyle(
                                color: ColorsApp.textColor, // Couleur du texte
                                fontSize: 16, // Taille du texte
                                fontFamily: 'Notosans' // Épaisseur du texte
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    
  }
}

// You will need to create a ProductDetailPage widget that takes a Produit as an argument.

class ProductDetailPageScreen extends StatelessWidget {
  final produit;

  const ProductDetailPageScreen({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainApp(body: ProductDetailPage(produit: produit));
  }
}


class ProductDetailPage extends StatelessWidget {
  final produit;

  const ProductDetailPage({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var produitController = Provider.of<ProduitControllerTest>(context, listen: false);
  print("identifiant unique dans mon productDetial => ${identityHashCode(produitController)}");
    List imageUrls = produit.images
        .map((img) => img.url)
        .toList(); // Assurez-vous que les URLs sont bien des String

    return  Scaffold(
        appBar: AppBar(
          title: Text(produit.nom),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Carousel for product images
              CarouselSlider(
                options: CarouselOptions(
                  height: 300, // Set height of the carousel
                  autoPlay: false, // Disable autoPlay
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                ),
                items: imageUrls
                    .map((url) => Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(url, fit: BoxFit.cover),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      produit.nom,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        '${produit.prix} €',
                        style: TextStyle(
                          color: Colors.black, // Couleur du texte
                          fontSize: 16, // Taille du texte
                          fontWeight: FontWeight.bold, // Épaisseur du texte
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      produit.description,
                      style:
                          TextStyle(fontSize: 16, fontFamily: 'NotosansLight'),
                    ),
                    SizedBox(height: 20),
                    // Button for adding to cart
                    ElevatedButton(
                      onPressed: () {
                        // Add your functionality for adding to cart here
                        print('avant l envoi de produit');
                        print(produit.nom);
                        produitController.addItem(
                            produit); // Add the product to the cart (assuming addItem is a method in ProduitController
                        print('Added to cart');
                      },
                      child: Text('AJOUTER AU PANIER'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.primaryColor, // Button color
                        foregroundColor: ColorsApp.textColor,
                        // Text color
                      ).copyWith(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                            fontFamily:
                                'NotosansRegular', // Utilisation de la famille de polices personnalisée
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Produits Similaires',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // Carousel for similar products (manual control)
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: false, // Disable autoPlay
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                      ),
                      items: [1, 2, 3, 4].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                              ),
                              child: Text(
                                'Text $i',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}
