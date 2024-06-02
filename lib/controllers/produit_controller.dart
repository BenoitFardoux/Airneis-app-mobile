import 'package:flutter/material.dart';
// import 'package:flutter_second/views/components/produit.dart';

// import '../api/produit.dart'; 
import '../models/produit.dart';// Assurez-vous que ce fichier existe et contient la classe CardItem

class ProduitControllerTest extends ChangeNotifier {

  
  List _produits = [Produit(
    id: "1",
    nom: "Chaise Moderne",
    description: "Une chaise moderne confortable et élégante",
    prix: 120.0,
    dimension: Dimension(
      hauteur: 120.0,
      largeur: 50.0,
      profondeur: 40.0,
    ),
    categorie: Categorie(
      id: "cat1",
      nom: "Meubles",
    ),
    images: [
      ImageProduit(
        url: "https://media.istockphoto.com/id/1675290745/fr/photo/concept-zero-gravity-avec-canap%C3%A9-volant-plante-lampadaire-et-objets-dans-le-salon.jpg?s=2048x2048&w=is&k=20&c=05Cp907vzYzhv6dsYbLC3wuCiQVG_fda4U0SHOMi-84=",
        description: "Vue de face de la chaise moderne",
      )
    ],
    materiaux: [
      Materiau(
        id: "mat1",
        nom: "Bois",
      )
    ],
  ),
  
  Produit(
    id: "2",
    nom: "Canapé",
    description: "Une chaise moderne confortable et élégante",
    prix: 120.0,
    dimension: Dimension(
      hauteur: 120.0,
      largeur: 50.0,
      profondeur: 40.0,
    ),
    categorie: Categorie(
      id: "cat1",
      nom: "Meubles",
    ),
    images: [
      ImageProduit(
        url: "https://media.istockphoto.com/id/1675290745/fr/photo/concept-zero-gravity-avec-canap%C3%A9-volant-plante-lampadaire-et-objets-dans-le-salon.jpg?s=2048x2048&w=is&k=20&c=05Cp907vzYzhv6dsYbLC3wuCiQVG_fda4U0SHOMi-84=",
        description: "Vue de face de la chaise moderne",
      )
    ],
    materiaux: [
      Materiau(
        id: "mat1",
        nom: "Bois",
      )
    ],
  )
  
  
  ];

  List get items => _produits;

  addItem(Produit produit) {
    _produits.add(produit);
    print( 'items => ${items}');
    print( 'produis => ${_produits}');
    notifyListeners();
  }

  void removeItem(Produit produit) {
    _produits.remove(produit);
    notifyListeners();
  }

  retrieveProduits(){
    return _produits.length;
  }





}



