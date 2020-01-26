import 'package:flutter/material.dart';

class GradientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'Gradient',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft, end: Alignment.topRight,
                stops: [0.2, 0.7, 0.9],
                colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
      ),
    );
  }
}
