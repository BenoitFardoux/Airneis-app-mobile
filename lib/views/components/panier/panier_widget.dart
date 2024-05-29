import 'package:flutter/material.dart';

class PanierWidget extends StatelessWidget {
  final String titre;
  final String description;

  PanierWidget({super.key, required this.titre, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10), // Margin pour espacer les produits
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Padding interne
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network(
          //   imageUrl,
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(width: 10),  // Espace entre l'image et le texte
          Expanded(  // Ce widget permet au texte de prendre l'espace restant
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,  // Ajoute des points de suspension si le texte dépasse sur une ligne
                  maxLines: 2,  // Permet au titre de s'étendre sur deux lignes maximum
                ),
                SizedBox(height: 4),  // Espace entre le titre et la description
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.fade,  // Fade le texte s'il dépasse de l'espace disponible
                  softWrap: true,  // Retourne à la ligne automatiquement
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
