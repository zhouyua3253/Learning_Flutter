import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/pages/animation_demo/int_tween_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/tween_page.dart';

import 'color_tween_page.dart';

class AnimationPage extends StatelessWidget {
  final List<String> _types = ['tween', 'colorTween', 'intTween'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: Column(
            children: _types
                .map((type) => Button(
                      child: Text(
                        type,
                        textScaleFactor: 1.2,
                      ),
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        _pushPage(context, type);
                      },
                    ))
                .toList()),
      ),
    );
  }

  void _pushPage(BuildContext context, String tag) {
    switch (tag) {
      case 'tween':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => TweenPage()));
        break;
      case 'colorTween':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => ColorTweenPage()));
        break;
      case 'intTween':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => IntTweenPage()));
        break;
    }
  }
}
