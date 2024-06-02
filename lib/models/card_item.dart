class CardItem {
  final int numero;
  final String nom;
  final String Month; 
  final String Year; 
   String dateExpiration;
   String codeSecurite; 
  bool isFavorite;



  CardItem({required this.numero, required this.nom, required this.Month, required this.Year,  this.dateExpiration = "par défaut",  this.codeSecurite = "par défaut", this.isFavorite = false});          


  factory CardItem.fromJson(Map<String, dynamic> json) {
    
    return CardItem(
      numero: json['numeroCarte'] ?? 'par défaut number',
      nom: json['nomCarte'] ?? 'par défaut',
      Month: json['Month'] ?? 'par défaut le mois',
      Year: json['Year'] ?? 'par défaut an',
      dateExpiration: json['dateExpiration'] ?? 'par défaut dateExpiration',
      codeSecurite: json['codeSecurite'] ?? 'par défaut codeSecurite',
      isFavorite: json['isFavorite'] ?? false,
    );
  }                      
}
