import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_second/views/components/panier/panier_widget.dart';
import 'package:http/http.dart';

import 'package:provider/provider.dart';
import './../checkout/checkout_widget.dart';
import 'package:flutter_second/models/user_model.dart';
import 'package:flutter_second/models/produit.dart';
import 'package:flutter_second/api/user.dart';
import 'package:flutter_second/api/produit.dart';
import 'package:flutter_second/controllers/produits.dart';
import './../../homepage.dart';

class PanierManage extends StatefulWidget {
  @override
  _PanierManageState createState() => _PanierManageState();
}

class _PanierManageState extends State<PanierManage> {
  UserModel? userData;
  List? produits = [];
  Map<String, int> productQuantities = {};

  @override
  void initState() {
    super.initState();
    fetchProduits();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final userData = await informationsUtilisateurAPI();

      setState(() {
        this.userData = userData;
      });
    } catch (e) {
      print('Failed to load user data: $e');
    }
  }

  Future<void> fetchProduits() async {
    try {
      var produitProvider =
          await Provider.of<listeProduits>(context, listen: false)
              .retrieveProduits();

      setState(() {
        this.produits = produitProvider;
      });
    } catch (e) {
      print('Failed to load user data: $e');
    }
  }

  double getTotal() {
    double total = 0.0;
    userData?.panierActuel?.produits.forEach((item) {
      var productId = item.id;

      var product = produits?.firstWhere((prod) => prod.id == productId);

      if (product != null) {
        int quantity = productQuantities[productId] ?? 1;
        total += product.prix * quantity;
      }
    });
    return total;
  }

  double getTVA(double total) {
    const double tvaRate = 0.20; // TVA de 20%
    return total * tvaRate;
  }

  void deleteProduitPanier(String id) {
    setState(() {
      
      produits?.removeWhere((prod) => prod.id == id);

      userData?.panierActuel?.produits.removeWhere((prod) => prod.id == id);

      productQuantities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          label: 'Panier',
          child: Text('Panier', style: TextStyle(color: Colors.brown)),
        ),
        backgroundColor: Colors.brown[300],
      ),
      body: userData == null 
        ? Center(
            child: Semantics(
              label: 'Chargement',
              child: CircularProgressIndicator(),
            ),
          ) 
        : buildListView(),
    );
  }

  Widget buildListView() {
    if (userData == null || userData!.panierActuel!.produits.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              label: 'Votre panier est vide',
              child: Text("Votre panier est vide"),
            ),
            SizedBox(height: 20),
            Semantics(
              label: 'Voir les produits',
              button: true,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
                child: Text("Voir les produits"),
              ),
            ),
          ],
        ),
      );
    } else {
      double total = getTotal();
      double tva = getTVA(total);
      double totalWithTVA = total + tva;
      
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userData!.panierActuel!.produits.length,
              itemBuilder: (context, index) {
                var item = userData!.panierActuel!.produits[index];

                List<Produit>? product = produits
                    ?.where((p) => p.id.contains(item.id))
                    .toList()
                    .cast<Produit>();
                String? id = product?.first.id;
                String? nom = product?.first.nom;
                String? description = product?.first.description;
                String? image = product?.first.images[0].url;
                double? price = (product?.first.prix as double?);

                return PanierWidget(
                  id: id ?? 'par défaut',
                  titre: nom ?? 'aucun resultat',
                  description: description ?? 'par défaut',
                  image: image ?? 'par défaut',
                  price: price ?? 0.0,
                  quantity: item.quantite,
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      productQuantities[id ?? 'par défaut'] = newQuantity;
                        patchProduitPanier(id: id ?? 'par défaut', quantite: newQuantity);
                    });
                  },
                  onDelete: () => deleteProduitPanier(id ?? 'par défaut'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  label: 'Prix des articles: ${total.toStringAsFixed(2)} euros',
                  child: Text('Prix des articles: ${total.toStringAsFixed(2)} €',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Semantics(
                  label: 'TVA de 20%: ${tva.toStringAsFixed(2)} euros',
                  child: Text('TVA (20%): ${tva.toStringAsFixed(2)} €',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                ),
                Divider(),
                Semantics(
                  label: 'Montant total: ${totalWithTVA.toStringAsFixed(2)} euros',
                  child: Text('Montant total: ${totalWithTVA.toStringAsFixed(2)} €',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown)),
                ),
                SizedBox(height: 10.0),
                Semantics(
                  label: 'Passer la commande',
                  button: true,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutWidget()),
                      );
                    },
                    child: Text("Passer la commande"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300]),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class ProductDetailPage extends StatefulWidget {
  final String productId;

  ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Future<Produit> produitFuture;

  @override
  void initState() {
    super.initState();
    produitFuture = getProduitById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Produit>(
      future: produitFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Semantics(
              label: 'Chargement',
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Semantics(
              label: 'Erreur: ${snapshot.error}',
              child: Text("Erreur: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: [
              Semantics(
                label: 'Image du produit',
                child: Image.network(snapshot.data!.images[0].url),
              ),
              Semantics(
                label: 'Nom du produit: ${snapshot.data!.nom}',
                child: Text(snapshot.data!.nom, style: TextStyle(fontSize: 24)),
              ),
              Semantics(
                label: 'Description: ${snapshot.data!.description}',
                child: Text(snapshot.data!.description),
              ),
              Semantics(
                label: 'Prix: ${snapshot.data!.prix} euros',
                child: Text("Prix: ${snapshot.data!.prix}€"),
              ),
            ],
          );
        } else {
          return Center(
            child: Semantics(
              label: 'Aucune donnée disponible',
              child: Text("Aucune donnée disponible"),
            ),
          );
        }
      },
    );
  }
}
