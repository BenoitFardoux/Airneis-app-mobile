import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/cards/manage_cards.dart';
import 'package:provider/provider.dart';
import '../../../controllers/item_card_controller.dart';

import '../../../models/card_item.dart';

class AddCardPayment extends StatelessWidget {
  final CardItem? card;

  AddCardPayment({super.key, this.card});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: buildListView(),
    );
  }

  Widget buildListView() {
    return Container(
      height: 700,
      width: double.infinity,
      child: AddCardPaymentCheckoutSub(card: card),
    );
  }
}

class AddCardPaymentCheckoutSub extends StatelessWidget {
  AddCardPaymentCheckoutSub({super.key, required this.card});
  final CardItem? card;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardMonthController = TextEditingController();
  final TextEditingController cardYearController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardcodeSecuriteController =
      TextEditingController();
  final TextEditingController carddateExpiration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (card != null) {
      cardNumberController.text = card!.numeroCarte.toString();
      cardcodeSecuriteController.text = card!.dateExpiration;
      cardcodeSecuriteController.text = card!.codeSecurite;
      cardNameController.text = card!.nomCarte;
    }

    var providerName = Provider.of<ItemCardController>(context, listen: false);
    // final orderNotifier = Provider.of<OrderNotifier>(context);
    return ChangeNotifierProvider(
      create: (_) => ItemCardController(),
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldCard(
                    controller: cardNumberController,
                    label: 'Numéro de la carte',
                    placeHolder: 'numéro'),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextFieldCard(
                      controller: cardNameController,
                      label: 'Nom',
                      placeHolder: 'nom'),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldCard(
                          controller: carddateExpiration,
                          label: 'Date d\'expiration',
                          placeHolder: 'mm/aa'),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFieldCard(
                          controller: cardcodeSecuriteController,
                          label: 'cvv',
                          placeHolder: 'cvv'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final cardNumber = cardNumberController.text;

                      final cardName = cardNameController.text;
                      var favorite = false;

                      CardItem card = CardItem(
                          numeroCarte: cardNumber,
                          nomCarte: cardName,
                          codeSecurite: cardcodeSecuriteController.text,
                          dateExpiration: carddateExpiration.text,
                          estParDefaut: favorite);

                      providerName.addItem(card);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageCardsLess()),
                      );
                    }
                  },
                  child: Text('Ajouter carte'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeHolder;

  const TextFieldCard({
    Key? key,
    required this.controller,
    required this.label,
    required this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Saisir votre $placeHolder',
          label: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(child: Text(label)),
                WidgetSpan(
                  child: Text('*', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre $placeHolder';
          }
          return null;
        },
      ),
    );
  }
}
