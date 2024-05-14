import 'package:flutter/material.dart';
import '../views/card_widget.dart'; // Assurez-vous que ce fichier existe et contient la classe CardWidget
import '../views/add_card_list.dart'; // Assurez-vous que ce fichier existe et contient la classe AddCardList

class ManageCards extends StatelessWidget {
  const ManageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CardWidget(numero: 6666, nom: "arnaud"),
            SizedBox(height: 10),
            CardWidget(numero: 6666, nom: "arnaud"),
            SizedBox(height: 10),
            CardWidget(numero: 6666, nom: "arnaud"),
            SizedBox(height: 10),
            AddCardList()
          ],
        ),
      ),
    );
  }
}
