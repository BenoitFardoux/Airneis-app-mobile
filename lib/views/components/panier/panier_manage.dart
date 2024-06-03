import 'package:flutter/material.dart';
import 'package:flutter_second/models/produit.dart';
import 'package:flutter_second/views/components/panier/panier_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import './../checkout/checkout_widget.dart';
import 'package:flutter_second/views/main_app.dart';


class PanierManageScreen extends StatelessWidget {
  const PanierManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainApp(body: PanierManage());
  }
}



class PanierManage extends StatelessWidget {
  const PanierManage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProduitControllerTest>(context);
    print("identifiant unique dans mon panier_manage => ${identityHashCode(provider)}");
    return   
    Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: Column(children: [        
        Expanded(child: 
             ListView.builder(
              itemCount: provider.items.length,
              // itemCount: Provider.of<ProduitControllerTest>(context, listen: true).items.length,
              itemBuilder: (context, index) {
                print("identifiant unique dans mon panier dnas le build => ${identityHashCode(provider)}");
                // return ListTile(
                  
                //   title: Text(provider.items[index].nom),
                //   // autres propriétés
                // );
                print(provider.items[index].images[0].url);
                print(provider.items[index].id);
                print(provider.items[index].prix);
                return PanierWidget(id: provider.items[index].id, titre: provider.items[index].nom, description: provider.items[index].description, image: provider.items[index].images[0].url, price: provider.items[index].prix);
              },
            ),
          
        ),
        SizedBox(height: 10.0), // Ajoutez votre valeur de hauteur ici
      //   ElevatedButton(


      //     onPressed: () {

      //       provider.addItem(Produit(id: "2", nom: "test ajout de valeur", 
      //     description: "je suis la description du test", prix: 13,
      //      dimension: Dimension(hauteur: 10, largeur: 20, profondeur: 20),
      //      categorie: Categorie(id: "123cat", nom: "test categorie"),
      //      images:  [ImageProduit( url: "https://via.placeholder.com/150",description: "image de test")],
      //  materiaux: [Materiau(
      //   id: "mat1",
      //   nom: "Bois",
      // )],
      // )

      // );

      //     },
            
      //      child: Text("Ajouter au panier")),

      ElevatedButton(
        onPressed: (){

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutWidget()),
            );

        }, 
        child: Text("Passer la commande"))

      ]),
    );
  }
}
