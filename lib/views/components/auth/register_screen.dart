import 'package:flutter/material.dart';
import './myscaffold.dart';
import 'package:flutter_second/views/components/auth/register_form.dart';
class RegisterScreen extends StatefulWidget {
 const RegisterScreen({super.key});
 @override
 State<StatefulWidget> createState() {
 return _RegisterScreen();
 }
}
class _RegisterScreen extends State<RegisterScreen> {
 @override
 void initState() {
 super.initState();
 }
 @override
 Widget build(BuildContext context) {
 return MyScaffold(name: 'Register', body: RegisterForm());
 }
}
