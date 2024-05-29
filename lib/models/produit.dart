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
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      prix: json['prix'].toDouble(),
      dimension: Dimension.fromJson(json['dimension']),
      categorie: Categorie.fromJson(json['categorie']),
      images: List<ImageProduit>.from(json['images'].map((x) => ImageProduit.fromJson(x))),
      materiaux: List<Materiau>.from(json['materiaux'].map((x) => Materiau.fromJson(x))),
    );
  }
}

class Dimension {
  final double hauteur;
  final double largeur;
  final double profondeur;

  Dimension({required this.hauteur, required this.largeur, required this.profondeur});

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      hauteur: json['hauteur'],
      largeur: json['largeur'],
      profondeur: json['profondeur'],
    );
  }
}

class Categorie {
  final String id;
  final String nom;

  Categorie({required this.id, required this.nom});

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'],
      nom: json['nom'],
    );
  }
}

class ImageProduit {
  final String url;
  final String description;

  ImageProduit({required this.url, required this.description});

  factory ImageProduit.fromJson(Map<String, dynamic> json) {
    return ImageProduit(
      url: json['url'],
      description: json['description'],
    );
  }
}

class Materiau {
  final String id;
  final String nom;

  Materiau({required this.id, required this.nom});

  factory Materiau.fromJson(Map<String, dynamic> json) {
    return Materiau(
      id: json['id'],
      nom: json['nom'],
    );
  }
}
