import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

enum ShowDialogMode {
  showDialog,
  showCupertinoDialog,
  showCupertinoModalPopup,
  showModalBottomSheet
}

class _DialogPageState extends State<DialogPage> {
  /// GlobalKey 非常昂贵，尽量不使用
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ShowDialogMode _showDialogMode = ShowDialogMode.showDialog;

  Function get _mShowDialog {
    switch (_showDialogMode) {
      case ShowDialogMode.showDialog:
        return showDialog;
      case ShowDialogMode.showCupertinoModalPopup:
        return showCupertinoModalPopup;
      case ShowDialogMode.showCupertinoDialog:
        return showCupertinoDialog;
      case ShowDialogMode.showModalBottomSheet:
      default:
        return showModalBottomSheet;
    }
  }

  List<Widget> _renderRadioGroup() {
    return ShowDialogMode.values
        .map((item) => RadioListTile(
              value: item,
              groupValue: _showDialogMode,
              onChanged: _onDialogModeChange,
              title: Text(item.toString().split('.')[1]),
            ))
//        .map((mode) => Row(
//              children: <Widget>[
//                SizedBox(
//                  width: 70,
//                ),
//                Radio<ShowDialogMode>(
//                    value: mode, groupValue: _showDialogMode, onChanged: _onDialogModeChange),
//                Text(mode.toString().split('.')[1])
//              ],
//            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ..._renderRadioGroup(),
            SizedBox(
              height: 10,
            ),
            Button(
                child: Text('show simple dialog'),
                padding: EdgeInsets.all(10),
                color: Colors.cyan,
                onPressed: () => _showSimpleDialog(context)),
            SizedBox(
              height: 10,
            ),
            Button(
                child: Text('show alert'),
                padding: EdgeInsets.all(10),
                color: Colors.cyan,
                onPressed: () => _showAlertDialog(context, true)),
            SizedBox(
              height: 10,
            ),
            Button(
              child: Text('show alert, cannot cancel'),
              padding: EdgeInsets.all(10),
              color: Colors.cyan,
              onPressed: () => _showAlertDialog(context, false),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              child: Text('show input dialog'),
              padding: EdgeInsets.all(10),
              color: Colors.cyan,
              onPressed: () => _showInputDialog(),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              child: Text('show scrollable dialog'),
              padding: EdgeInsets.all(10),
              color: Colors.cyan,
              onPressed: _showScrollDialog,
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              child: Text('show Cupertino action sheet'),
              padding: EdgeInsets.all(10),
              color: Colors.cyan,
              onPressed: _showActionSheet,
            ),
          ],
        ),
      ),
    );
  }

  void _onDialogModeChange(ShowDialogMode value) {
    setState(() {
      _showDialogMode = value;
    });
  }

  void _showSimpleDialog(BuildContext context) async {
    SimpleDialog dialog = SimpleDialog(
      title: Text('Simple dialog.'),
      children: <Widget>[
        SimpleDialogOption(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("SimpleDialogOption-1"),
          ),
          onPressed: () => Navigator.of(context).pop('SimpleDialogOption-1'),
        ),
        SimpleDialogOption(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("SimpleDialogOption-2"),
          ),
          onPressed: () => Navigator.of(context).pop('SimpleDialogOption-2'),
        ),
        Container(
          child: ListTile(title: Text("ListTile-3")),
          color: Colors.green,
        ),
        ListTile(title: Text("ListTile-4")),
        ListTile(title: Text("ListTile-5")),
      ],
    );

    String option =
        (await _mShowDialog(context: context, builder: (_) => dialog)
            as String);
    _displaySnackBar(option);
  }

  void _showAlertDialog(BuildContext context, bool cancelAble) async {
    AlertDialog dialog = AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Remove all the users.'),
      actions: <Widget>[
        Button(
          child: Text('YES'),
          textColor: Colors.red,
          onPressed: () {
            Navigator.of(context).pop('Click YES');
          },
        ),
        Button(
          child: Text('NO'),
          textColor: Colors.grey,
          onPressed: () {
            Navigator.of(context).pop('Click NO');
          },
        ),
      ],
    );

    /// Future<result> comes from Navigator.of(context).pop(result);
    String result = (await _mShowDialog(
        context: context,
        barrierDismissible: cancelAble,
        builder: (context) => dialog) as String);
    _displaySnackBar(result);
  }

  /// https://www.youtube.com/watch?v=FGfhnS6skMQ&list=PLybADvIp2cxgYovNF3r16TZjFD-4mcyMD&index=8
  void _showInputDialog() async {
    // Get context from GlobalKey
    BuildContext context = _scaffoldKey.currentContext;
    TextEditingController controller = TextEditingController();

    AlertDialog dialog = AlertDialog(
      title: Text('Your name?'),
      content: TextField(
        controller: controller,
      ),
      actions: <Widget>[
        Button(
          child: Text('Submit'),
          textColor: Colors.black87,
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
        )
      ],
    );

    /// String name comes from Navigator.of(context).pop(controller.text);
    String name = (await _mShowDialog(context: context, builder: (_) => dialog)
    as String);
    print("Input value is $name");

    _displaySnackBar(name);
  }

  void _showScrollDialog() {
    BuildContext context = _scaffoldKey.currentContext;

    SizedBox content = SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Text('使用Column+SingleChildScrollView来显示列表对话框'),
            Container(
              width: 60,
              height: 80,
              color: Colors.blueGrey,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 180,
              height: 150,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );

    AlertDialog dialog = AlertDialog(
      title: Text("Scollable dialog"),
      content: content,
      actions: <Widget>[
        Button(
          child: Text('Cool'),
          textColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );

    _mShowDialog(context: context, builder: (_) => dialog);
  }

  void _showActionSheet() async {
    BuildContext context = _scaffoldKey.currentContext;

    CupertinoActionSheet node = CupertinoActionSheet(
      title: Text('Show address in'),
      actions: <Widget>[
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop('Google Map');
            },
            child: Text('Google Map'),
            isDefaultAction: true),
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop('Apple Map');
            },
            child: Text('Apple Map'),
            isDefaultAction: false),
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop('Baidu Map');
            },
            child: Text('Baidu Map'),
            isDestructiveAction: true)
      ],
      cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop('Cancel');
          },
          isDestructiveAction: true),
    );

    String type =
    (await _mShowDialog(context: context, builder: (_) => node) as String);
    _displaySnackBar(type);
  }

  void _displaySnackBar(String content) {
    if (content != null) {
      SnackBar snackbar = SnackBar(
        content: Text(content),
      );

      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }
}
