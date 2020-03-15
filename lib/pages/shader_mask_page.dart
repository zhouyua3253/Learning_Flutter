import 'package:flutter/material.dart';

class ShaderMaskPage extends StatelessWidget {
  static String routeName = 'ShaderMask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShaderMask'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.yellow,
                        Colors.deepPurple,
                        Colors.redAccent
                      ]).createShader(rect);
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      'ShaderMask',
                      textScaleFactor: 3,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    ImageIcon(
                      AssetImage('images/icon.png'),
                      size: 120,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                    radius: 0.5,
                    tileMode: TileMode.mirror,
                    colors: [
                      Colors.blueGrey,
                      Colors.orange,
                      Colors.pink,
                      Colors.black87
                    ]).createShader(rect);
              },
              child: Column(
                children: <Widget>[
                  Text(
                    'ShaderMask',
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    color: Colors.white,
                  ),
                  ImageIcon(
                    AssetImage('images/icon.png'),
                    size: 64,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
