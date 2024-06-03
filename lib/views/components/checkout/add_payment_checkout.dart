import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/cards/manage_cards.dart';
import 'package:provider/provider.dart';
import '../../../controllers/item_card_controller.dart';
import '../../../models/card_item.dart';
import './confirmation_widget.dart';
import 'package:flutter_second/views/main_app.dart';

// class AddCardPaymentCheckoutScreen extends StatelessWidget{
//   const AddCardPaymentCheckoutScreen({super.key, this.card});
//   final CardItem? card;

//   @override
//   Widget build(BuildContext context){
//     return MainApp(body: AddCardPaymentCheckout(card: card));
//   }
// }

class AddCardPaymentCheckout extends StatelessWidget {
  final CardItem? card;

  AddCardPaymentCheckout({super.key, this.card});
  @override
  Widget build(BuildContext context) {
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
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardMonthController = TextEditingController();
  final TextEditingController cardYearController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (card != null) {
      cardNumberController.text = card!.numero.toString();
      cardMonthController.text = card!.Month;
      cardYearController.text = card!.Year;
      cardNameController.text = card!.nom;
    }

    var providerName = Provider.of<ItemCardController>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => ItemCardController(),
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCard(
                  controller: cardNumberController,
                  label: 'Numéro de la carte',
                  placeHolder: 'numéro'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFieldCard(
                        controller: cardMonthController,
                        label: 'Mois',
                        placeHolder: 'mois'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFieldCard(
                        controller: cardYearController,
                        label: 'Année',
                        placeHolder: 'année'),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextFieldCard(
                    controller: cardNameController,
                    label: 'Nom',
                    placeHolder: 'nom'),
              ),
              // Container(
              //   width: 200,
              //   child: TextFieldCard(label: 'CVV', placeHolder: 'CVV'),
              // ),
              // SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  final cardNumber = cardNumberController.text;
                  final cardMonth = cardMonthController.text;
                  final cardYear = cardYearController.text;
                  final cardName = cardNameController.text;
                  var favorite = false;
                  print("mois: $cardMonth, année: $cardYear");

                  CardItem card = CardItem(
                      numero: int.parse(cardNumber),
                      nom: cardName,
                      Month: cardMonth,
                      Year: cardYear,
                      isFavorite: favorite);

                  providerName.addItem(card);

                  print('Moyen de paiement ajouté');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmationWidgetScreen()),
                  );
                },
                child: Text('Ajouter carte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
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
  build(BuildContext context) {
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
