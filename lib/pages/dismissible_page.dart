import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  static const String routeName = '/dismissible-swipe';

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  List<String> _itemsData = List<String>.generate(200, (index) => "ListView-${index}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Dismissible(
              key: ValueKey('container-1'),
              child: Container(
                color: Colors.lime,
                height: 80,
                alignment: Alignment.center,
                child: Text('Dismissible-container-1'),
              ),
              background: Container(
                color: Colors.pinkAccent[100],
                alignment: Alignment.centerLeft,
                child: Text('background'),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: Text('secondaryBackground'),
              ),
              onDismissed: (DismissDirection direction) {
                print('onDismissed-1');
              },
            ),
            Dismissible(
              key: ValueKey('container-2'),
              child: Container(
                color: Colors.blue,
                height: 80,
                alignment: Alignment.center,
                child: Text('Dismissible-confirm'),
              ),
              background: Container(color: Colors.redAccent),
              confirmDismiss: (DismissDirection direction) {
                /// If the returned Future<bool> completes true, then this widget will be
                /// dismissed, otherwise it will be moved back to its original location.
                return Future.delayed(Duration(seconds: 1), () => false);
              },
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _itemsData.length,
                itemExtent: 60,
                itemBuilder: (BuildContext context, int index) {
                  String tag = _itemsData[index];
                  return Dismissible(
                    key: ValueKey(tag),
                    child: Container(
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: Text(tag),
                    ),
                    background: Container(color: Colors.redAccent),
                    onDismissed: (_) {
                      setState(() {
                        _itemsData = _itemsData.where((e) => e != tag).toList();
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
