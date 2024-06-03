import 'package:flutter/material.dart';
import '../../../models/card_item.dart';
import './../../../colors/colors.dart';

// import '../../../models/card_item.dart';

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
          height: 175, // Utiliser toute la largeur disponible
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          // Margin pour espacer les cartes
          padding: EdgeInsets.all(10), // Padding interne
          decoration: BoxDecoration(
            color: Color(0xFF1234CB), // Fond bleu pour toutes les cartes
            borderRadius: BorderRadius.circular(8), // Bords arrondis
            border: Border.all(
                color: card.isFavorite ? Colors.green : Colors.grey,
                width: 2), // Bordure pour favoris
          ),
          child: Column(
          crossAxisAlignment: card.isFavorite ? CrossAxisAlignment.start : CrossAxisAlignment.start,
           mainAxisAlignment: card.isFavorite ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceBetween,
            children: [
              if (card.isFavorite)
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                  children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),                
                  color: Colors.green,
                  child: Text('Par Défaut',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
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
                 // Marqueur visuel pour carte par défaut
                    
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Text('**** **** **** ${card.numero.substring(card.numero.length - 4)}',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              Text(card.nom,
                  style: TextStyle(fontSize: 16, color: Colors.white)),

                ]

              ),
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
