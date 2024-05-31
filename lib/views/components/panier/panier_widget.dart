import 'package:flutter/material.dart';

class PanierWidget extends StatelessWidget {
  final String titre;
  final String description;
  final String image;
  final double price; 
  final String id; 

  PanierWidget({super.key, required this.id , required this.titre, required this.description, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10), // Margin pour espacer les produits
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Padding interne
      decoration: BoxDecoration(
        color: Colors.grey[200], // Fond gris pour tous les produits
        borderRadius: BorderRadius.circular(8), // Bords arrondis
      ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
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

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text(
              '$price €',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 20,
              child:
            
            TextFormField(
              
              decoration: InputDecoration(
                labelText: 'Quantité',
              ),
            ),
            
            ),

            IconButton(
              icon:Icon(Icons.delete),
              onPressed: () {
                print("supprimer le produit  ${id}");
              },
            ),
           
          ]),
        ],
      ),
    );
  }
}
