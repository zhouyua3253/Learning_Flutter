import 'package:flutter/material.dart';

// Official library
//import 'dart:html' as html;
//import 'dart:js' as js;
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;

class HtmlJsPage extends StatelessWidget {
  static const String routeName = '/html-js';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML & JS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('call html'),
              onPressed: () {
                html.window.alert('call alert from html');
              },
            ),
            RaisedButton(
              child: Text('call js'),
              onPressed: () {
                js.context?.callMethod('alert', ['call alert from js']);
              },
            )
          ],
        ),
      ),
    );
  }
}
