import 'package:flutter/material.dart';
import 'dart:ui';

class BlurPage extends StatelessWidget {
  static String routeName = 'Blur Mask';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.network(
            'https://loving-newyork.com/wp-content/uploads/2018/09/Empire-State-Building-New-York_160914155540010-e1537863672134.jpg',
            fit: BoxFit.cover,
          )),
          FlutterLogo(size: 200, colors: Colors.yellow),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.cyan.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: Text(
                    '遮罩前置组件',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
