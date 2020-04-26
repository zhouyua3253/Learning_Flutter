import 'dart:math' show Random;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class StackPage extends StatefulWidget {
  static const String routeName = '/stack';

  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  double _top = 0;
  double _left = 0;
  final Random _random = Random();
  int _stackIndex = 4;
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _stackIndex = Random().nextInt(5);
      });
      print(DateTime.now());
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Text("Yellow is #1"),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: Text("Red is #2"),
                    ),
                    Positioned(
                      top: 20,
                      left: 100,
                      right: 100,
                      child: Text("alignment决定了没有Positioned指定横竖位置的子控件的排列位置\n默认topStart"),
                    ),
                    AnimatedPositioned(
                      top: _top,
                      left: _left,
                      duration: Duration(seconds: 2),
                      onEnd: _startAnimation,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.green,
                        child: Text('AnimatedPositioned'),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.center,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Button(
                        child: Text('Start Animation'),
                        onPressed: _startAnimation,
                        padding: EdgeInsets.all(16),
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: IndexedStack(
                    alignment: AlignmentDirectional.center,
                    index: _stackIndex,
                    children: <Widget>[
                      Text('IndexedStack-1, 同一时刻只能显示子控件中的一个控件', textScaleFactor: 2),
                      Text('IndexedStack-2, 同一时刻只能显示子控件中的一个控件', textScaleFactor: 3),
                      Text('IndexedStack-3, 同一时刻只能显示子控件中的一个控件', textScaleFactor: 4),
                      Text('IndexedStack-4, 同一时刻只能显示子控件中的一个控件', textScaleFactor: 3),
                      Text('IndexedStack-5, 同一时刻只能显示子控件中的一个控件', textScaleFactor: 2.5),
                      Text(
                        'IndexedStack-6, 同一时刻只能显示子控件中的一个控件',
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _startAnimation() {
    setState(() {
      _top = _random.nextDouble() * 600;
      _left = _random.nextDouble() * 350;
    });
  }
}
