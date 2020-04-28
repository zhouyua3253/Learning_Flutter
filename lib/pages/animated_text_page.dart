import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/**
 * https://pub.dev/packages/animated_text_kit
 */
class AnimatedTextKitPage extends StatelessWidget {
  static const routeName = '/animated-text-kit';

  @override
  Widget build(BuildContext context) {
    final textStyle =
        TextStyle(fontSize: 30.0, fontFamily: "CourierPrime", fontWeight: FontWeight.bold);
    final totalRepeatCount = double.maxFinite.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedText'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('RotateAnimatedTextKit'),
            Row(
              children: <Widget>[
                Text('BE', style: textStyle),
                SizedBox(width: 15),
                Container(
                  color: Colors.grey[100],
                  child: RotateAnimatedTextKit(
                      text: ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
                      duration: Duration(seconds: 2),
                      totalRepeatCount: totalRepeatCount,
                      transitionHeight: 60,
                      textStyle: textStyle),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Text('FadeAnimatedTextKit'),
            Container(
              color: Colors.grey[100],
              child: FadeAnimatedTextKit(
                  text: [
                    "do IT!",
                    "do it RIGHT!!",
                    "do it RIGHT NOW!!!",
                    'do it RIGHT NOW NOW NOW NOW!!!'
                  ],
                  duration: Duration(seconds: 2),
                  totalRepeatCount: totalRepeatCount,
                  textStyle: textStyle),
            ),
            Divider(
              thickness: 1,
            ),
            Text('TyperAnimatedTextKit'),
            Container(
                color: Colors.grey[100],
                child: TyperAnimatedTextKit(
                    text: ["It is not enough to do your best, you must know what to do", 'NEXT'],
                    speed: Duration(milliseconds: 200),
                    textStyle: textStyle)),
            Divider(
              thickness: 1,
            ),
            Text('TypewriterAnimatedTextKit'),
            Container(
                color: Colors.grey[100],
                child: TypewriterAnimatedTextKit(
                    text: ["It is not enough to do your best", 'you must know what to do'],
                    speed: Duration(milliseconds: 200),
                    textStyle: textStyle)),
            Divider(
              thickness: 1,
            ),
            Text('ScaleAnimatedTextKit'),
            Container(
                color: Colors.grey[100],
                child: ScaleAnimatedTextKit(
                    text: ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
                    duration: Duration(seconds: 2),
                    totalRepeatCount: totalRepeatCount,
                    textStyle: textStyle,
                    textAlign: TextAlign.center)),
            Divider(),
            Text('ColorizeAnimatedTextKit'),
            Container(
                color: Colors.grey[100],
                child: ColorizeAnimatedTextKit(
                    text: [
                      "It is not enough to do your best"
                    ],
                    colors: [
                      Colors.black87,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ],
                    speed: Duration(milliseconds: 500),
                    pause: Duration(seconds: 3),
                    totalRepeatCount: double.infinity,
                    textStyle: textStyle))
          ],
        ),
      ),
    );
  }
}
