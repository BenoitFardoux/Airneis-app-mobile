import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/produit_controller.dart';
import 'package:flutter_second/provider/panier_provider.dart';
//import './../../../controllers/produit_controller.dart';
// import 'panier_widget.dart';

class PanierManage extends StatelessWidget {
  const PanierManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var panier = Provider.of<ProduitControllerTest>(context);
    print(panier.items.length); 
    print(panier); 
    // Utilisez le nom correct du controller
    // print(produitCtrl.items.length);
    // print(produitCtrl.items[0].nom);
    return 
    // ChangeNotifierProvider<ChangeNotifier>(
    //   create: (context) => ProduitControllerTest()
    
    // child:
    Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: Column(children: [
        // ElevatedButton(
        //     onPressed: () => produitCtrl.retrieveProduits(),
        //     child: const Text('test api'),
        //   ),
        Expanded(child: 
             ListView.builder(
              itemCount: panier.items.length,
              itemBuilder: (context, index) {
                
                return ListTile(
                  title: Text(panier.items[index].nom),
                  // autres propriétés
                );
              },
            ),
          
        ),
      ]),
    );
  }
}
