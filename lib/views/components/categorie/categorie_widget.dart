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
    print(size);
    print(ProviderName.images[0].url);
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
      child: Column(children: [
        Stack(children: <Widget>[
          Container(
            width: size.width, 
            // height: 200,
            
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(15) // Adjust the radius as needed
                ),
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
  // Assurez-vous que le type est correctement spécifié comme List<Produit>

  const CategorieResultsPage({Key? key, required this.filteredArticles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(filteredArticles.length);
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
                  // builder: (context) => ProductDetailPage(produit: produit),
                  builder: (context) => ProductDetailPageScreen(produit: produit),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: 
              Padding(
               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), 
                child:
              Column(
                
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    // height: 150, // Set the image height
                    fit: BoxFit.cover, // Cover the card width
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
            ),
          );
        },
      ),
    );
  }
}
