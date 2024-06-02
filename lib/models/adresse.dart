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
      numeroDeRue: json['numeroDeRue'],
      informations: json['informations'],
      ville: json['ville'],
      pays: json['pays'],
      telephone: json['telephone'],
      prenom: json['prenom'],
      nom: json['nom'],
      departement: json['departement'],
      codePostal: json['codePostal']
    );
  }

}


