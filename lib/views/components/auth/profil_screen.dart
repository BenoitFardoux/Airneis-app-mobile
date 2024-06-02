import 'package:flutter/material.dart';
import './../../../api/user.dart';
import './../../../models/user_model.dart';




class UserProductsScreen extends StatefulWidget {
  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {

  late Future userData;

  @override
  void initState() {
    super.initState();
    userData = informationsUtilisateurAPI();  // Initialize the future
  }

  @override
  Widget build(BuildContext context) {
    print(userData); 

    return Container(
      child: Text(userData.toString()),
      );
  }
}
