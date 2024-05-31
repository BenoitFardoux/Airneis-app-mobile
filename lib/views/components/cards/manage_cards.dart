import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/item_card_controller.dart';
import 'add_card_list.dart';
import 'card_widget.dart';

class ManageCardsLess extends StatelessWidget {
  const ManageCardsLess({super.key});

  @override
  Widget build(BuildContext context) {
    var providerName = Provider.of<ItemCardController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Manage Cards')),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 20.0), // Ajoutez vos valeurs de padding ici
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: providerName.items.length,
                itemBuilder: (context, index) {
                  var card = providerName.items[index];
                  return CardWidget(
                    card: card,
                    onSetDefault: () => providerName.setDefaultCard(index),
                    onEdit: () {
                      // Logique pour éditer la carte
                      print("Edit logic here");
                    },
                    onDelete: () => providerName.removeItem(card),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0), // Ajoutez votre valeur de hauteur ici
            AddCardList(),
          ],
        ),
      ),
    );
  }
}
