import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/item_card_controller.dart'; 
import './../models/card_item.dart';// Assurez-vous que ce fichier existe et contient la classe ItemCardController

class Test extends StatelessWidget {
  const Test({super.key}); // Utilisation de const

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemCardController(), // Crée l'instance de ItemCardController
      child: MaterialApp(
        home: CartPage(), // La page principale qui utilisera ItemCardController
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ItemCardController>(context); // Accède au modèle de cart
    return Scaffold(
      appBar: AppBar(title: Text("Cart Example")),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(cart.items[index].nom), // Affiche le nom de l'article
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => cart.removeItem(cart.items[index]), // Supprime l'article du panier
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cart.addItem(CardItem(numero: 666, nom: 'test dans le notify', Month: "11/02", Year: "2020", isFavorite: false)), // Ajoute un nouvel article
        child: Icon(Icons.add),
      ),
    );
  }
}

