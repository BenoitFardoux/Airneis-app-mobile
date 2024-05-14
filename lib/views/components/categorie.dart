import 'package:flutter/material.dart';
import '../second_route.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

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
