import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class VisualDensityPage extends StatefulWidget {
  static const String routeName = '/visual-density';

  @override
  _VisualDensityPageState createState() => _VisualDensityPageState();
}

class _VisualDensityPageState extends State<VisualDensityPage> {
  double _visualDensity = 0;

  @override
  Widget build(BuildContext context) {
    /// VisualDensity影响所有的button默认padding
    VisualDensity visualDensity =
        VisualDensity(horizontal: _visualDensity, vertical: _visualDensity);

    Widget node = [
      Slider(
          min: -4,
          max: 4,
          value: _visualDensity,
          onChanged: (value) {
            setState(() {
              _visualDensity = value;
            });
          }),
      IconButton(
        icon: Icon(Icons.settings),
        color: Colors.yellow,
        onPressed: () {},
      ).backgroundColor(Colors.grey),
      RaisedButton(
        child: const Text('RaisedButton'),
        onPressed: () {},
      ),
      OutlineButton(
        child: Text('OutlineButton'),
        onPressed: () {},
      ),
      const Text('TEXT').backgroundColor(Colors.grey[300]),
      ListView.separated(
        itemCount: 1000,
        itemBuilder: (_, index) => ListTile(title: Text('ListTile $index')),
        separatorBuilder: (_, i) => Divider(),
      ).expanded()
    ].toColumn();

    return Scaffold(
      appBar: AppBar(
        title: const Text('VisualDensity'),
      ),
      body: Theme(data: ThemeData(visualDensity: visualDensity), child: node),
    );
  }
}
