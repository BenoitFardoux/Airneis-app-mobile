import 'package:flutter/material.dart';
import './../../../colors/colors.dart';
import 'package:flutter_second/views/components/auth/login.dart';
// import 'package:flutter_second/views/components/cards/add_card_payment.dart';
// import 'package:provider/provider.dart';
// import './../components/auth/register_screen.dart'; 
import 'package:flutter_second/views/components/auth/login_screen.dart';
import 'cards/manage_cards.dart'; // Import correct de ManageCards
import 'panier/panier_manage.dart'; // Import correct de ManageCards
// import '../test.dart'; // Import correct de test
import '../search_page.dart'; // Import correct de CardItem
import '../search_page_filter.dart'; // Import correct de CardItem

class NavBar_Icons_Title extends StatelessWidget
    implements PreferredSizeWidget {
  const NavBar_Icons_Title({
    super.key,
    required this.nameOfApplication,
  });

  final String nameOfApplication;

  @override
  Widget build(BuildContext context) {
    return 
    
    AppBar(
      backgroundColor: ColorsApp.secondaryColor,
      title:
          Text(nameOfApplication, style: TextStyle(color: ColorsApp.primaryColor)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
        ),
       
        if (true) // Afficher l'icône d'inscription si non connecté
          // Afficher l'icône de profil si connecté
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              // Navigator.pushNamed(context, '/profile');
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
            },
          )
        else
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigator.pushNamed(context, '/users');
            },
          ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print('Alerte ajoutée');
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
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Gestion des cartes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageCardsLess()), // Ajout de const
              );
            },
          ),
         
         
          ListTile(
            title: const Text('rechercher un article par mot clé'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchPage()), // Ajout de const
              );
            },
          ),
          ListTile(
            title: const Text('panier'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PanierManage()), // Ajout de const
              );
            },
          ),
          ListTile(
            title: const Text('new panier with filters'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPageFilter()), // Ajout de const
              );
            },
          ),
          
        ],
      ),
    );
  }
}
