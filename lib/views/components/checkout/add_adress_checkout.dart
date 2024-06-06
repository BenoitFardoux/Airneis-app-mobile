import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/views/components/checkout/payment_checkout.dart';
import '../../../models/adresse.dart';
import './../../../controllers/checkout.dart';

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

  AddAdressLess({Key? key, this.adresse}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _numeroCarteController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _informationsController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _departementController = TextEditingController();
  final TextEditingController _paysController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final orderNotifier = Provider.of<OrderNotifier>(context);

    _prenomController.text = adresse?.prenom ?? '';
    _nomController.text = adresse?.nom ?? '';
    _numeroCarteController.text = adresse?.numeroDeRue ?? '';
    _informationsController.text = adresse?.informations ?? '';
    _villeController.text = adresse?.ville ?? '';
    _codePostalController.text = adresse?.codePostal ?? '';
    _departementController.text = adresse?.departement ?? '';
    _paysController.text = adresse?.pays ?? '';
    _telephoneController.text = adresse?.telephone ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ajouter une adresse'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCard(label: 'Prénom', controller: _prenomController),
              TextFieldCard(label: 'Nom', controller: _nomController),
              TextFieldCard(
                  label: 'Numéro de rue', controller: _numeroCarteController),
              TextFieldCard(
                  label: 'Informations', controller: _informationsController),
              TextFieldCard(label: 'Ville', controller: _villeController),
              TextFieldCard(
                  label: 'Code Postal', controller: _codePostalController),
              TextFieldCard(
                  label: 'Département', controller: _departementController),
              TextFieldCard(label: 'Pays', controller: _paysController),
              TextFieldCard(
                  label: 'Téléphone', controller: _telephoneController),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final adresse = {
                      'prenom': '${_prenomController.text}',
                      'nom': '${_nomController.text}',
                      'numeroDeRue': '${_numeroCarteController.text}',
                      'informations': '${_informationsController.text}',
                      'ville': '${_villeController.text}',
                      'codePostal': '${_codePostalController.text}',
                      'departement': '${_departementController.text}',
                      'pays': '${_paysController.text}',
                      'telephone': '${_telephoneController.text}',
                    };
                    orderNotifier.setAdresse(adresse);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentCheckoutWidget()),
                    );
                  }
                },
                child: Text('Passer au paiement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldCard({Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Entrez votre $label',
          border: OutlineInputBorder(),
        ),
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre $label';
          }
          return null;
        },
      ),
    );
  }
}
