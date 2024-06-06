import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/item_card_controller.dart';
import './checkout_widget.dart';
import './../../../models/card_item.dart';
import './add_payment_checkout.dart';

class PaymentCheckoutWidget extends StatefulWidget {
  const PaymentCheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<PaymentCheckoutWidget> {
  CardItem? selectedCard;

  @override
Widget build(BuildContext context) {
    var providerName = Provider.of<ItemCardController>(context, listen: true);    

    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          providerName.items.isNotEmpty 
            ? GenericDropdown<CardItem>(
                items: providerName.items,
                getDisplayValue: (CardItem card) => card.nomCarte,
                onSelected: (CardItem card) {
                  setState(() {
                    selectedCard = card;
                  });
                },
                selectedValue: providerName.items.first,
              )
            : Text("No cards available"),
          selectedCard != null
            ? AddCardPaymentCheckout(card: selectedCard)
            : AddCardPaymentCheckout(),
        ],
      ),
    );
  }

}
