import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimationControllerXPage extends StatefulWidget {
  static String routeName = 'SimpleAnimationControllerX';

  @override
  _SimpleAnimationControllerXPageState createState() =>
      _SimpleAnimationControllerXPageState();
}

/// https://github.com/felixblaschke/simple_animations/blob/master/documentation/ANIMATION_CONTROLLER_X.md
class _SimpleAnimationControllerXPageState
    extends State<SimpleAnimationControllerXPage>
    with AnimationControllerMixin {
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(controller);
    controller.addTask(FromToTask(
        from: 0,
        to: 1.0,
        duration: Duration(seconds: 2),
        onComplete: () => print('animation complete'),
        onStart: () => print('animation start')));

    controller.addTasks([
      FromToTask(to: 0.5, duration: Duration(seconds: 1)),

      /// true: continue false: stop animation
      ConditionalTask(predicate: () => true),
      FromToTask(to: 1.0, duration: Duration(seconds: 1)),
      SleepTask(duration: Duration(seconds: 1)),
      FromToTask(to: 0.0, duration: Duration(milliseconds: 500)),
      SetValueTask(value: 0.9),
      SleepTask(duration: Duration(seconds: 1)),
      LoopTask(
          from: 0.25,
          to: 1,
          duration: Duration(milliseconds: 1500),
          mirror: false,
          iterations: 3,
          curve: Curves.easeIn)
    ]);

    controller.addStatusListener((status) {
      print("addStatusListener -> $status");
    });
    controller.onStatusChange =
        (AnimationControllerXStatus status, AnimationTask task) {
      print(status);
      print(task);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationControllerX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: Colors.redAccent,
            ),
            Button(
              child: Text('STOP'),
              padding: EdgeInsets.all(16),
              onPressed: _stopAnimation,
            ),
          ],
        ),
      ),
    );
  }

  void _stopAnimation() {
    controller.stop();
  }
}
