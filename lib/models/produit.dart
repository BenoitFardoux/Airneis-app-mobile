class Produit {
  final String id;
  final String nom;
  final String description;
  final double prix;
  final Dimension dimension;
  final Categorie categorie;
  final List<ImageProduit> images;
  final List<Materiau> materiaux;

  Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.dimension,
    required this.categorie,
    required this.images,
    required this.materiaux,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'] ?? 'par défaut',
      nom: json['nom'] ?? 'par défaut',
      description: json['description'] ?? 'par défaut',
      prix: json['prix'].toDouble(),
      dimension: Dimension.fromJson(json['dimension']  ?? {}),
      categorie: Categorie.fromJson(json['categorie'] ?? {}),
      images: List<ImageProduit>.from(json['images'].map((x) => ImageProduit.fromJson(x))),
      materiaux: List<Materiau>.from(json['materiaux'].map((x) => Materiau.fromJson(x))),
    );
  }


  @override 
  String toString() {
    return 'Produit : {id: $id, nom: $nom, description: $description, prix: $prix, dimension: $dimension, categorie: $categorie, images: $images, materiaux: $materiaux}';
  }
}

//TO DO : trouver ce qui provoque le Exception during request: TypeError: null: type 'Null' is not a subtype of type 'String'
//TO DO : qui n'apparait pas quand on met les valeurs par défaut à l'aide de "??"

class Dimension {
  final double hauteur;
  final double largeur;
  final double profondeur;

  Dimension(
      {required this.hauteur, required this.largeur, required this.profondeur});

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      hauteur: json['hauteur'] ?? 0.0,
      largeur: json['largeur'] ?? 0.0,
      profondeur: json['profondeur'] ?? 0.0,
    );
  }
}

class Categorie {
  final String id;
  final String nom;

  Categorie({required this.id, required this.nom});

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'] ?? 'par défaut', 
      nom: json['nom'] ?? 'par défaut',
    );
  }
}

class ImageProduit {
  final String url;
  final String description;

  ImageProduit({required this.url, required this.description});

  factory ImageProduit.fromJson(Map<String, dynamic> json) {
    return ImageProduit(
      url: json['url'] ?? 'par défaut',
      description: json['description'] ?? 'par défaut',
    );
  }
}

class Materiau {
  final String id;
  final String nom;

  Materiau({required this.id, required this.nom});

  factory Materiau.fromJson(Map<String, dynamic> json) {
    return Materiau(
      id: json['id'] ?? 'par défaut',
      nom: json['nom'] ?? 'par défaut',
    );
  }
}
