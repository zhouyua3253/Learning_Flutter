import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_crossFadeState == CrossFadeState.showFirst) {
        setState(() {
          _crossFadeState = CrossFadeState.showSecond;
        });
      } else {
        setState(() {
          _crossFadeState = CrossFadeState.showFirst;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.pink[100]),
          ),
          AnimatedCrossFade(
            crossFadeState: _crossFadeState,
            firstChild: Container(
              decoration: BoxDecoration(border: Border.all(width: 4, color: Colors.grey)),
              child: FlutterLogo(
                size: 200,
              ),
            ),
            secondChild: Image.asset(
              'images/3.jpg',
            ),
            duration: Duration(seconds: 2),
            // 改变size时的弹簧效果
            sizeCurve: Curves.bounceOut,
            layoutBuilder: _layoutBuilder,
          ),
          Expanded(
            child: Container(color: Colors.pink[100]),
          ),
        ],
      ),
    );
  }

  Widget _layoutBuilder(Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          key: bottomChildKey,
          top: 0.0,
          // left: 0,
          // right: 0,
          child: bottomChild,
        ),
        Positioned(
          key: topChildKey,
          child: topChild,
        ),
      ],
    );
  }
}
