import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TilePage extends StatefulWidget {
  static const routeName = '/tiles';

  @override
  _TilePageState createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  int _radioValue = 0;
  final List _checkBoxValues = [];

  final List<ListTileControlAffinity> _buttonPositions = [
    ListTileControlAffinity.leading,
    ListTileControlAffinity.trailing,
    ListTileControlAffinity.platform
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tile'),
        ),
        body: SafeArea(
          child: [
            const Text('GridTile').padding(top: 20),
            GridTile(
              child: Image.asset('images/1.jpg', fit: BoxFit.cover),
              header: Text('header', textAlign: TextAlign.center)
                  .textColor(Colors.white)
                  .backgroundColor(Colors.black.withOpacity(0.5)),
              footer: Text('footer', textAlign: TextAlign.center)
                  .textColor(Colors.white)
                  .backgroundColor(Colors.black.withOpacity(0.5)),
            ).constrained(maxWidth: 200, maxHeight: 150),
            const Text('ListTile').padding(top: 20),
            const ListTile(
              title: Text('ListTile'),
              subtitle: Text('subtitle'),
              leading: CircleAvatar(child: Text('Lead'), radius: 36),
              trailing: Icon(Icons.attachment),
            ),
            const Divider(
              height: 0.5,
            ),
            const Text('ExpansionTile').padding(top: 20),
            const ExpansionTile(
              title: const Text('ExpansionTile'),
              children: [
                ListTile(title: Text('AAAA'), dense: true),
                ListTile(title: Text('BBBB'), dense: true),
                ListTile(title: Text('CCCC'), dense: true)
              ],
            ),
            const Text('SwitchListTile').padding(top: 20),
            SwitchListTile(
              title: Text('SwitchListTile1'),
              subtitle: Text('subtitle'),
              value: true,
              onChanged: (value) => print(value),
            ),
            const Divider(
              height: 0.5,
            ),
            SwitchListTile(
              title: Text('SwitchListTile2'),
              value: false,
              secondary: Text('secondary\nwidget'),
              onChanged: (value) => print(value),
            ),
            const Divider(
              height: 0.5,
            ),
            const Text('RadioListTile').padding(top: 20),
            RadioListTile<int>(
              title: const Text('RadioListTile-1 controlAffinity'),
              value: 0,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: _radioValue,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (int value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('RadioListTile-2  dense'),
              subtitle: const Text('subtitle'),
              value: 1,
              groupValue: _radioValue,
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (int value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('RadioListTile-3  selected'),
              value: 2,
              selected: true,
              groupValue: _radioValue,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (int value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
            const Text('CheckboxListTile').padding(top: 20),
            ...[1, 2, 3].map((e) => CheckboxListTile(
                  title: Text('CheckboxListTile $e'),
                  subtitle: e == 1 ? Text('subtitle') : null,
                  secondary: const Text('secondary'),
                  dense: e == 2,
                  controlAffinity: _buttonPositions[e - 1],
                  value: _checkBoxValues.contains(e),
                  onChanged: (bool checked) {
                    setState(() {
                      if (checked) {
                        _checkBoxValues.add(e);
                      } else {
                        _checkBoxValues.remove(e);
                      }
                    });
                  },
                )),
            const AboutListTile(
              icon: Icon(Icons.info_outline),
              child: Text('AboutListTile'),
              applicationName: 'applicationName',
              applicationVersion: '1.1.0',
              applicationLegalese:
                  'applicationLegalese applicationLegalese applicationLegalese applicationLegalese¬',
              applicationIcon: Icon(Icons.flag),
            ).padding(top: 20)
          ]
              .toColumn()
              .scrollable(physics: const AlwaysScrollableScrollPhysics())
              .height(double.infinity),
        ));
  }
}
