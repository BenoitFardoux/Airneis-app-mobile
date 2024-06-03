import 'package:flutter/material.dart';
import 'package:flutter_second/models/adresse.dart';

class AdresseWidget extends StatelessWidget {
  final Adresse adresse;

  AdresseWidget({super.key, required this.adresse});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(adresse.prenom),
          Text(adresse.nom),
          Text(adresse.codePostal),
          Text(adresse.informations),
        ],
      ),
    );
  }
}
