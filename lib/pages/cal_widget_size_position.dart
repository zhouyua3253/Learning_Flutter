import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/logger.dart';

class CalWidgetSizePositionPage extends StatefulWidget {
  static const String routeName = '/cal-size-position';

  @override
  _CalWidgetSizePositionPageState createState() => _CalWidgetSizePositionPageState();
}

class _CalWidgetSizePositionPageState extends State<CalWidgetSizePositionPage> {
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    info('initState');
    /**
     * 页面加载完成后的callback
     */
    WidgetsBinding.instance.addPostFrameCallback(_afterMount);

    super.initState();
  }

  void _afterMount(Duration timeStamp) {
    info(timeStamp);

    _getWidgetSize(null);
    _getWidgetPosition(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CalWidgetSizePosition'),
        ),
        body: SafeArea(
          child: Builder(builder: (context) {
            return Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.indigo,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          'images/4.jpg',
                          key: _key,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.pink[200],
                      )),
                  RaisedButton(
                      child: Text('Get Widget Size'), onPressed: () => _getWidgetSize(context)),
                  RaisedButton(
                      child: Text('Get Widget Position'),
                      onPressed: () => _getWidgetPosition(context))
                ],
              ),
            );
          }),
        ));
  }

  /**
   * https://medium.com/@diegoveloper/flutter-widget-size-and-position-b0a9ffed9407
   */
  void _getWidgetSize(BuildContext context) {
    RenderBox node = _key.currentContext.findRenderObject() as RenderBox;
    Size size = node.size;
    if (context != null) {
      _showSnackBar(context, size);
    } else {
      print(size);
    }
  }

  void _getWidgetPosition(BuildContext context) {
    RenderBox node = _key.currentContext.findRenderObject() as RenderBox;
    Offset position = node.localToGlobal(Offset.zero);

    if (context != null) {
      _showSnackBar(context, position);
    } else {
      print(position);
    }
  }

  void _showSnackBar(BuildContext context, Object value) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(value.toString()),
      duration: Duration(seconds: 2),
    ));
  }
}
