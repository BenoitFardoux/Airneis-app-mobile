import 'package:flutter/material.dart';
import '../models/article.dart';

class SearchController extends ChangeNotifier {
  List<Article> articles = [
    Article(title: 'Shoes', description: 'A variety of shoes.'),
    Article(title: 'Bags', description: 'Different styles of bags.'),
    Article(title: 'Watches', description: 'Luxury and casual watches.'),
  ];

  List<Article> filteredArticles = [];
  TextEditingController searchController = TextEditingController();

  SearchController() {
    filteredArticles = articles;
    searchController.addListener(() {
      filterArticles();
    });
  }

  void filterArticles() {
    List<Article> _articles = [];
    _articles.addAll(articles);
    if (searchController.text.isNotEmpty) {
      _articles.retainWhere((article) {
        return article.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      });
    }
    filteredArticles = _articles;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
