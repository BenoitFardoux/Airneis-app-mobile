import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> fetchAlbumDetail(var id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<String> Poster() async {
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?t=batman&apikey=5e975dd0'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = jsonDecode(response.body);
    print(data);
    print(data['Poster']);

    return data['Poster'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Test';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: NavBar_Icons_Title(nameOfApplication: appTitle),
        drawer: NavBar_Drawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Vous pouvez ajuster les proportions en fonction de vos besoins
              MyCarouselWidget(),

              Container(
                // Ajustement des proportions
                alignment: Alignment.center,
                padding: EdgeInsets.all(48.0),
                child: categorie(),
              ),
              Container(
                // Ajustement des proportions
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: categorie(),
              ),

              Container(
                child: Text("section"),
              ),

              Container(
                // Ajustement des proportions
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: produit(),
              ),
              Container(
                // Ajustement des proportions
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: produit(),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}

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
      backgroundColor: Color(0xFFBA58268),
      title:
          Text(nameOfApplication, style: TextStyle(color: Color(0xFFBE6C077))),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Ici, vous pouvez ajouter l'action du bouton
            print('Recherche démarrée');
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // Ici, vous pouvez ajouter l'action du bouton
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
              MaterialPageRoute(builder: (context) => const ManageCards()),
            );
          },
        ),
        ListTile(
          title: const Text('list et stateful'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  test()),
            );
          },
        ),
        ListTile(
          title: const Text('rechercher un article par mot clé'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SearchPage()),
            );
          },
        ),
        ListTile(
          title: const Text('item 2'),
          onTap: () {},
        ),
      ],
    ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class MyCarouselWidget extends StatelessWidget {
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg',
    'https://m.media-amazon.com/images/M/MV5BZjRjOTFkOTktZWUzMi00YzMyLThkMmYtMjEwNmQyNzliYTNmXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_SX300.jpg',
    'https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Obtenez la taille de l'écran

    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.3, // Hauteur personnalisée du carrousel
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction:
            1.0, // Assurez-vous que chaque image prend toute la largeur du viewport
      ),
      items: imageUrls
          .map((url) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(imageUrl: url),
                      ));
                },
                child: Container(
                  width: size
                      .width, // Appliquez la largeur de l'écran au conteneur
                  child: Image.network(url,
                      fit: BoxFit
                          .cover), // Utilisez BoxFit.cover pour remplir l'espace
                ),
              ))
          .toList(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  DetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Detail')),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

class categorie extends StatelessWidget {
  const categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
          child: Container(
            height: 230,
            width: 200,
            child: Image.network(
                'https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg',
                fit: BoxFit.cover),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
          child: Text('test'),
        ),
      ],
    );
  }
}

class produit extends StatelessWidget {
  const produit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardPayment()),
                );
              },
              child: Image.network(
                  'https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg',
                  fit: BoxFit.cover)),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Ikea'),
                    Text('description du produit'),
                  ],
                ),
                Text('750 €'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class produit_detail extends StatelessWidget {
  const produit_detail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Image.network(
                "https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(110, 0, 110, 0),
                      child: Row(
                        children: [Text('test'), Spacer(), Text('test')],
                      ),
                    ),
                    Text('description du produitdescription du produit'),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(200, 0, 200, 0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Bouton 1'),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Bouton 2'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardPayment extends StatelessWidget {
  const AddCardPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('InputDecoration.label Sample')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: Text('Numéro de carte')),
                        WidgetSpan(
                          child: Text('*', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Réduit l'espacement vertical
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(child: Text('Mois')),
                              WidgetSpan(
                                child: Text('*',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 20), // Espace horizontal entre les deux champs
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(child: Text('Année')),
                              WidgetSpan(
                                child: Text('*',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Text('CVV')),
                          WidgetSpan(
                            child:
                                Text('*', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: Text('Nom de la carte')),
                        WidgetSpan(
                          child: Text('*', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Ajoutez ici l'action du bouton
                  print('Paiement effectué');
                  
                },
                child: Text('Payer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final int numero;
  final String nom;
  const Card({super.key, required this.numero, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Column(
        // Container qui va agir comme un carré
        children: [
          Container(
            width: 250, // Largeur du carré
            height:
                150, // Hauteur du carré, identique à la largeur pour former un carré
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'par Défaut',
                      style: TextStyle(
                        fontSize: 20, // Taille de la police
                        fontFamily: 'Roboto', // Famille de la police
                        color: Colors.black, // Couleur du texte
                      ),
                    ), // Nom de la boutique
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.numero.toString(),
                      style: TextStyle(
                        fontSize: 20, // Taille de la police
                        fontFamily: 'Roboto', // Famille de la police
                        color: Colors.black, // Couleur du texte
                      ),
                    ),
                    Text(
                      this.nom,
                      style: TextStyle(
                        fontSize: 20, // Taille de la police
                        fontFamily: 'Roboto', // Famille de la police
                        color: Colors.black, // Couleur du texte
                      ),
                    ),
                  ],
                )
                // Prix du produit
              ],
            ), // Couleur du carré
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    // Ajoutez ici l'action du bouton
                    print('Par défaut');
                  },
                  child: Text('Par défaut',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              Container(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    // Ajoutez ici l'action du bouton
                    print('supprimer');
                  },
                  child: Text('Supprimer',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              )
            ],
          )),
        ]);
  }
}

class ManageCards extends StatelessWidget {
  const ManageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
    child: Container(
        child: Column(
      children: [
        Card(numero: 6666, nom: "arnaud"),
        SizedBox(
          height: 10,
        ),
        Card(numero: 6666, nom: "arnaud"),
        SizedBox(
          height: 10,
        ),
        Card(numero: 6666, nom: "arnaud"),
        SizedBox(
          height: 10,
        ),
        AddCardList()
      ],
    ))

    );
    
  }
}

class AddCardList extends StatelessWidget {
  const AddCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ajouter une carte', style: TextStyle(color: Colors.amber, fontSize: 20, fontFamily: 'Roboto')),
          IconButton(
            icon: Icon(Icons.add),
            color:Colors.amber[400],
            iconSize:55,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCardPayment()),
              );
            },
          ),
        ],

    
      ),
    );
  }
}

class AppStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 20, // Taille de la police
    fontFamily: 'Roboto', // Famille de la police
    color: Colors.black, // Couleur du texte
  );

  // Vous pouvez ajouter plus de styles ici
}


class ItemCard extends ChangeNotifier{

  List<Card> _items; 

  ItemCard() : _items = [Card(numero: 666, nom: 'test dans le notify'),]; 
 

  List<Card> get items => _items; 

  void addItem(){
    _items.add(Card(numero: 555, nom: "arnaud rein")); 
    notifyListeners(); 
  } 

  void removeItem(Card CardItem) {
    _items.remove(CardItem); // Retire un article du panier
    notifyListeners(); // Notifie les écouteurs après la mise à jour
  }

 
}



class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemCard(), // Crée l'instance de CartModel
      child: MaterialApp(
        home: CartPage(), // La page principale qui utilisera CartModel
      ),
    );
  }
}


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ItemCard>(context); // Accède au modèle de cart
    return Scaffold(
      appBar: AppBar(title: Text("Cart Example")),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          title: cart.items[index] , // Affiche le nom de l'article
         // Nombre d'articles dans le panier
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => cart.removeItem(cart.items[index]), // Supprime l'article du panier
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cart.addItem(), // Ajoute un nouvel article
        child: Icon(Icons.add),
      ),
    );
  }
}


class Article {
  final String title;
  final String description;

  Article({required this.title, required this.description});
}



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Article> articles = [
    Article(title: 'Shoes', description: 'A variety of shoes.'),
    Article(title: 'Bags', description: 'Different styles of bags.'),
    Article(title: 'Watches', description: 'Luxury and casual watches.'),
  ];

  List<Article> filteredArticles = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredArticles = articles;
    _searchController.addListener(() {
      filterArticles();
    });
  }

  void filterArticles() {
    List<Article> _articles = [];
    _articles.addAll(articles);
    if (_searchController.text.isNotEmpty) {
      _articles.retainWhere((article) {
        return article.title
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      });
    }
    setState(() {
      filteredArticles = _articles;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Articles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredArticles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredArticles[index].title),
                  subtitle: Text(filteredArticles[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}