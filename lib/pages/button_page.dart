import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/utils/logger.dart';
import 'package:like_button/like_button.dart';

class ButtonPage extends StatefulWidget {
  static String routeName = 'Buttons';

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  String _dropdownButtonValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('PopupMenuButton'),
                  PopupMenuButton<Object>(
                    // child: Text('PopupMenuButton'),
                    offset: Offset(0, 200),
                    tooltip: '选择器pop-up',
                    shape: RoundedRectangleBorder(
                        // side: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
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
                  Container(
                    width: 200,
                    child: DropdownButton<String>(
                      hint: Text('请选择'),
                      value: _dropdownButtonValue,
                      icon: Icon(
                        Icons.add,
                        color: Colors.redAccent,
                      ),
                      // 占满空间
                      isExpanded: true,
                      elevation: 16,
                      items: [
                        DropdownMenuItem(
                          child: Text('DropdownButton-1'),
                          value: 'DropdownButton-1',
                        ),
                        DropdownMenuItem(
                            child: Text('DropdownButton-2'),
                            value: 'DropdownButton-2'),
                        DropdownMenuItem(
                            child: Text('DropdownButton-3'),
                            value: 'DropdownButton-3'),
                      ],
                      onChanged: (value) => setState(() {
                        printError(value);
                        _dropdownButtonValue = value;
                      }),
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
                  Divider(),
                  Text(
                    'Button shape',
                    textScaleFactor: 2,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orangeAccent, width: 2)),
                    child: Text('RoundedRectangleBorder'),
                    onPressed: () {
                      _onPress(context, 'RoundedRectangleBorder');
                    },
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('RoundedRectangleBorder+borderRadius'),
                    onPressed: () {
                      _onPress(context, 'RoundedRectangleBorder+borderRadius');
                    },
                  ),
                  RaisedButton(
                    shape: StadiumBorder(),
                    child: Text('StadiumBorder'),
                    onPressed: () {
                      _onPress(context, 'StadiumBorder');
                    },
                  ),
                  RaisedButton(
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.redAccent)),
                    child: Text('StadiumBorder+side'),
                    onPressed: () {
                      _onPress(context, 'StadiumBorder+side');
                    },
                  ),
                  RaisedButton(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('BeveledRectangleBorder'),
                    onPressed: () {
                      _onPress(context, 'BeveledRectangleBorder');
                    },
                  ),
                  RaisedButton(
                    shape: BeveledRectangleBorder(
                        side: BorderSide(color: Colors.cyan),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('BeveledRectangleBorder+side'),
                    onPressed: () {
                      _onPress(context, 'BeveledRectangleBorder+side');
                    },
                  ),
                  Divider(),
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
                  Text('IconButton'),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.pinkAccent,
                    onPressed: () {
                      _onPress(context, 'IconButton');
                    },
                  ),
                  Container(
                    color: Colors.grey,
                    child: IconButton(
                      icon: Icon(Icons.camera),
                      iconSize: 40,
                      color: Colors.lime,
                      onPressed: () {
                        _onPress(context, 'IconButton');
                      }
                    ),
                  ),
                  Divider(),
                  ButtonTheme(
                    minWidth: 0,
                    height: 0,
                    padding: const EdgeInsets.all(16),
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
                  LikeButton(
                    size: 64,
                    animationDuration: Duration(seconds: 2),
                    circleColor:
                        CircleColor(start: Colors.cyan, end: Colors.yellow),
                    bubblesSize: 120,
                    bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.redAccent,
                        dotSecondaryColor: Colors.deepPurpleAccent),
                    likeBuilder: (bool isLiked) => Icon(
                      Icons.star,
                      color: isLiked ? Colors.pink : Colors.grey,
                      size: 64,
                    ),
                    onTap: (bool isLiked) async {
                      print("old status $isLiked");
                      return Future.delayed(Duration.zero, () {
                        print("new status ${!isLiked}");
                        return !isLiked;
                      });
                    },
                  ),
                ],
              ),
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
