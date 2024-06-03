import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/checkout/payment_checkout.dart';
import '../../../models/adresse.dart';

class AddAdressCheckout extends StatelessWidget {
  final Adresse? adresse;

  const AddAdressCheckout({Key? key, this.adresse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
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
          TextFieldCard(
              label: 'Informations', value: adresse?.informations ?? ''),
          TextFieldCard(label: 'Ville', value: adresse?.ville ?? ''),
          TextFieldCard(label: 'Code Postal', value: adresse?.codePostal ?? ''),
          TextFieldCard(
              label: 'Département', value: adresse?.departement ?? ''),
          TextFieldCard(label: 'Pays', value: adresse?.pays ?? ''),
          TextFieldCard(label: 'Téléphone', value: adresse?.telephone ?? ''),
          ElevatedButton(
            onPressed: () {
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

  const TextFieldCard({Key? key, required this.label, required this.value})
      : super(key: key);

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
