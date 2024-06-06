import 'package:flutter/material.dart';
import 'package:flutter_second/views/components/auth/profil_screen.dart';
import 'package:flutter_second/views/homepage.dart';
import './../../../colors/colors.dart';
import './../../../utils/secure_storage.dart';
import './../components/mentions/mentions.dart';
import 'package:flutter_second/views/components/auth/login_screen.dart';
import 'package:flutter_second/views/components/auth/register_screen.dart';
import 'package:flutter_second/views/components/commande/commandes_widget.dart';
import 'panier/panier_manage.dart';
import '../search_page_filter.dart';

class NavBar_Icons_Title extends StatelessWidget
    implements PreferredSizeWidget {
  const NavBar_Icons_Title({
    super.key,
    required this.nameOfApplication,
  });

  final String nameOfApplication;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () async {
            String? token = await SecureStorage().readToken();
            if (token == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PanierManage()),
              );
            }
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
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePageScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: const Text('Mes paramètres'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInformations()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: const Text('Mes commandes'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommandesWidget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: const Text('CGU'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TermsAndConditionsWidgetScreen()),
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
                            builder: (context) => LegalNoticeWidgetScreen()),
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
                            builder: (context) => AboutUsWidgetScreen()),
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
                ],
              );
            } else {
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
                  ListTile(
                    leading: Icon(Icons.person_add),
                    title: const Text('S\'inscrire'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: const Text('CGU'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsWidgetScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.gavel),
                    title: const Text('Mentions légales'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LegalNoticeWidgetScreen()),
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
                    title: const Text('A propos d\'Airneis'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsWidgetScreen()),
                      );
                    },
                  ),
                ],
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
