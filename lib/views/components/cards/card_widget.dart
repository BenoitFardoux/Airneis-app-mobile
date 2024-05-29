import 'package:flutter/material.dart';
import '../../../models/card_item.dart';

import 'package:flutter/material.dart';
import '../../../models/card_item.dart';

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
    return Container(
      width: double.infinity, // Utiliser toute la largeur disponible
      margin: EdgeInsets.only(bottom: 10), // Margin pour espacer les cartes
      padding: EdgeInsets.all(10), // Padding interne
      decoration: BoxDecoration(
        color: Colors.blue, // Fond bleu pour toutes les cartes
        borderRadius: BorderRadius.circular(8), // Bords arrondis
        border: Border.all(color: card.isFavorite ? Colors.green : Colors.grey, width: 2), // Bordure pour favoris
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (card.isFavorite) // Marqueur visuel pour carte par défaut
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: Colors.green,
              child: Text('Par Défaut', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          Text('**** **** **** ${card.numero}', style: TextStyle(fontSize: 18, color: Colors.white)),
          Text(card.nom, style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onSetDefault,
                child: Text('Par défaut'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.blue),
              ),
              ElevatedButton(
                onPressed: onEdit,
                child: Text('Modifier'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.blue),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
