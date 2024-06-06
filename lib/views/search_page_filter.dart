import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_controller_filter.dart' as sc;
import './resultat_search_filter.dart';

class SearchPageFilter extends StatelessWidget {
  const SearchPageFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sc.SearchControllerFilter(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Search Products'),
        ),
        body: Consumer<sc.SearchControllerFilter>(
          builder: (context, controller, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onSubmitted: (value) => controller.filterArticles(),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ExpansionTile(
                        title: Text('Filters'),
                        children: <Widget>[
                          _priceBuilderFilter(controller),
                          _materialsFilter(controller),
                          _categoriesFilter(controller),
                          _dimensionFilters(controller),
                          ElevatedButton(
                            onPressed: () {
                              controller.filterArticles();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FilteredResultPageScreen(
                                            filteredArticles:
                                                controller.filteredArticles,
                                            NomRecherche: controller
                                                .searchController.text
                                                .toLowerCase()
                                                .toString())),
                              );
                            },
                            child: Text('Apply Filters'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _priceBuilderFilter(sc.SearchControllerFilter controller) {
    return ExpansionTile(
      title: Text('Price Range'),
      children: <Widget>[
        _priceFilter(
            "Price",
            controller.priceRange ?? RangeValues(0, 10000),
            0,
            10000,
            (RangeValues values) =>
                controller.updateFilters(newPriceRange: values)),
      ],
    );
  }

  Widget _priceFilter(String label, RangeValues values, double min, double max,
      ValueChanged<RangeValues> onChanged) {
    return Column(
      children: [
        Text(label),
        RangeSlider(
          values: values,
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          labels: RangeLabels(
              values.start.round().toString(), values.end.round().toString()),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _materialsFilter(sc.SearchControllerFilter controller) {
    return ListTile(
      title: Text('Materials'),
      subtitle: Text('Select materials'),
    );
  }

  Widget _categoriesFilter(sc.SearchControllerFilter controller) {
    return ListTile(
      title: Text('Categories'),
      subtitle: Text('Select categories'),
    );
  }
}

Widget _dimensionFilters(sc.SearchControllerFilter controller) {
  return ExpansionTile(
    title: Text('Dimension Filters'),
    children: <Widget>[
      _buildRangeSlider(
          "Height",
          controller.heightRange,
          0,
          300,
          (RangeValues values) =>
              controller.updateFilters(newHeightRange: values)),
      _buildRangeSlider(
          "Width",
          controller.widthRange,
          0,
          300,
          (RangeValues values) =>
              controller.updateFilters(newWidthRange: values)),
      _buildRangeSlider(
          "Depth",
          controller.depthRange,
          0,
          300,
          (RangeValues values) =>
              controller.updateFilters(newDepthRange: values)),
    ],
  );
}

Widget _buildRangeSlider(String label, RangeValues values, double min,
    double max, ValueChanged<RangeValues> onChanged) {
  return Column(
    children: [
      Text(label),
      RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: (max - min).toInt(),
        labels: RangeLabels(
            values.start.round().toString(), values.end.round().toString()),
        onChanged: onChanged,
      ),
    ],
  );
}
