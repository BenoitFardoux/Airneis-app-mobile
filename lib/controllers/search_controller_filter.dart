

import 'package:flutter/material.dart';
import '../models/article.dart';
import './../api/produit.dart';

class SearchControllerFilter extends ChangeNotifier {
  List articles = [];
  List filteredArticles = [];
  TextEditingController searchController = TextEditingController();

  // double? priceMin;
  // double? priceMax;
  RangeValues? priceRange = RangeValues(0, 10000);
  RangeValues heightRange = RangeValues(0, 300); // Valeurs par défaut
  RangeValues widthRange = RangeValues(0, 300);
  RangeValues depthRange = RangeValues(0, 300);
  
  List<String> selectedMaterials = [];
  List<String> selectedCategories = [];
  bool inStockOnly = false;


  SearchControllerFilter() {
    
    retrieveProduits();
    searchController.addListener(() {
      filterArticles();
    });
  }

  Future<void> retrieveProduits() async {
    try {
      articles = await getProduit();
      print('dans api produit --------------'); 
      print(articles); 
      filteredArticles = articles;
      notifyListeners();
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  void filterArticles() {
    String searchLowercase = searchController.text.toLowerCase();
    filteredArticles = articles.where((article) {
      bool matchesText = article.nom.toLowerCase().contains(searchLowercase) || 
                         article.description.toLowerCase().contains(searchLowercase);
      bool matchesPrice = priceRange == null || 
                          (article.prix >= priceRange!.start && article.prix <= priceRange!.end);
      bool matchesMaterials = selectedMaterials.isEmpty || 
                              selectedMaterials.any(article.materials.contains);
      bool matchesCategories = selectedCategories.isEmpty || 
                               selectedCategories.contains(article.category);
      bool matchesDimensions = article.dimension.hauteur >= heightRange.start &&
                             article.dimension.hauteur <= heightRange.end &&
                             article.dimension.largeur >= widthRange.start &&
                             article.dimension.largeur <= widthRange.end &&
                             article.dimension.profondeur >= depthRange.start &&
                             article.dimension.profondeur <= depthRange.end;
      // bool matchesStock = !inStockOnly || (inStockOnly && article.inStock);
      
      return matchesText && matchesPrice && matchesMaterials && matchesCategories && matchesDimensions ; // && matchesStock;
    }).toList();
    print('Filtered articles: ==============' ); 
    print(filteredArticles);
    print('Fin de filtered articles ==============');
    notifyListeners();
  }

  void updateFilters({
   RangeValues? newPriceRange,
    List<String>? newMaterials,
    List<String>? newCategories,
     RangeValues? newHeightRange,
    RangeValues? newWidthRange,
    RangeValues? newDepthRange,
    // bool? newInStockOnly
  }) {
    if(newPriceRange != null) priceRange = newPriceRange;
    selectedMaterials = newMaterials ?? selectedMaterials;
    selectedCategories = newCategories ?? selectedCategories;
    if (newHeightRange != null) heightRange = newHeightRange;
    if (newWidthRange != null) widthRange = newWidthRange;
    if (newDepthRange != null) depthRange = newDepthRange;
    // inStockOnly = newInStockOnly ?? inStockOnly;
    filterArticles();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
