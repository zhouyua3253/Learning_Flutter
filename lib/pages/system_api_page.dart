import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class SystemApiPage extends StatelessWidget {
  static String routeName = 'SystemApi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SystemApi'),
        brightness: Brightness.dark,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: <Widget>[_createButton('转换设备方向', _setPreferredOrientations)],
        ),
      ),
    );
  }

  Widget _createButton(String title, VoidCallback onPressed) {
    return Button(
      child: Text(title),
      padding: EdgeInsets.all(16),
      onPressed: onPressed,
    );
  }

  void _setPreferredOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
      //DeviceOrientation.landscapeLeft,
      //DeviceOrientation.landscapeRight
    ]);
  }
}
