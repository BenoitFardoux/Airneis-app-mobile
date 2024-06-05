class Adresse{
  final String id;
  final String numeroDeRue;
  final String informations;
  final String ville;
  final String pays;
  final String telephone;
  final String prenom; 
  final String nom;
  final String departement;
  final String codePostal;

  Adresse({required this.id, required this.numeroDeRue, required this.informations, required this.ville, required this.pays, required this.telephone, required this.prenom, required this.nom, required this.departement, required this.codePostal});

  factory Adresse.fromJson(Map<String, dynamic> json) {
    return Adresse(
      id: json['id'] ?? 'par défaut',
      numeroDeRue: json['numeroDeRue']?? 'par défaut',
      informations: json['informations']?? 'par défaut',
      ville: json['ville']?? 'par défaut',
      pays: json['pays']?? 'par défaut',
      telephone: json['telephone']?? 'par défaut',
      prenom: json['prenom']?? 'par défaut',
      nom: json['nom']?? 'par défaut',
      departement: json['departement']?? 'par défaut',
      codePostal: json['codePostal']?? 'par défaut'
    );
  }

}


