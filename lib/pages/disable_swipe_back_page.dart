import 'package:flutter/material.dart';

class DisableSwipeBackPage extends StatelessWidget {
  static const String routeName = '/disable-back';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName),
      ),
      body: WillPopScope(
          child: Center(
            child: FlatButton(
              child: Text('pop: Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          onWillPop: () => _onWillPop(context)),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    /// Disable all the back action.
    return false;

    /// Disable Swipe to Navigate Back
    if (Navigator.of(context).userGestureInProgress) {
      return false;
    } else {
      return true;
    }
  }
}
