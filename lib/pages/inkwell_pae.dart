import 'package:flutter/material.dart';

class InkWellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InkWell'),
      ),
      body: Center(
        child: Builder(
          builder: (context) => InkWell(
            child: Icon(Icons.ac_unit, size: 200, color: Colors.grey,),
            splashColor: Colors.yellow,
            borderRadius: BorderRadius.circular(40),
            onTap: () => _onTap(context),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(' click InkWell'),
    ));
  }
}
