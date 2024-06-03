class CardItem {
  final String numero;
  final String nom;
  final String Month; 
  final String Year; 
<<<<<<< HEAD
   String dateExpiration;
   String codeSecurite; 
  bool isFavorite;



  CardItem({required this.numero, required this.nom, required this.Month, required this.Year,  this.dateExpiration = "par défaut",  this.codeSecurite = "par défaut", this.isFavorite = false});          


  factory CardItem.fromJson(Map<String, dynamic> json) {
    
    return CardItem(
      numero: json['numeroCarte'] ,
      nom: json['nomCarte'] ,
      Month: json['Month'],
      Year: json['Year'],
      dateExpiration: json['dateExpiration'],
      codeSecurite: json['codeSecurite'],
      isFavorite: json['isFavorite'],
    );
  }                      
=======
  bool isFavorite;


  CardItem({required this.numero, required this.nom, required this.Month, required this.Year, required this.isFavorite});                                
>>>>>>> main
}
