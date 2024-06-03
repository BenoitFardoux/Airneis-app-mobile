
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
  // final Map<String, dynamic>? panierActuel; 
  // final List<dynamic>? commandes;
  

  UserModel({
    // this.id = 0,
    required this.lastName,
    required this.firstName,
    required this.email,
    this.paiements, 
    this.numeroTelephone,
    this.adresse, 
    // this.panierActuel,
    // this.commandes
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    // List<CardItem>? paiements = json['paiements'] == null ? null :
    // (json['paiements'] as List)
    //   .map((x) => CardItem.fromJson(x as Map<String, dynamic>))
    //   .toList();

    return UserModel(
      // id: json['id'],
      lastName: json['prenom'],
      firstName: json['nom'],
      email: json['email'],
      paiements: List<CardItem>.from(json['paiements'].map((x) => CardItem.fromJson(x))),
      numeroTelephone: json['numeroTelephone'],
      adresse: List<Adresse>.from(json['adresse'].map((x) => Adresse.fromJson(x))),
      // panierActuel: json['panierActuel'],
      // commandes: json['commandes']


      
    );
  }
}
