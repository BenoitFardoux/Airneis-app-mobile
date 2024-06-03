import 'package:flutter/material.dart';
import 'package:flutter_second/views/main_app.dart';
import 'package:flutter_second/colors/colors.dart';
import 'package:flutter_second/views/main_app.dart';
import './../../homepage.dart';



class ConfirmationWidgetScreen extends StatelessWidget {
  const ConfirmationWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainApp(body: ConfirmationWidget());
  }
}

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text('Commande effectué', style: TextStyle(fontSize: 20, fontFamily: 'NotoSans', color: ColorsApp.textColor)),
          Text("Merci de votre achat !" , style: TextStyle(fontSize: 20, fontFamily: 'NotoSans', color: ColorsApp.textColor)),
          Text(
              "votre commande a bein été enregistrée sous le numéro ${DateTime.now().millisecondsSinceEpoch}.", style: TextStyle(fontSize: 20, fontFamily: 'NotoSans', color: ColorsApp.textColor)),
          Text("Vous pouvez suivre son état depuis votre espace client.", style: TextStyle(fontSize: 20, fontFamily: 'NotoSans', color: ColorsApp.textColor)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePageScreen()),
              );
            },
            child: Text('Continuer mes achats', style: TextStyle(fontSize: 20, fontFamily: 'NotoSans', color: ColorsApp.textColor)),
          ),
        ],
      ),
    );
  }
}
