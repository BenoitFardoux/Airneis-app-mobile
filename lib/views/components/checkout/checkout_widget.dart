import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/views/main_app.dart';// Assurez-vous que le chemin d'import est correct
import 'package:flutter_second/controllers/adresse_controller.dart';

import 'package:flutter_second/models/adresse.dart';
import 'add_adress_checkout.dart'; 

// Cette classe pourrait être appelée depuis n'importe où dans votre application qui a besoin d'afficher l'écran de checkout.
class CheckoutWidgetScreen extends StatelessWidget {
  const CheckoutWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainApp(body: CheckoutWidget());
  }
}

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  Adresse? selectedAdresse;

  @override
  Widget build(BuildContext context) {
    var providerName = Provider.of<AdresseController>(context, listen: true);

    return 
    Material( 
      child: 
    
    
    SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Utilisez Navigator.pop pour retourner à l'écran précédent
            Navigator.pop(context);
          },
        ),
          GenericDropdown<Adresse>(
            items: providerName.items,
            getDisplayValue: (Adresse adresse) => adresse.informations,
            onSelected: (Adresse adresse) {
              setState(() {
                selectedAdresse = adresse;
              });
            },
            selectedValue: providerName.items.first,
          ),
          selectedAdresse != null
              ? AddAdressCheckout(adresse: selectedAdresse)
              : AddAdressCheckout(),
        ],
      ),
    ),
    );
  }
}

// Pour la sélection de l'adresse
class GenericDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) getDisplayValue;
  final void Function(T) onSelected;
  final T? selectedValue;

  const GenericDropdown({
    Key? key,
    required this.items,
    required this.getDisplayValue,
    required this.onSelected,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(child: 
    DropdownButton<T>(
      value: selectedValue,
      onChanged: (T? newValue) {
        if (newValue != null) {
          onSelected(newValue);
        }
      },
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(getDisplayValue(value)),
        );
      }).toList(),
    )
    
    ,); 
  }
}