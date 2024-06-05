import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_second/views/components/panier/panier_widget.dart';

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
      appBar: AppBar(title: const Text('Panier')),
      body: userData == null ? CircularProgressIndicator() : buildListView(),
    );
  }

  Widget buildListView() {
    if (userData == null || userData!.panierActuel!.produits.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Votre panier est vide"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
              child: Text("Voir les produits"),
            ),
          ],
        ),
      );
    } else {
      return Column(children: [
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
                  });
                },
                onDelete: () => deleteProduitPanier(id ?? 'par défaut'),
              );
            },
          ),
        ),
        Text('Total: ${getTotal().toStringAsFixed(2)} €',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.0),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutWidget()),
              );
            },
            child: Text("Passer la commande"))
      ]);
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
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Erreur: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return ListView(
            children: [
              Image.network(snapshot.data!.images[0].url),
              Text(snapshot.data!.nom, style: TextStyle(fontSize: 24)),
              Text(snapshot.data!.description),
              Text("Prix: ${snapshot.data!.prix}€"),
            ],
          );
        } else {
          return Center(child: Text("Aucune donnée disponible"));
        }
      },
    );
  }
}
