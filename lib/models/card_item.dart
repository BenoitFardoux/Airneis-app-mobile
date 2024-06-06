class CardItem {
  final String numeroCarte;
  String dateExpiration;
  String codeSecurite;
  final String nomCarte;

  bool estParDefaut;

  CardItem(
      {required this.numeroCarte,
      required this.nomCarte,
      this.dateExpiration = "par défaut",
      this.codeSecurite = "par défaut",
      this.estParDefaut = false});

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      numeroCarte: json['numeroCarte'] ?? "par défaut",
      nomCarte: json['nomCarte'] ?? "par défaut",
      dateExpiration: json['dateExpiration'] ?? "par défaut",
      codeSecurite: json['codeSecurite'] ?? "par défaut",
      estParDefaut: json['estParDefaut'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numeroCarte': numeroCarte,
      'dateExpiration': dateExpiration,
      'codeSecurite': codeSecurite,
      'nomCarte': nomCarte,
      'estParDefaut': estParDefaut,
    };
  }
}
