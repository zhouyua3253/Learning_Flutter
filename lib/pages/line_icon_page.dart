import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

/// https://oblador.github.io/react-native-vector-icons/
import 'package:flutter_icons/flutter_icons.dart';

class LineIconPage extends StatelessWidget {
  static const String routeName = '/line-icon';

  final Map<String, IconData> _icons = LineIcons.values;

  @override
  Widget build(BuildContext context) {
    final List icons = [];
    _icons.forEach((key, value) => icons.add({'name': key, 'iconData': value}));

    // Icon(FlutterIcons.alert_box_outline_mco);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LineIcons'),
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
