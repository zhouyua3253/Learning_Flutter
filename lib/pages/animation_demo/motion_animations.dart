import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/animation_demo/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:animations/animations.dart';

/// https://pub.dev/packages/animations
class MotionAnimationsPage extends StatefulWidget {
  static const String routeName = '/motion-animation';

  @override
  _MotionAnimationsPageState createState() => _MotionAnimationsPageState();
}

class _MotionAnimationsPageState extends State<MotionAnimationsPage> {
  Widget _child = Image.asset('images/5.jpg', key: Key('images/5.jpg'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motion Animations'),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(5),
          children: [
            Card(
              child: const Text('Start animation').center(),
            ).gestures(onTap: () {
              setState(() {
                final int index = Random().nextInt(6) + 1;
                final String path = 'images/$index.jpg';
                _child = Image.asset(
                  path,
                  key: Key(path),
                );
              });
            }),
            Card(
              child: [Image.asset('images/4.jpg'), const Text('custom Modal')].toColumn(),
            ).gestures(onTap: () {
              showModal(
                  context: context,
                  configuration: FadeScaleTransitionConfiguration(
                      barrierColor: Colors.orange.withOpacity(0.5)),
                  builder: (BuildContext ctx) => Container(
                      width: 200,
                      height: 200,
                      child: const FlutterLogo().gestures(onTap: () {
                        Navigator.of(context).pop();
                      })).center());
            }),
            OpenContainer(
              transitionDuration: const Duration(seconds: 2),
              openBuilder: (BuildContext ctx, VoidCallback _) {
                return AnimationPage();
              },
              closedBuilder: (BuildContext ctx, VoidCallback _) {
                return [Image.asset('images/1.jpg'), const Text('Container transform')].toColumn();
              },
            ),
            [
              const Text('Shared axis'),
              PageTransitionSwitcher(
                duration: const Duration(seconds: 1),
                // Controls how to display the new Widget
                reverse: Random().nextBool(),
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                  );
                },
                child: _child,
              )
            ].toColumn(),
            [
              const Text('Fade through'),
              PageTransitionSwitcher(
                duration: const Duration(seconds: 1),
                // Controls how to display the new Widget
                reverse: false,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                      // Like the SharedAxisTransition and transitionType: SharedAxisTransitionType.scaled
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation);
                },
                child: _child,
              )
            ].toColumn()
          ],
        ),
      ),
    );
  }
}
