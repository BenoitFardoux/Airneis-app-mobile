import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/checkout/payment_checkout.dart';
import 'package:provider/provider.dart';
import '../../../controllers/adresse_controller.dart';
import '../../../models/adresse.dart';
import './../adresse/manage_adresse.dart';
import 'add_payment_checkout.dart';
import 'package:flutter_second/views/main_app.dart';

// class AddAdressCheckoutScreen extends StatelessWidget {
//   const AddAdressCheckoutScreen({super.key, this.adresse});
//   final Adresse? adresse;

//   @override
//   Widget build(BuildContext context) {
//     return MainApp(body: AddAdressCheckout(adresse: adresse));
//   }
// }

// class AddAdressCheckout extends StatelessWidget {
//   final Adresse? adresse;

//   AddAdressCheckout({super.key, this.adresse});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 900,
//       // width: double.infinity,
//       child: AddAdressLess(adresse: adresse),
//     );
//   }
// }

// class AddAdressLess extends StatelessWidget {
//   AddAdressLess({super.key, this.adresse});
//   final Adresse? adresse;
//   final TextEditingController codePostal = TextEditingController();
//   final TextEditingController numeroDeRue = TextEditingController();
//   final TextEditingController informations = TextEditingController();
//   final TextEditingController ville = TextEditingController();
//   final TextEditingController pays = TextEditingController();
//   final TextEditingController telephone = TextEditingController();
//   final TextEditingController prenom = TextEditingController();
//   final TextEditingController nom = TextEditingController();
//   final TextEditingController departement = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     if (adresse != null) {
//       prenom.text = adresse!.prenom;
//       nom.text = adresse!.nom;
//       informations.text = adresse!.informations;
//       ville.text = adresse!.ville;
//       codePostal.text = adresse!.codePostal;
//       departement.text = adresse!.departement;
//       pays.text = adresse!.pays;
//       telephone.text = adresse!.telephone;
//     }
//     var providerName = Provider.of<AdresseController>(context, listen: false);
//     return ChangeNotifierProvider(
//       create: (_) => AdresseController(),
//       // child: SingleChildScrollView(
//         child: Material(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 50),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFieldCard(
//                     controller: prenom, label: 'Prénom', placeHolder: 'Prénom'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: nom, label: 'Nom', placeHolder: 'Nom'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: informations,
//                     label: 'Informations',
//                     placeHolder: 'Informations'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: ville, label: 'Ville', placeHolder: 'Ville'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: codePostal,
//                     label: 'Code Postal',
//                     placeHolder: 'Code Postal'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: departement,
//                     label: 'Département',
//                     placeHolder: 'Département'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: pays, label: 'Pays', placeHolder: 'Pays'),
//                 SizedBox(height: 10),
//                 TextFieldCard(
//                     controller: telephone,
//                     label: 'Téléphone',
//                     placeHolder: 'Téléphone'),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     final prenomController = prenom.text;
//                     final nomController = nom.text;
//                     final informationsController = informations.text;
//                     final villeController = ville.text;
//                     final codePostalController = codePostal.text;
//                     final departementController = departement.text;
//                     final paysController = pays.text;
//                     final telephoneController = ville.text;

//                     // var favorite = false;
//                     print("prenom: $prenom, telephone: $telephone");

//                     Adresse adresse = Adresse(
//                         id: "1",
//                         numeroDeRue: "10",
//                         prenom: prenomController,
//                         nom: nomController,
//                         informations: informationsController,
//                         ville: villeController,
//                         codePostal: codePostalController,
//                         departement: departementController,
//                         pays: paysController,
//                         telephone: telephoneController);

//                     providerName.addItem(adresse);

//                     print('Nouvelle adresse ajoutée');

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PaymentCheckoutWidget()),
//                     );
//                   },
//                   child: Text('Passer au paiement'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       // ),
//     );
//   }
// }

// class TextFieldCard extends StatelessWidget {
//   TextFieldCard({
//     super.key,
//     required this.controller,
//     required this.label,
//     required this.placeHolder,
//   });

//   final TextEditingController controller;
//   final String label;
//   final String placeHolder;

//   @override
//   build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: 'Saisir votre ${this.placeHolder}',
//         label: Text.rich(
//           TextSpan(
//             children: [
//               WidgetSpan(child: Text(this.label)),
//               WidgetSpan(
//                 child: Text('*', style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class AddAdressCheckout extends StatelessWidget {
  final Adresse? adresse;

  const AddAdressCheckout({Key? key, this.adresse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900, // Utiliser une taille fixe peut être risqué si le contenu dépasse cette hauteur
      width: double.infinity,
      child: AddAdressLess(adresse: adresse),
    );
  }
}

class AddAdressLess extends StatelessWidget {
  final Adresse? adresse;

  const AddAdressLess({Key? key, this.adresse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          TextFieldCard(label: 'Prénom', value: adresse?.prenom ?? ''),
          TextFieldCard(label: 'Nom', value: adresse?.nom ?? ''),
          TextFieldCard(label: 'Informations', value: adresse?.informations ?? ''),
          TextFieldCard(label: 'Ville', value: adresse?.ville ?? ''),
          TextFieldCard(label: 'Code Postal', value: adresse?.codePostal ?? ''),
          TextFieldCard(label: 'Département', value: adresse?.departement ?? ''),
          TextFieldCard(label: 'Pays', value: adresse?.pays ?? ''),
          TextFieldCard(label: 'Téléphone', value: adresse?.telephone ?? ''),
          ElevatedButton(
            onPressed: () {
              // Logique pour passer au paiement ou traiter les informations
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentCheckoutWidget()),
                    );

            },
            child: Text('Passer au paiement'),
          ),
        ],
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final String label;
  final String value;

  const TextFieldCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Entrez votre $label',
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController()..text = value,
      ),
    );
  }
}