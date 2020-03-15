import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LineIconPage extends StatelessWidget {
  static String routeName = 'LineIcon';

  final Map<String, IconData> _icons = LineIcons.values;

  @override
  Widget build(BuildContext context) {
    List icons = List();
    _icons.forEach((key, value) => icons.add({"name": key, "iconData": value}));

    return Scaffold(
      appBar: AppBar(
        title: Text('LineIcons'),
      ),
      body: SafeArea(
          child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: icons
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            e["iconData"] as IconData,
                            size: 36,
                          ),
                          Text(
                            e["name"] as String,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                  .toList())),
    );
  }
}
