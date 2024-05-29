import 'package:flutter/material.dart';
import './myscaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Profile',
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
