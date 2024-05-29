import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/cards/manage_cards.dart';
import 'package:provider/provider.dart';
// import '../controllers/list_cards_ controller.dart';
import '../../../controllers/item_card_controller.dart';
import 'card_widget.dart';
import '../../../models/card_item.dart';


class AddCardPayment extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      
      child:AddCardPaymentLess(),
    );
  }
}

class AddCardPaymentLess extends StatelessWidget {
   AddCardPaymentLess({super.key});
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardMonthController = TextEditingController();
  final TextEditingController cardYearController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
  var providerName = Provider.of<ItemCardController>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => ItemCardController(),
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
              TextFieldCard(controller: cardNumberController, label: 'Numéro de la carte', placeHolder: 'numéro'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFieldCard(controller: cardMonthController, label: 'Mois', placeHolder: 'mois'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFieldCard(controller: cardYearController, label: 'Année', placeHolder: 'année'),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextFieldCard(controller: cardNameController, label: 'Nom', placeHolder: 'nom'),

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

                  CardItem card = CardItem(numero: int.parse(cardNumber), nom: cardName, Month: cardMonth, Year: cardYear, isFavorite: favorite);
                  
                  providerName.addItem(card);
                  
                  
                   
                  
                  print('Moyen de paiement ajouté');

                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageCardsLess()),
                  );
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