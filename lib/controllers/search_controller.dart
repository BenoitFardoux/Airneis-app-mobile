import 'package:flutter/material.dart';
import '../models/article.dart';
import './../api/produit.dart';

class SearchController extends ChangeNotifier {
  List<Article> articles = [
    Article(title: 'Shoes', description: 'A variety of shoes.'),
    Article(title: 'Bags', description: 'Different styles of bags.'),
    Article(title: 'Watches', description: 'Luxury and casual watches.'),
  ];

  List _produits = [];
  List get items => _produits;

  List filteredArticles = [];
  TextEditingController searchController = TextEditingController();

  SearchController() {
    retrieveProduits();
  }

  void retrieveProduits()async{
    _produits = await getProduit();   
    
    print("affichage première valeur de json pour voir si ca fonctionne ${_produits[0].titre}");
    searchController.addListener(() {
      filterArticles();
    });

  }  

  void filterArticles() {
    List _articles = [];
    _articles.addAll(_produits);


    if (searchController.text.isNotEmpty) {
      String searchLowercase = searchController.text.toLowerCase();
      _articles.retainWhere((article) {
        // Vérifiez si le titre OU la description contient le texte recherché.
        bool titleContainsSearch = article.titre.toLowerCase().contains(searchLowercase);
        bool descriptionContainsSearch = article.description.toLowerCase().contains(searchLowercase);
        return titleContainsSearch || descriptionContainsSearch;
      });
    }



    filteredArticles = _articles;
    print('affichage de filteredArticles ===========> ');
    print(filteredArticles);
    print('fin de filteredArticles ===========>');
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

