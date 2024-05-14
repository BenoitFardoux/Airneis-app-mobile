import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_controller.dart' as sc; // Utiliser un alias

class SearchPage extends StatelessWidget {
    const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sc.SearchController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Articles'),
        ),
        body: Consumer<sc.SearchController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.searchController,
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
                    itemCount: controller.filteredArticles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.filteredArticles[index].title),
                        subtitle: Text(controller.filteredArticles[index].description),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
