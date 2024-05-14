import 'package:flutter/material.dart';
import '../manage_cards.dart'; // Import correct de ManageCards
import '../test.dart'; // Import correct de test
import '../search_page.dart'; // Import correct de CardItem

class NavBar_Icons_Title extends StatelessWidget implements PreferredSizeWidget {
  const NavBar_Icons_Title({
    super.key,
    required this.nameOfApplication,
  });

  final String nameOfApplication;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFBA58268),
      title: Text(nameOfApplication, style: TextStyle(color: Color(0xFFBE6C077))),
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
                MaterialPageRoute(builder: (context) => const ManageCards()), // Ajout de const
              );
            },
          ),
          ListTile(
            title: const Text('list et stateful'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Test()), // Correction du nom de la classe et ajout de const
              );
            },
          ),
          ListTile(
            title: const Text('rechercher un article par mot clé'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()), // Ajout de const
              );
            },
          ),
          ListTile(
            title: const Text('item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
