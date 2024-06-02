import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_second/controllers/adresse_controller.dart';
import 'package:flutter_second/views/components/adresse/adresse_widget.dart';
import 'package:flutter_second/models/adresse.dart';
import 'add_adress_checkout.dart'; // Assurez-vous que le chemin d'import est correct

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  Adresse? selectedAdresse; // Variable pour stocker l'adresse sélectionnée

  @override
  Widget build(BuildContext context) {
    var providerName = Provider.of<AdresseController>(context, listen: false);

    return 
    SingleChildScrollView(
      child:
    Column(
      children: [
        GenericDropdown<Adresse>(
          items: providerName.items,
          getDisplayValue: (Adresse adresse) => adresse.informations,
          onSelected: (Adresse adresse) {
            setState(() {
              selectedAdresse = adresse; // Mettre à jour l'adresse sélectionnée
            });
          },
          selectedValue: providerName.items.first,
        ),        
        if (selectedAdresse != null) 
          // Afficher les détails de l'adresse si sélectionnée
           AddAdressCheckout(adresse: selectedAdresse)
        else 
          AddAdressCheckout(), // Ajouter le widget AddAdressCheckout
          // Afficher un message si aucune adresse n'est sélectionnée
          // Text('Aucune adresse sélectionnée'),

      ],
    ),

    );
  }
}






class GenericDropdown<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) getDisplayValue;
  final T? selectedValue;
  final void Function(T) onSelected;

  GenericDropdown({
    Key? key,
    required this.items,
    required this.getDisplayValue,
    required this.onSelected,
    this.selectedValue,
  }) : super(key: key);

  @override
  _GenericDropdownState<T> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T> extends State<GenericDropdown<T>> {
  T? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButton<T>(
        value: currentValue,
        onChanged: (T? newValue) {
          if (newValue != null) {
            setState(() {
              currentValue = newValue;
            });
            widget.onSelected(newValue);
          }
        },
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        width: 275, // Padding pour chaque élément
        decoration: BoxDecoration(
           // Largeur maximale pour chaque élément
          color: const Color.fromARGB(255, 230, 235, 237), // Couleur de fond pour chaque élément
          borderRadius: BorderRadius.circular(5) // Bord arrondi pour chaque élément
        ),
        child: Text(widget.getDisplayValue(value), style: TextStyle(color: Colors.black)), // Style de texte pour chaque élément
      ),
          );
        }).toList(),
      ),
    );
  }
}