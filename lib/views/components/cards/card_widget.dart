import 'package:flutter/material.dart';
import '../../../models/card_item.dart';
import './../../../colors/colors.dart';

class CardWidget extends StatelessWidget {
  final CardItem card;
  final VoidCallback onSetDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  CardWidget({
    super.key,
    required this.card,
    required this.onSetDefault,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 175,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF1234CB),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: card.estParDefaut ? Colors.green : Colors.grey, width: 2),
          ),
          child: Column(
            crossAxisAlignment: card.estParDefaut
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.start,
            mainAxisAlignment: card.estParDefaut
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
            children: [
              if (card.estParDefaut)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: Colors.green,
                      child: Text('Par Défaut',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: ColorsApp.errorTextColor),
                      onPressed: onDelete,
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: ColorsApp.errorTextColor),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                    '**** **** **** ${card.numeroCarte.substring(card.numeroCarte.length - 4)}',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                Text(card.nomCarte,
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ]),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: onSetDefault,
              child: Text('Par défaut'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.primaryColor,
                  foregroundColor: ColorsApp.textColor),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
