import './card_item.dart';
import './adresse.dart';

class UserModel {
  // final int? id;
  final String lastName;
  final String firstName;
  final String email;
  final List<CardItem>? paiements;
  final String? numeroTelephone;
  final List<Adresse>? adresse;
  final PanierActuel? panierActuel;
  final List<dynamic>? commandes;

  UserModel({
    // this.id = 0,
    required this.lastName,
    required this.firstName,
    required this.email,
    this.paiements,
    this.numeroTelephone,
    this.adresse,
    this.panierActuel,
    this.commandes
  });

  // TO DO : exception null qui n'apparait pas quand on met les valeurs par défaut à l'aide de "??"

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      // id: json['id'],
      lastName: json['prenom'] ?? 'par défaut',
      firstName: json['nom'] ?? 'par défaut',
      email: json['email'] ?? 'par défaut' , 
      paiements: List<CardItem>.from(
          json['paiements'].map((x) => CardItem.fromJson(x))),
      numeroTelephone: json['numeroTelephone'] ?? 'par défaut',
      adresse:          List<Adresse>.from(json['adresse'].map((x) => Adresse.fromJson(x))),
      panierActuel: PanierActuel.fromJson(json['panierActuel']),
      commandes: json['commandes']
    );
  }
}


class PanierActuel {
  final List<PanierActuelProduit> produits;

  PanierActuel({required this.produits});

  factory PanierActuel.fromJson(Map<String, dynamic> json) {
    return PanierActuel(
      produits: (json['produits'] as List).map((x) => PanierActuelProduit.fromJson(x)).toList(),
    );
  }
}

class PanierActuelProduit {
  final String id;
  final int quantite;

  PanierActuelProduit({required this.id, required this.quantite});

  factory PanierActuelProduit.fromJson(Map<String, dynamic> json) {
    return PanierActuelProduit(
      id: json['id'] ?? '6644c1b8806ba00ddab5f5dd', 
      quantite: json['quantite'] ?? 1,
    );
  }
}
