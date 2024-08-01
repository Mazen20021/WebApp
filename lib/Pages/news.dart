import 'package:flutter/material.dart';

class UnderDevelopmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'We are sorry this Page is under maintenance',
          style: TextStyle(
            fontSize: 35,
            color: Color.fromARGB(255, 158, 78, 3),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
