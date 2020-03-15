import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  /// Add a key id the animated widgets have the same type!!!!!
  final Widget _child1 = Opacity(
      child: Image.asset('images/4.jpg'), opacity: 0.5, key: ValueKey(1));
  final Widget _child2 = Opacity(
      child: Container(
        color: Colors.pink,
        child: FlutterLogo(
          size: 200,
          colors: Colors.orange,
        ),
      ),
      opacity: 0.8,
      key: ValueKey(2));
  bool _showChild1 = true;

  final List<String> _transitions = [
    'FadeTransition',
    'ScaleTransition',
    'RotationTransition',
    'SizeTransition - vertical',
    'SizeTransition - horizontal',
  ];
  String _transition = 'FadeTransition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.lime,
              child: Column(
                children: _radioItems(),
              ),
            ),
          ),
          AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: _showChild1 ? _child1 : _child2,
              transitionBuilder: _customTransitionBuilder,
              layoutBuilder: _customLayoutBuilder),
          Expanded(
            child: Container(
              color: Colors.orangeAccent,
            ),
          )
        ],
      ),
      floatingActionButton: Button(
        child: Text('Change Widget'),
        onPressed: () {
          setState(() {
            _showChild1 = !_showChild1;
          });
        },
      ),
    );
  }

  List<RadioListTile> _radioItems() {
    return _transitions.map((e) {
      return RadioListTile<String>(
        title: Text(e.toString()),
        value: e,
        groupValue: _transition,
        onChanged: (value) {
          setState(() {
            _transition = value;
          });
        },
      );
    }).toList();
  }

  Widget _customTransitionBuilder(Widget child, Animation<double> animation) {
    if (_transition == 'FadeTransition') {
      // 淡入淡出
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    } else if (_transition == 'ScaleTransition') {
      // 缩放
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    } else if (_transition == 'RotationTransition') {
      return RotationTransition(
        turns: animation,
        child: child,
      );
    } else if (_transition == 'SizeTransition - vertical') {
      return SizeTransition(
          sizeFactor: animation, child: child, axis: Axis.vertical);
    } else if (_transition == 'SizeTransition - horizontal') {
      return SizeTransition(
          sizeFactor: animation, child: child, axis: Axis.horizontal);
    }
  }

  Widget _customLayoutBuilder(
      Widget currentChild, List<Widget> previousChildren) {
    return Stack(
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
      alignment: Alignment.center,
    );
  }
}
