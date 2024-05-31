import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/adresse_controller.dart';
import 'adresse_widget.dart';
import './add_dress_list.dart';

class ManageAdress extends StatelessWidget {
  const ManageAdress({super.key});

  @override
  Widget build(BuildContext context) {
    var providerName = Provider.of<AdresseController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Manage Adress')),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 20.0), // Ajoutez vos valeurs de padding ici
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: providerName.items.length,
                itemBuilder: (context, index) {
                  var adresseProvider = providerName.items[index];
                  return AdresseWidget(
                    adresse: adresseProvider,
                    
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),
            AddAdressList() // Ajoutez votre valeur de hauteur ici
            
          ],
        ),
      ),
    );
  }
}
