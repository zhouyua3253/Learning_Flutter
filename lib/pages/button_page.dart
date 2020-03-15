import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class ButtonPage extends StatelessWidget {
  static String routeName = 'Buttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              children: <Widget>[
                Container(
                  color: Colors.indigo,
                  child: PopupMenuButton<Object>(
                    child: Padding(
                        padding: EdgeInsets.all(10), child: Text('MenuButton')),
                    offset: Offset(0, 200),
                    tooltip: '选择器pop-up',
                    onSelected: (value) {
                      _onPress(context, "Menu button select $value");
                    },
                    onCanceled: () {
                      _onPress(context,
                          "Dismiss the popup menu without selecting an item");
                    },
                    initialValue: 2,
                    itemBuilder: _renderMenuButtonItems,
                  ),
                ),
                Divider(),
                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: () {
                    _onPress(context, 'RaisedButton');
                  },
                ),
                RaisedButton(
                  elevation: 0,
                  highlightElevation: 0,
                  child: Text('RaisedButton.withoutElevation'),
                  onPressed: () {
                    _onPress(context, 'RaisedButton.withoutElevation');
                  },
                ),
                RaisedButton.icon(
                  onPressed: () {
                    _onPress(context, 'RaisedButton.icon');
                  },
                  icon: Icon(Icons.language),
                  label: Text('RaisedButton.icon'),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('RaisedButton RoundedRectangleBorder'),
                  onPressed: () {
                    _onPress(context, 'RaisedButton RoundedRectangleBorder');
                  },
                ),
                RaisedButton(
                  shape: StadiumBorder(),
                  child: Text('RaisedButton StadiumBorder'),
                  onPressed: () {
                    _onPress(context, 'RaisedButton StadiumBorder');
                  },
                ),
                FlatButton(
                  child: Text('FlatButton'),
                  splashColor: Colors.blue,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    _onPress(context, 'FlatButton');
                  },
                ),
                FlatButton.icon(
                    onPressed: () {
                      _onPress(context, 'FlatButton.icon');
                    },
                    icon: Icon(Icons.message),
                    label: Text('FlatButton.icon')),
                OutlineButton(
                  child: Text('OutlineButton'),
                  highlightColor: Colors.lime,
                  onPressed: () {
                    _onPress(context, 'OutlineButton');
                  },
                ),
                OutlineButton(
                  child: Text('OutlineButton shape'),
                  shape: StadiumBorder(),
                  highlightedBorderColor: Colors.redAccent,
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  onPressed: () {
                    _onPress(context, 'OutlineButton shape');
                  },
                ),
                Container(
                  color: Colors.lime,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.pinkAccent,
                    onPressed: () {
                      _onPress(context, 'IconButton');
                    },
                  ),
                ),
                ButtonTheme(
                  minWidth: 0,
                  height: 0,
                  padding: EdgeInsets.all(5),
                  highlightColor: Colors.lime,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: FlatButton(
                    child: Text('ButtonTheme'),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orange)),
                    onPressed: () {
                      _onPress(context, 'ButtonTheme');
                    },
                  ),
                ),
                Button(
                  child: Text('Custom button'),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                  borderColor: Colors.pinkAccent,
                  borderWidth: 0,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  onPressed: () {
                    _onPress(context, 'Custom button');
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<PopupMenuEntry> _renderMenuButtonItems(BuildContext context) {
    return [
      PopupMenuItem(
        value: 1,
        child: Text("Morining"),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Afternoon"),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Evening"),
      ),
      PopupMenuItem(
        child: Text("Select language"),
        enabled: false,
      ),
      PopupMenuDivider(
        height: 5,
      ),
      CheckedPopupMenuItem(
        child: Text(
          "English",
        ),
        value: 'English',
        checked: true,
      ),
      CheckedPopupMenuItem(
        child: Text(
          "Chinese",
        ),
        value: 'Chinese',
        checked: false,
      ),
    ];
  }

  void _onPress(BuildContext context, String title) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(title),
      duration: Duration(seconds: 2),
    ));
  }
}
