import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

/*
https://medium.com/flutter-community/how-to-improve-your-flutter-application-with-gradient-designs-63180ba96124
 */
class GradientPage extends StatelessWidget {
  static const String routeName = '/gradient';

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide * 0.5;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Gradient'),
          flexibleSpace: Container()
              .backgroundLinearGradient(colors: [Colors.red, Colors.yellow, Colors.grey])),
      body: [
        Container(
          height: size,
          child: Text(
            'LinearGradient',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 0.7, 0.9],
                  colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
        ),
        const Text('RadialGradient'),
        Container(
          height: size,
          child: const Text(
            'TileMode.clamp',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: const RadialGradient(
                  radius: 0.3,

                  /// 渲染模式
                  tileMode: TileMode.clamp,
                  colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
        ),
        Container(
          height: size,
          child: const Text(
            'TileMode.mirror',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: const RadialGradient(
                  radius: 0.4,

                  /// 渲染模式
                  tileMode: TileMode.mirror,
                  colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
        ),
        Container(
          height: size,
          child: const Text(
            'TileMode.repeated',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: const RadialGradient(
                  radius: 0.5,

                  /// 渲染模式
                  tileMode: TileMode.repeated,
                  colors: [Colors.purple, Colors.orange, Colors.greenAccent])),
        ),
        const Text('center (0.75, -0.5)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))
            .center()
            .constrained(height: size, width: double.infinity)
            .backgroundRadialGradient(

                /*
            (-1, -1)                  (0, -1)                 (-1, -1)
                ︳------------------------------------------------︳
                ︳                                                ︳
                ︳                                                ︳
            (-1, 0)               Alignment(0, 0)              (1, 0)
                ︳                                                ︳
                ︳                                                ︳
                ︳------------------------------------------------︳
             (-1, 1)                 (0, 1)                     (1, 1)
                 */
                center: const Alignment(0.75, -0.5),
                radius: 0.6,
                colors: [Colors.purple, Colors.orange, Colors.greenAccent]),
        const Text('center (-1, 1)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))
            .center()
            .constrained(height: size, width: double.infinity)
            .backgroundRadialGradient(
                center: const Alignment(-1, 1),
                radius: 1,
                colors: [Colors.greenAccent, Colors.orange, Colors.purple]),
        const Text('SweepGradient'),
        const Text('SweepGradient',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))
            .center()
            .constrained(height: size, width: double.infinity)
            .backgroundSweepGradient(
                colors: [Colors.greenAccent, Colors.orange, Colors.purple, Colors.greenAccent])
      ].toColumn().scrollable(),
    );
  }
}
