import 'package:flutter/material.dart';
import 'package:flutter_second/models/adresse.dart';


class AdresseWidget extends StatelessWidget{

  final Adresse adresse;

  AdresseWidget({super.key, required this.adresse});

  List dropdownValues = ["A", "B", "C", "D", "E"];

  @override 
  Widget build(BuildContext context){
    print("voici adresse => ${adresse}"); 
    var dropdownValues; 
    return Container(
      child: Column(
        children: [
          // MyDropdown(dropdownValues: dropdownValues),
          Text(adresse.prenom),
          Text(adresse.nom),
          Text(adresse.codePostal),
          Text(adresse.informations),
        ],
      ),
    );
}
}




class MyDropdown extends StatefulWidget {
  final List<String> dropdownValues;

  MyDropdown({Key? key, required this.dropdownValues}) : super(key: key);

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      hint: Text("Sélectionnez une option"),
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
