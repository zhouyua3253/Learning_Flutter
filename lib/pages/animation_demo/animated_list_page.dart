import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  static String routeName = 'AnimatedList';

  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  int _initialItemCount = 5;
  final _animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _insertItem,
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: _removeItem,
          )
        ],
      ),
      body: AnimatedList(
        key: _animatedListKey,
        itemBuilder: _animatedListBuilder,
        initialItemCount: _initialItemCount,
      ),
    );
  }

  Widget _animatedListBuilder(
      BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: ListTile(
        leading: FlutterLogo(),
        title: Text("index-$index"),
      ),
    );
  }

  void _insertItem() {
    _initialItemCount += 1;
    _animatedListKey.currentState
        .insertItem(_initialItemCount, duration: Duration(seconds: 1));
  }

  void _removeItem() {
    _animatedListKey.currentState.removeItem(_initialItemCount,
        (context, animation) {
      return RotationTransition(
        turns: animation,
        child: ListTile(
          leading: FlutterLogo(),
          title: Text("index-$_initialItemCount"),
        ),
      );
    });

    _initialItemCount -= 1;
  }
}
