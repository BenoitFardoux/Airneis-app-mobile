import 'package:flutter/material.dart';
import './login_form.dart';
import './myscaffold.dart';
import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Login',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoginForm(),
              Text("Vous n'avez pas encore de compte ?",
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
              Container(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text("Inscrivez-vous !",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                        fontSize: 16.0)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
