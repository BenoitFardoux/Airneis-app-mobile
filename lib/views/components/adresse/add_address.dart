import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/adresse_controller.dart';
import '../../../models/adresse.dart';
import 'manage_adresse.dart';


class AddAdress extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      
      child:AddAdressLess(),
    );
  }
}

class AddAdressLess extends StatelessWidget {
   AddAdressLess({super.key});
  final TextEditingController codePostal = TextEditingController();
  final TextEditingController numeroDeRue= TextEditingController();
  final TextEditingController informations = TextEditingController();
  final TextEditingController ville = TextEditingController();
  final TextEditingController pays = TextEditingController();
  final TextEditingController telephone = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController nom = TextEditingController();
  final TextEditingController departement = TextEditingController();



  @override
  Widget build(BuildContext context) {
  var providerName = Provider.of<AdresseController>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => AdresseController(),
    child:
    

     MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('InputDecoration.label Sample')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCard(controller: prenom, label: 'Prénom', placeHolder: 'Prénom'),
              SizedBox(height: 10),
              TextFieldCard(controller: nom, label: 'Nom', placeHolder: 'Nom'),
              SizedBox(height: 10),
              TextFieldCard(controller: informations, label: 'Informations', placeHolder: 'Informations'),
              SizedBox(height: 10),
              TextFieldCard(controller: ville, label: 'Ville', placeHolder: 'Ville'),
              SizedBox(height: 10),
              TextFieldCard(controller: codePostal, label: 'Code Postal', placeHolder: 'Code Postal'),
              SizedBox(height: 10),
              TextFieldCard(controller: departement, label: 'Département', placeHolder: 'Département'),
              SizedBox(height: 10),
              TextFieldCard(controller: pays, label: 'Pays', placeHolder: 'Pays'),
              SizedBox(height: 10),
              TextFieldCard(controller: telephone, label: 'Téléphone', placeHolder: 'Téléphone'),
              

                ElevatedButton(
                onPressed: () {
                  final prenomController = prenom.text;
                  final nomController = nom.text;
                  final informationsController = informations.text;
                  final villeController = ville.text;
                  final  codePostalController= codePostal.text;
                  final departementController = departement.text;
                  final paysController = pays.text;
                  final telephoneController = ville.text;
                  
                  // var favorite = false;
                  print("prenom: $prenom, telephone: $telephone");

                  Adresse adresse = Adresse(
                    id: "1",
                    numeroDeRue: "10", 
                    prenom: prenomController,
                    nom: nomController,
                    informations: informationsController,
                    ville: villeController,
                    codePostal: codePostalController,
                    departement: departementController,
                    pays: paysController,
                    telephone: telephoneController

                  );
                  
                  providerName.addItem(adresse);
                  
                  
                   
                  
                  print('Nouvelle adresse ajoutée');

                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageAdress()),
                  );
                },
                child: Text('Ajouter une adresse'),
              ),

              
            ],
          ),
        ),
      ),
    ),
    );
  }
}



class TextFieldCard extends StatelessWidget{
   TextFieldCard({
    super.key,
    required this.controller,
    required this.label, 
    required this.placeHolder,
   });

    final TextEditingController controller;
    final String label;
    final String placeHolder;

  @override 
  build(BuildContext context){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Saisir votre ${this.placeHolder}',
        label: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(child: Text(this.label)),
              WidgetSpan(
                child: Text('*', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}