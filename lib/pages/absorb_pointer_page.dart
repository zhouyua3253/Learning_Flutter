import 'package:flutter/material.dart';

class AbsorbPointerPage extends StatefulWidget {
  static String routeName = 'AbsorbPointer 屏蔽遮罩';

  @override
  _AbsorbPointerPageState createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
  bool _absorbing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AbsorbPointer 屏蔽遮罩'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.change_history),
            onPressed: () {
              setState(() {
                _absorbing = !_absorbing;
              });
            },
          )
        ],
      ),
      body: AbsorbPointer(
        absorbing: _absorbing,
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () => print('on click'),
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: 60,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('ListTile-${index + 1}'),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
