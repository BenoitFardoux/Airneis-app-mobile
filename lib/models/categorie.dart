import './produit.dart';

class Category {
  final String name;
  final ImageDetails image;
  final List<Produit> products;

  Category({required this.name, required this.image, required this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    var productList = json['produits'] as List? ?? [];
    List<Produit> productsList = productList.map((i) => Produit.fromJson(i)).toList();

    return Category(
      name: json['nom'] ?? 'par défaut',
      image: ImageDetails.fromJson(json['image']) ?? ImageDetails(url: 'par défaut', description: 'par défaut'),
      products: productsList,
    );
  }

  String toString() {
    return 'Category : {name: $name, image: $image, products: $products}';
  }
}

class ImageDetails {
  final String url;
  final String description;

  ImageDetails({required this.url, required this.description});

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      url: json['url'] ?? 'par défaut',
      description: json['description'] ?? 'par défaut',
    );
  }

  @override
  String toString() {
   
    return 'ImageDetails : {url: $url, description: $description}';
  }
}
