class Produit {
  final String id;
  final int quantite;

  Produit({required this.id, required this.quantite});

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'] ?? 'par défaut',
      quantite: json['quantite'] ?? 0,
    );
  }
}

class Adresse {
  final String codePostal;
  final String numeroDeRue;
  final String informations;
  final String ville;
  final String pays;
  final String telephone;
  final String prenom;
  final String nom;
  final String departement;

  Adresse({
    required this.codePostal,
    required this.numeroDeRue,
    required this.informations,
    required this.ville,
    required this.pays,
    required this.telephone,
    required this.prenom,
    required this.nom,
    required this.departement,
  });

  factory Adresse.fromJson(Map<String, dynamic> json) {
    return Adresse(
      codePostal: json['codePostal'] ?? 'par défaut',
      numeroDeRue: json['numeroDeRue']?? 'par défaut',
      informations: json['informations']?? 'par défaut',
      ville: json['ville'] ?? 'par défaut',
      pays: json['pays'] ?? 'par défaut',
      telephone: json['telephone'] ?? 'par défaut',
      prenom: json['prenom'] ?? 'par défaut',
      nom: json['nom'] ?? 'par défaut',
      departement: json['departement']  ?? 'par défaut',
    );
  }
}

class Paiement {
  final String numeroCarte;
  final String dateExpiration;
  final String codeSecurite;
  final String nomCarte;
  final bool estParDefaut;

  Paiement({
    required this.numeroCarte,
    required this.dateExpiration,
    required this.codeSecurite,
    required this.nomCarte,
    required this.estParDefaut,
  });

  factory Paiement.fromJson(Map<String, dynamic> json) {
    return Paiement(
      numeroCarte: json['numeroCarte'] ?? 'par défaut',
      dateExpiration: json['dateExpiration'] ?? 'par défaut',
      codeSecurite: json['codeSecurite'] ?? 'par défaut',
      nomCarte: json['nomCarte'] ?? 'par défaut',
      estParDefaut: json['estParDefaut'] ?? false,
    );
  }
}

class Commande {
  final List<Produit> produits;
  final String id;
  final Adresse adresse;
  final Paiement paiement;
  final String dateDeCommande;
  final String dateDeLivraison;

  Commande({
    required this.produits,
    required this.id,
    required this.adresse,
    required this.paiement,
    required this.dateDeCommande,
    required this.dateDeLivraison,
  });

  factory Commande.fromJson(Map<String, dynamic> json) {
    var list = json['produits'] as List ?? [];
    List<Produit> produitsList = list.map((i) => Produit.fromJson(i)).toList();

    return Commande(
      produits: produitsList,
      id: json['id'] ?? 'par défaut',
      adresse: Adresse.fromJson(json['adresse']) ?? Adresse(codePostal: 'par défaut', numeroDeRue: 'par défaut', informations: 'par défaut', ville: 'par défaut', pays: 'par défaut', telephone: 'par défaut', prenom: 'par défaut', nom: 'par défaut', departement: 'par défaut'),
      paiement: Paiement.fromJson(json['paiements']) ?? Paiement(numeroCarte: 'par défaut', dateExpiration: 'par défaut', codeSecurite: 'par défaut', nomCarte: 'par défaut', estParDefaut: false),
      dateDeCommande: json['dateDeCommande'] ?? 'par défaut',
      dateDeLivraison: json['dateDeLivraison'] ?? 'par défaut',
    );
  }
}

class Utilisateur {
  final List<Commande> commandes;

  Utilisateur({required this.commandes});

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    var list = json['commandes'] as List ?? [];
    List<Commande> commandesList = list.map((i) => Commande.fromJson(i)).toList();

    return Utilisateur(
      commandes: commandesList ?? [],
    );
  }
}
