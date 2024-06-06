import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../resultat_search_filter.dart';
import 'package:flutter_second/colors/colors.dart';
import 'package:flutter_second/controllers/produit_controller.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 1500,
          child: Column(
            children: [
              CategorieImage(
                  ProviderName:
                      Provider.of<ProduitControllerTest>(context).items[0]),
              SizedBox(height: 20),
              Expanded(
                child: CategorieResultsPage(
                    filteredArticles:
                        Provider.of<ProduitControllerTest>(context).items),
              )
            ],
          )),
    );
  }
}

class CategorieImage extends StatelessWidget {
  final ProviderName;
  CategorieImage({super.key, this.ProviderName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Column(children: [
        Stack(children: <Widget>[
          Container(
            width: size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(ProviderName.images[0].url),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Text(ProviderName.nom,
                    style: TextStyle(
                        color: Color.fromARGB(255, 213, 25, 25),
                        fontSize: 27,
                        fontWeight: FontWeight.bold))),
          ),
        ]),
      ]),
    );
  }
}

class CategorieResultsPage extends StatelessWidget {
  final List filteredArticles;

  const CategorieResultsPage({Key? key, required this.filteredArticles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
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
                  builder: (context) =>
                      ProductDetailPageScreen(produit: produit),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            produit.nom,
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'NotosansRegular'),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
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
            ),
          );
        },
      ),
    );
  }
}
