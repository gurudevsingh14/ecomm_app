import 'package:ecomm_app/Constants/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Center(
        child: Text(
          'Welcome to Flutter',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
