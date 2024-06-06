import 'package:flutter/material.dart';
import './../../../api/user.dart';
import './../../../models/user_model.dart';
import './../adresse/manage_adresse.dart';
import './../cards/manage_cards.dart';
import './../../main_app.dart';

class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp(body: UserProductsScreen());
  }
}

class UserProductsScreen extends StatefulWidget {
  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  late Future<UserModel> userData;

  @override
  void initState() {
    super.initState();
    userData = informationsUtilisateurAPI();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<UserModel>(
              future: userData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Erreur: ${snapshot.error}"));
                  }

                  if (snapshot.hasData) {
                    return Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Bienvenue sur ton espace personnel, ${snapshot.data!.lastName} ${snapshot.data!.firstName}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text("Aucune donnée disponible"));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: 30),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: Icon(Icons.credit_card),
                title: Text("Mes cartes"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageCardsLess()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Mes adresses"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageAdress()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
