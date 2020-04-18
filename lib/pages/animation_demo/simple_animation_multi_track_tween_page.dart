import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimationMultiTrackTweenPage extends StatelessWidget {
  static String routeName = 'SimpleAnimationMultiTrackTweenPage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MultiTrackTween'),
        ),
        body: SafeArea(child: Center(child: buildAnimation())),
      ),
    );
  }

  /// https://github.com/felixblaschke/simple_animations/blob/master/documentation/README.md
  final MultiTrackTween tween = MultiTrackTween([
    Track("size").add(Duration(seconds: 4), Tween(begin: 0.0, end: 150.0)),
    Track("color")
        .add(Duration(seconds: 2), ColorTween(begin: Colors.red, end: Colors.blue),
            curve: Curves.easeIn)
        .add(Duration(seconds: 2), ColorTween(begin: Colors.blue, end: Colors.green),
            curve: Curves.easeOut),
    Track("rotation")

    /// 延迟1s
        .add(Duration(seconds: 1), ConstantTween(0.0))
        .add(Duration(seconds: 2), Tween(begin: 0.0, end: pi), curve: Curves.easeOutSine)
  ]);

  Widget buildAnimation() {
    return ControlledAnimation(
      playback: Playback.MIRROR,
      duration: tween.duration,
      curve: Curves.bounceOut,
      tween: tween,
//      builder: (context, animation) {
//        return Transform.rotate(
//          angle: animation["rotation"] as double,
//          child: Container(
//              width: animation["size"] as double,
//              height: animation["size"] as double,
//              color: animation["color"] as Color),
//        );
//      },
      child: Text('CHILD'),
      delay: Duration(seconds: 1),
      startPosition: 0.2,
      builderWithChild: (context, child, animation) {
        return Transform.rotate(
          angle: animation["rotation"] as double,
          child: Container(
            width: animation["size"] as double,
            height: animation["size"] as double,
            color: animation["color"] as Color,
            child: child,
            alignment: Alignment.center,
          ),
        );
      },
      animationControllerStatusListener: (AnimationStatus status) {
        print(status);
      },
    );
  }
}
