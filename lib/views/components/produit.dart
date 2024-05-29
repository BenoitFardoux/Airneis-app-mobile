import 'package:flutter/material.dart';
import 'cards/add_card_payment.dart'; // Correction du chemin d'importation

class Produit extends StatelessWidget {
  const Produit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddCardPayment()), // Ajout de const
              // );
            },
            child: Image.network(
                'https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg',
                fit: BoxFit.cover),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Ikea'),
                    Text('description du produit'),
                  ],
                ),
                Text('750 €'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
