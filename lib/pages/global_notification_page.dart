import 'package:flutter/material.dart';
import 'package:livestream/livestream.dart';

LiveStream NOTIFICATION_CENTER = LiveStream();
const NOTIFICATION_EVENT1 = 'NOTIFICATION_EVENT1';

class GlobalNotificationPage extends StatefulWidget {
  static String routeName = 'GlobalNotification';

  @override
  _GlobalNotificationPageState createState() => _GlobalNotificationPageState();
}

class _GlobalNotificationPageState extends State<GlobalNotificationPage> {
  /// GlobalKey 非常昂贵，尽量不使用
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    NOTIFICATION_CENTER.on(NOTIFICATION_EVENT1, _onReceiveNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('livestream')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Send global notification'),
              onPressed: _sendNotification,
            )
          ],
        ),
      ),
    );
  }

  void _sendNotification() {
    NOTIFICATION_CENTER.emit(NOTIFICATION_EVENT1, DateTime.now());
  }

  void _onReceiveNotification(Object data) {
    ScaffoldState scaffoldState = _scaffoldKey.currentState;

    if (scaffoldState != null) {
      scaffoldState.showSnackBar(SnackBar(
        content: Text(data.toString()),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
