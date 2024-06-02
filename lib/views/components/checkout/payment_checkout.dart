import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import 'package:flutter_second/views/components/adresse/adresse_widget.dart';
import 'package:flutter_second/models/adresse.dart';
import 'add_adress_checkout.dart';
import './checkout_widget.dart';
import './../../../models/card_item.dart'; 
import './add_payment_checkout.dart';// Assurez-vous que le chemin d'import est correct

class PaymentCheckoutWidget extends StatefulWidget {
  const PaymentCheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<PaymentCheckoutWidget> {
  CardItem? selectedCard; // Variable pour stocker l'adresse sélectionnée

  @override
  Widget build(BuildContext context) {
    var providerName = Provider.of<ItemCardController>(context, listen: false);

    return 
    SingleChildScrollView(
      child:
    Column(
      children: [
        GenericDropdown<CardItem>(
          items: providerName.items,
          getDisplayValue: (CardItem card) => card.nom,
          onSelected: (CardItem card) {
            setState(() {
              selectedCard = card; // Mettre à jour le payment sélectionné
            });
          },
          selectedValue: providerName.items.first,
        ),        
        if (selectedCard != null) 
          // Afficher les détails de l'adresse si sélectionnée
           AddCardPaymentCheckout(card: selectedCard)
        else 
          AddCardPaymentCheckout()
      ],
    ),

    );
  }
}




