import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class TweenPage extends StatefulWidget {
  @override
  _TweenPageState createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> with SingleTickerProviderStateMixin {
  /// AnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法
  /// AnimationController派生自Animation<double>，因此可以在需要Animation对象的任何地方使用
  /// AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字, 也可以自己指定lowerBound、upperBound
  AnimationController _animationController;

  /// Animation是一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态
  /// 其中一个比较常用的Animation类是Animation<double>
  /// Animation对象是一个在一段时间内依次生成一个区间(Tween)之间值的类。
  Animation<double> _customTweenAnimation;

  @override
  void initState() {
    super.initState();

    /// AnimationController 只能生成数值类型的插值，默认(0,1)
    // _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    /// controller在(0,2)之间变化，_customTween也是原始的两倍的变化幅度
    _animationController = AnimationController(
        duration: Duration(seconds: 2), vsync: this, lowerBound: 0, upperBound: 2);

    /// Tween.animate
    /// Tween 生成其他类型的插值，并绑定到controller上，controller在(0,1)之间变化,得到Animation<T>
    _customTweenAnimation = Tween<double>(begin: 0, end: 300).animate(_animationController)
      ..addStatusListener((AnimationStatus status) {
        print("status -> $status");
      });
  }

  dispose() {
    /// 释放
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Container(
        child: AnimatedBuilder(
          animation: _customTweenAnimation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.redAccent,
          ),
          builder: (context, child) {
            double value = _customTweenAnimation.value.toDouble();
            return Container(
              color: Colors.grey[200],
              child: Stack(
                children: <Widget>[
                  child,
                  Container(
                    width: 100,
	                  height: 100,
                    alignment: Alignment.center,
                    child: Text("value -> $value"),
                  )
                ],
              ),
              padding: EdgeInsets.only(top: value, left: value * 0.5),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Button(
            child: Text('forward'),
            padding: EdgeInsets.all(15),
            color: Colors.cyan,
            onPressed: () {
              _animationController.forward();
            },
          ),
          SizedBox(
            width: 10,
          ),
          Button(
            child: Text('reverse'),
            padding: EdgeInsets.all(15),
            color: Colors.cyan,
            onPressed: () {
              _animationController.reverse();
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
