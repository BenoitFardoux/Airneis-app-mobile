import 'package:flutter/material.dart';
import 'package:flutter_second/models/categorie.dart';
import 'package:flutter_second/api/categorie.dart';
import 'category_detail_page.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.id});
  final String id;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<Category> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = fetchCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
      future: futureCategory,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => categorieScreen(id: widget.id),
                ),
              );
            },
            child: Container(
              height: 200,
              child: CategorySection(
                name: snapshot.data!.name,
                imageUrl: snapshot.data!.image.url,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class CategorySection extends StatelessWidget {
  final String name;
  final String imageUrl;

  CategorySection({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network(imageUrl),
          Container(
            color: Colors.black45,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
