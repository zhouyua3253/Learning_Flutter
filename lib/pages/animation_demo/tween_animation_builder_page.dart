import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorTween tween =
        ColorTween(begin: Colors.white, end: Colors.black.withOpacity(0.8));

    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TweenAnimationBuilder<Color>(
              tween: tween,
              duration: Duration(seconds: 3),
              builder: (BuildContext context, Color value, Widget child) {
                return Center(
                  child: Image.asset(
                    'images/5.jpg',
                    width: 300,
                    color: value,
                    colorBlendMode: BlendMode.overlay,
                  ),
                );
              },
              onEnd: () => print('Animation End!'),
            ),
            TweenAnimationBuilder<Size>(
              tween: SizeTween(begin: Size(50, 100), end: Size(350, 500)),
              duration: Duration(seconds: 5),

              /// 复用子控件
              child: Text(
                '我是无需变化的子控件',
                textAlign: TextAlign.center,
              ),
              builder: (BuildContext context, Size value, Widget child) {
                return Container(
                  width: value.width,
                  height: value.height,
                  alignment: Alignment.center,
                  child: child,
                  color: Colors.grey,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
