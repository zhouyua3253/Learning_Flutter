import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class ColorTweenPage extends StatefulWidget {
  @override
  _ColorTweenPageState createState() => _ColorTweenPageState();
}

class _ColorTweenPageState extends State<ColorTweenPage>
    with SingleTickerProviderStateMixin {
  /// AnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法
  /// AnimationController派生自Animation<double>，因此可以在需要Animation对象的任何地方使用
  /// AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字, 也可以自己指定lowerBound、upperBound
  AnimationController _animationController;

  /// Animation是一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态
  /// 其中一个比较常用的Animation类是Animation<double>
  /// Animation对象是一个在一段时间内依次生成一个区间(Tween)之间值的类。
  Animation<Color> _colorTweenAnimation;

  @override
  void initState() {
    super.initState();

    /// AnimationController 只能生成数值类型的插值
    // _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this, lowerBound: 0, upperBound: 300);

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _colorTweenAnimation = ColorTween(begin: Colors.yellow, end: Colors.black.withOpacity(0.5))
        .animate(_animationController)
          ..addStatusListener((AnimationStatus status) {
            print("status -> $status");
          });
  }

  dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorTweenAnimation,
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: _colorTweenAnimation.value,
                ),
                Divider(),
                Image.asset(
                  'images/1.jpg',
                  width: 300,
                  color: _colorTweenAnimation.value,
                  colorBlendMode: BlendMode.darken,
                )
              ],
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
