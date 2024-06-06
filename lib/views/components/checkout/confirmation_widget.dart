import 'package:flutter/material.dart';
import 'package:flutter_second/views/main_app.dart';
import 'package:flutter_second/colors/colors.dart';
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
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 20),
              Text(
                'Commande effectuée',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSans',
                  color: ColorsApp.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Merci de votre achat !",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'NotoSans',
                  color: ColorsApp.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Votre commande a bien été enregistrée sous le numéro ${DateTime.now().millisecondsSinceEpoch}.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NotoSans',
                  color: ColorsApp.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Vous pouvez suivre son état depuis votre espace client.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NotoSans',
                  color: ColorsApp.textColor,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continuer mes achats',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'NotoSans',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
