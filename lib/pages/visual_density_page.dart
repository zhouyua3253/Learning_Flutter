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
    final VisualDensity visualDensity =
        VisualDensity(horizontal: _visualDensity, vertical: _visualDensity);

    final Widget node = [
      Slider(
          min: -4,
          max: 4,
          value: _visualDensity,
          onChanged: (double value) {
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
        child: const Text('OutlineButton'),
        onPressed: () {},
      ),
      const Text('TEXT').backgroundColor(Colors.grey[300]),
      ListView.separated(
        itemCount: 1000,
        itemBuilder: (BuildContext context, int index) => ListTile(title: Text('ListTile $index')),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
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
