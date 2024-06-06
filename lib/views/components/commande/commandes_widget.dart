import 'package:flutter/material.dart';
import './../../../models/commande.dart';
import './../../../api/commande.dart';

class CommandesWidget extends StatefulWidget {
  @override
  _CommandesWidgetState createState() => _CommandesWidgetState();
}

class _CommandesWidgetState extends State<CommandesWidget> {
  late Future<Utilisateur> _futureUtilisateur;

  @override
  void initState() {
    super.initState();
    _futureUtilisateur = ApiUtilisateur.fetchUtilisateur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Commandes'),
      ),
      body: FutureBuilder<Utilisateur>(
        future: _futureUtilisateur,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.commandes.length,
              itemBuilder: (context, index) {
                var commande = snapshot.data!.commandes[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Commande ID: ${commande.id}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Date de commande: ${commande.dateDeCommande}'),
                        Text(
                            'Date de livraison: ${commande.dateDeLivraison ?? 'N/A'}'),
                        SizedBox(height: 10),
                        Text('Produits:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ...commande.produits.map((produit) => Text(
                              'Produit ID: ${produit.id}, Quantité: ${produit.quantite}',
                            )),
                        SizedBox(height: 10),
                        Text('Adresse:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Nom: ${commande.adresse.nom}'),
                        Text('Prénom: ${commande.adresse.prenom}'),
                        Text('Rue: ${commande.adresse.numeroDeRue}'),
                        Text('Code Postal: ${commande.adresse.codePostal}'),
                        Text('Ville: ${commande.adresse.ville}'),
                        Text('Pays: ${commande.adresse.pays}'),
                        Text('Téléphone: ${commande.adresse.telephone}'),
                        SizedBox(height: 10),
                        Text('Paiement:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            'Numéro de carte: ${commande.paiement.numeroCarte}'),
                        Text(
                            'Date d\'expiration: ${commande.paiement.dateExpiration}'),
                        Text('Nom sur la carte: ${commande.paiement.nomCarte}'),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Aucune commande trouvée'));
          }
        },
      ),
    );
  }
}
