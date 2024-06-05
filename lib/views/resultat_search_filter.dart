import 'package:flutter/material.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/views/main_app.dart';
import './../colors/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_second/api/user.dart';

class FilteredResultPageScreen extends StatelessWidget {
  FilteredResultPageScreen(
      {super.key, this.filteredArticles, this.NomRecherche});
  final filteredArticles;
  final NomRecherche;
  @override
  Widget build(BuildContext context) {
    return MainApp(
        body: FilteredResultsPage(
            filteredArticles: filteredArticles, NomRecherche: NomRecherche));
  }
}

class FilteredResultsPage extends StatelessWidget {
  final List filteredArticles;
  final NomRecherche;

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
                builder: (context) => ProductDetailPageScreen(produit: produit),
              ),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
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
                          color: ColorsApp.priceColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${produit.prix} €',
                          style: TextStyle(
                              color: ColorsApp.textColor,
                              fontSize: 16,
                              fontFamily: 'Notosans'),
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

class ProductDetailPageScreen extends StatelessWidget {
  final produit;

  const ProductDetailPageScreen({Key? key, required this.produit})
      : super(key: key);

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
    var produitController =
        Provider.of<ProduitControllerTest>(context, listen: false);

    List imageUrls = produit.images.map((img) => img.url).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(produit.nom),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                autoPlay: false,
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      '${produit.prix} €',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    produit.description,
                    style: TextStyle(fontSize: 16, fontFamily: 'NotosansLight'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ajouterProduitPanier(produit.id, 100);

                      produitController.addItem(produit);
                    },
                    child: Text('AJOUTER AU PANIER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      foregroundColor: ColorsApp.textColor,
                    ).copyWith(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                          fontFamily: 'NotosansRegular',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Produits Similaires',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: false,
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
