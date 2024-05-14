import 'package:flutter/material.dart';

class ProduitDetail extends StatelessWidget {
  const ProduitDetail({super.key});

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
                    ),
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
