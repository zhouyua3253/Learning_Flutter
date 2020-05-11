import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimationControlledAnimationPage extends StatefulWidget {
  static String routeName = 'SimpleAnimationControlledAnimation';

  @override
  _SimpleAnimationControlledAnimationPageState createState() =>
      _SimpleAnimationControlledAnimationPageState();
}

/// https://github.com/felixblaschke/simple_animations/blob/master/documentation/CONTROLLED_ANIMATION.md
class _SimpleAnimationControlledAnimationPageState
    extends State<SimpleAnimationControlledAnimationPage> {
  Playback _playback = Playback.MIRROR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ControlledAnimation<Color>(
                  playback: _playback,
                  duration: Duration(milliseconds: 3000),
                  tween: ColorTween(begin: Colors.white, end: Colors.black87),
                  curve: Curves.linear,
                  builder: (context, color) {
                    return Container(
                      color: color,
                      width: 300,
                      height: 300,
                      alignment: Alignment.center,
                      child: Text(
                        '$_playback',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }),
              RaisedButton(
                child: Text('Playback.MIRROR'),
                onPressed: () => setState(() {
                  _playback = Playback.MIRROR;
                }),
              ),
              RaisedButton(
                child: Text('Playback.LOOP'),
                onPressed: () => this.setState(() {
                  _playback = Playback.LOOP;
                }),
              ),
              RaisedButton(
                child: Text('Playback.PAUSE'),
                onPressed: () => setState(() {
                  _playback = Playback.PAUSE;
                }),
              ),
              RaisedButton(
                child: Text('Playback.PLAY_FORWARD'),
                onPressed: () => this.setState(() {
                  _playback = Playback.PLAY_FORWARD;
                }),
              ),
              RaisedButton(
                child: Text('Playback.PLAY_REVERSE'),
                onPressed: () => this.setState(() {
                  _playback = Playback.PLAY_REVERSE;
                }),
              ),
              RaisedButton(
                child: Text('Playback.START_OVER_FORWARD'),
                onPressed: () => this.setState(() {
                  _playback = Playback.START_OVER_FORWARD;
                }),
              ),
              RaisedButton(
                child: Text('Playback.START_OVER_REVERSE'),
                onPressed: () => this.setState(() {
                  _playback = Playback.START_OVER_REVERSE;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
