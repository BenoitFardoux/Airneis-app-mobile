import 'package:flutter/material.dart';
import '../models/adresse.dart';// Assurez-vous que ce fichier existe et contient la classe CardItem

class AdresseController extends ChangeNotifier {
  List<Adresse> _adresse = [
    Adresse(id: "12", numeroDeRue: "2", informations: "lieutenant colpin", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800"),
    Adresse(id: "13", numeroDeRue: "2", informations: "negrier", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800"),
    Adresse(id: "14", numeroDeRue: "2", informations: "jemmapes", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800"),
    Adresse(id: "15", numeroDeRue: "2", informations: "voltaire", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800"),
    Adresse(id: "16", numeroDeRue: "2", informations: "angleterre", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800")
    
    ];

  List<Adresse> get items => _adresse;

  addItem(Adresse adresse) {
    _adresse.add(adresse);
    print( 'items => ${items}');
    print( 'adresse => ${_adresse}');
    notifyListeners();
  }

  void removeItem(Adresse adresse) {
    _adresse.remove(adresse);
    notifyListeners();
  }

  retrieveProduits(){
    return _adresse.length;
  }


void createAndAddProduct() {
  
}



}



