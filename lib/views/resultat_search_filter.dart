import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/panier_provider.dart';
// import '../models/produit.dart'; // Assurez-vous que le chemin d'import est correct
import './components/produit_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';


class FilteredResultsPage extends StatelessWidget {
  final List filteredArticles; // Assurez-vous que le type est correctement spécifié comme List<Produit>

  const FilteredResultsPage({Key? key, required this.filteredArticles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Results'),
      ),
      body: ListView.builder(
        itemCount: filteredArticles.length,
        itemBuilder: (context, index) {
          final produit = filteredArticles[index];
          final imageUrl = produit.images.isNotEmpty ? produit.images[0].url : 'https://via.placeholder.com/150';

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => ProductDetailPage(produit: produit),
                  builder: (context) => ProductDetailPage(produit: produit),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // make images stretch to fill card width
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${produit.prix}€', // Assuming prix is a double or int and needs a € sign
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// You will need to create a ProductDetailPage widget that takes a Produit as an argument.



class ProductDetailPage extends StatelessWidget {
  final produit;

  const ProductDetailPage({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List imageUrls = produit.images.map((img) => img.url).toList();  // Assurez-vous que les URLs sont bien des String

    return    
    ChangeNotifierProvider(
      create: (_) => ProduitControllerTest(),
    child:
    
    Scaffold(
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
                autoPlay: false,  // Disable autoPlay
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
              ),
              items: imageUrls.map((url) => Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(url, fit: BoxFit.cover),
                  )).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    produit.nom,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${produit.prix} €',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text(
                    produit.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Button for adding to cart
                  ElevatedButton(
                    onPressed: () {
                      // Add your functionality for adding to cart here
                      print('avant l envoi de produit');
                      print(produit.nom);
                      ProduitControllerTest().addItem(produit); // Add the product to the cart (assuming addItem is a method in ProduitController
                      print('Added to cart');
                    },
                    child: Text('AJOUTER AU PANIER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,  // Button color
                      foregroundColor: Colors.white,  // Text color
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Produits Similaires',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Carousel for similar products (manual control)
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: false,  // Disable autoPlay
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
    ),
    );
  }
}



