import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/auth/profil_screen.dart';
import './../../../colors/colors.dart';
import './../../../utils/secure_storage.dart';
import './../components/mentions/mentions.dart';

import 'package:flutter_second/views/components/auth/login_screen.dart';
import 'cards/manage_cards.dart';
import 'panier/panier_manage.dart';
import 'adresse/manage_adresse.dart';

import '../search_page_filter.dart';
import './../components/checkout/checkout_widget.dart';
import './../components/categorie/categorie_widget.dart';

class NavBar_Icons_Title extends StatelessWidget
    implements PreferredSizeWidget {
  const NavBar_Icons_Title({
    super.key,
    required this.nameOfApplication,
  });

  final String nameOfApplication;

  @override
  Widget build(BuildContext context) {
    var secure = SecureStorage();

    return AppBar(
      backgroundColor: ColorsApp.secondaryColor,
      title: Text(nameOfApplication,
          style: TextStyle(color: ColorsApp.primaryColor)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPageFilter()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PanierManage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class NavBar_Drawer extends StatelessWidget {
  const NavBar_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    var secure = SecureStorage();

    return Drawer(
      child: FutureBuilder<String?>(
        future: secure.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              // Utilisateur connecté, afficher le menu pour les utilisateurs connectés
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: const Text('Mes paramètres'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: const Text('Mes commandes'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: const Text('CGU'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditionsWidget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.gavel),
                    title: const Text('Mentions légales'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LegalNoticeWidget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: const Text('Contact'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: const Text("A propos d'Airneis"),
                    onTap: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUsWidget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: const Text('Déconnexion'),
                    onTap: () {
                      secure.deleteCredentials();
                      Navigator.pop(context);
                    },
                  ),
                  // Ajouter d'autres options spécifiques à l'utilisateur connecté
                ],
              );
            } else {
              // Utilisateur non connecté, afficher le menu pour les visiteurs
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.login),
                    title: const Text('Connexion'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  // Ajouter d'autres options spécifiques à l'utilisateur non connecté
                ],
              );
            }
          } else {
            // En attendant la réponse, afficher un indicateur de chargement
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}