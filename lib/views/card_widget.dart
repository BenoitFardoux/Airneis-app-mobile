import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final int numero;
  final String nom;

  const CardWidget({super.key, required this.numero, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 150,
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
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.numero.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    this.nom,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
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
                    print('supprimer');
                  },
                  child: Text('Supprimer',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
