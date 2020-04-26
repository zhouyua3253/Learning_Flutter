import 'package:flutter/material.dart';
import 'dart:ui';

class BlurPage extends StatelessWidget {
  static const String routeName = '/blur-mask';

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
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Center(
            child: Text('Above\nBackdropFilter',
                style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
