import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class OpacityPage extends StatefulWidget {
  static const String routeName = '/opacity';

  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  double _opacityValue = 0;

  _changeOpacityValue() {
    this.setState(() {
      _opacityValue = Random().nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity'),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
        ),
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            'images/2.jpg',
            width: 200,
          ),
        ),
        Divider(),
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            'images/2.jpg',
            width: 200,
          ),
        ),
        Divider(),
        Text('AnimatedOpacity'),
        AnimatedOpacity(
          opacity: _opacityValue,
          duration: Duration(seconds: 1),
          child: Image.asset(
            'images/1.jpg',
            width: 200,
          ),
        ),
        Button(
          child: Text('Change opacity.'),
          onPressed: _changeOpacityValue,
          padding: EdgeInsets.all(10),
          color: Colors.red[900],
          textColor: Colors.white,
        ),
      ]),
    );
  }
}
