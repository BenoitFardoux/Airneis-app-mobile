import 'package:flutter/material.dart';
import 'add_card_payment.dart';

class AddCardList extends StatelessWidget {
  const AddCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ajouter une carte',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontFamily: 'Roboto')),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.amber[400],
            iconSize: 55,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCardPayment()),
              );
            },
          ),
        ],
      ),
    );
  }
}
