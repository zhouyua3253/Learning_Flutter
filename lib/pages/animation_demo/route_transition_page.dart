import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class RouteTransitionPage extends StatelessWidget {
  static String routeName = 'RouteTransition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RouteTransition'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('fade'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.fade)),
              RaisedButton(
                  child: Text('rightToLeft'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.rightToLeft)),
              RaisedButton(
                  child: Text('leftToRight'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.leftToRight)),
              RaisedButton(
                  child: Text('upToDown'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.upToDown)),
              RaisedButton(
                  child: Text('downToUp'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.downToUp)),
              RaisedButton(
                  child: Text('scale'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.scale)),
              RaisedButton(
                  child: Text('rotate'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.rotate)),
              RaisedButton(
                  child: Text('size'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.size)),
              RaisedButton(
                  child: Text('rightToLeftWithFade'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.rightToLeftWithFade)),
              RaisedButton(
                  child: Text('leftToRightWithFade'),
                  onPressed: () => _pushNewPage(context, PageTransitionType.leftToRightWithFade))
            ],
          ),
        ),
      ),
    );
  }

  void _pushNewPage(BuildContext context, PageTransitionType type) {
    /// https://pub.dev/packages/page_transition
    Navigator.of(context).push<PageTransition>(PageTransition(
        type: type,
        child: HomePage(),
        alignment: Alignment.center,
        duration: Duration(milliseconds: 600)));
  }
}
