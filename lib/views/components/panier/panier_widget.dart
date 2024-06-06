import 'package:flutter_second/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_second/api/user.dart';

class PanierWidget extends StatelessWidget {
  final String titre;
  final String description;
  final String image;
  final double price;
  final int quantity;
  final String id;
  final Function(int) onQuantityChanged;
  final Function onDelete;

  PanierWidget({
    super.key,
    required this.id,
    required this.titre,
    required this.description,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 100,
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsApp.priceColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('${price.toString()} €'),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 50,
                    height: 30,
                    child: TextFormField(
                      initialValue: quantity.toString(),
                      decoration: InputDecoration(
                        labelText: 'Quantité',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        int newQuantity = int.tryParse(value) ?? quantity;
                        onQuantityChanged(newQuantity);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      onPressed: () {
                        deleteProduitPanier(id);
                        onDelete();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
