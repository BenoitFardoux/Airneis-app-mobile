import 'package:flutter/material.dart';
import 'package:flutter_second/models/categorie.dart';
import 'package:flutter_second/models/produit.dart';
import 'package:flutter_second/api/categorie.dart';
import 'package:flutter_second/api/produit.dart';
import 'dart:convert'; 
import './../../resultat_search_filter.dart';
import 'package:flutter_second/colors/colors.dart';
import 'package:flutter_second/views/main_app.dart';


class categorieScreen extends StatelessWidget {
  const categorieScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return MainApp(body: CategoryDetailPage(id: id));
  }
}



class CategoryDetailPage extends StatefulWidget {
  final String id;

  CategoryDetailPage({required this.id});

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late Future<Category> futureCategory;
  Future<List<Produit>>? futureProduits;

  @override
  void initState() {
    super.initState();
    futureCategory = fetchCategory(widget.id);
    futureProduits = getProduit();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
      future: futureCategory,
      builder: (context, categorySnapshot) {
        if (categorySnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (categorySnapshot.hasError) {
          return Center(child: Text('Erreur: ${categorySnapshot.error}'));
        } else if (!categorySnapshot.hasData) {
          return Center(child: Text('Aucune catégorie trouvée'));
        } else {
          var category = categorySnapshot.data!;
          return FutureBuilder<List<Produit>>(
            future: futureProduits,
            builder: (context, produitsSnapshot) {
              if (produitsSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (produitsSnapshot.hasError) {
                return Center(child: Text('Erreur: ${produitsSnapshot.error}'));
              } else if (!produitsSnapshot.hasData) {
                return Center(child: Text('Aucun produit trouvé'));
              } else {
                
                var produits = produitsSnapshot.data!;
               

               
                var filteredProduits = produits.where((product) {
                  return category.products.any((catProd) => catProd.id == product.id);
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(category.image.url),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          safeDecode(category.name), 
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsApp.textColor, fontFamily: 'NotoSans',decoration: TextDecoration.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          safeDecode(category.image.description), 
                          style: TextStyle(fontSize: 16, color: ColorsApp.textColor, fontFamily: 'NotoSans', decoration: TextDecoration.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Products:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsApp.textColor, fontFamily: 'NotoSans', decoration: TextDecoration.none),
                        ),
                      ),
                      Column(
                        children: filteredProduits.map((product) {
                          
                          return Card(
                            margin: EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPageScreen(produit: product),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  product.images.isNotEmpty
                                      ? Image.network(
                                          product.images.first.url,
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          width: double.infinity,
                                          height: 200,
                                          color: Colors.grey,
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      safeDecode(product.nom), // Décodage du texte
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                                    child: Text(
                                      '${product.prix} €',
                                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  String safeDecode(String text) {
    try {
      return utf8.decode(text.runes.toList());
    } catch (e) {
      print('Erreur de décodage : $e');
      return text;
    }
  }
}





