import 'package:flutter/material.dart';
import './views/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(HomePageScreen());
}





