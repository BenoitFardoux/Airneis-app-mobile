import 'package:flutter/material.dart';
import '../models/adresse.dart';// Assurez-vous que ce fichier existe et contient la classe CardItem

class AdresseController extends ChangeNotifier {
  List _adresse = [Adresse(id: "12", numeroDeRue: "2", informations: "lieutenant colpin", ville: "Lille", pays: "France", telephone: "067567668", prenom: "anraud", nom: "rein ", departement: "nord", codePostal: "59800")];

  List get items => _adresse;

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



