import 'package:flutter/material.dart';

class GradientPage extends StatelessWidget {
  static const String routeName = '/gradient';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'LinearGradient',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.2, 0.7, 0.9],
                      colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                'RadialGradient',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(gradient: RadialGradient(radius: 0.6,

                  /// 渲染模式
                  // tileMode: TileMode.mirror,
                  colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
            ),
          )
        ],
      ),
    );
  }
}
