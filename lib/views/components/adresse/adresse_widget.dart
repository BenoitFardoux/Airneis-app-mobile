import 'package:flutter/material.dart';
import 'package:flutter_second/models/adresse.dart';


class AdresseWidget extends StatelessWidget {
  final Adresse adresse;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AdresseWidget({
    Key? key,
    required this.adresse,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nom: ${adresse.nom} ${adresse.prenom}', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
            Text('Adresse: ${adresse.numeroDeRue}'),
            Text('Informations: ${adresse.informations}'),
            Text('Ville: ${adresse.ville}, ${adresse.codePostal}, ${adresse.departement}'),
            Text('Pays: ${adresse.pays}'),
            Text('Téléphone: ${adresse.telephone}'),
          ],
        ),
      ),
    );
  }
}
