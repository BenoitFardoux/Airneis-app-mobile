import 'package:flutter/material.dart';
import './../../../api/user.dart';
import './../../../models/user_model.dart';
import './../adresse/manage_adresse.dart';
import './../cards/manage_cards.dart';
import './../../main_app.dart';

class UserProductsScreen extends StatefulWidget {
  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  late Future<UserModel> userData;

  @override
  void initState() {
    super.initState();
    userData = informationsUtilisateurAPI(); // Initialize the future
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(height: 20),
      FutureBuilder<UserModel>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Erreur: ${snapshot.error}"));
            }

            if (snapshot.hasData) {
              return Center(
                child: Text(
                    "Bienvenue sur ton espace personnel, ${snapshot.data!.lastName} ${snapshot.data!.firstName}",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              );
            } else {
              return Center(child: Text("Aucune donnée disponible"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      Material(
          child: Column(
        children: [
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageCardsLess()),
              );
            },
            child: Text("Mes cartes",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageAdress()),
              );
            },
            child: Text("Mes adresses",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainApp()),
              );
            },
            child: Text("Home",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0)),
          ),
        ],
      ))
    ]);
  }
}
