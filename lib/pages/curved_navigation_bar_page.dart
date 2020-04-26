import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationBarPage extends StatelessWidget {
  static const String routeName = '/curved-navigation-bar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurvedNavigationBar'),
      ),
      body: Container(
        color: Colors.lime,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Content',
          textScaleFactor: 2,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(Icons.add, size: 20),
            Icon(Icons.list, size: 20),
            Icon(Icons.compare_arrows, size: 20),
            Icon(Icons.favorite_border, size: 20),
            Icon(Icons.calendar_today, size: 20),
          ],
          onTap: (index) {
            print(index);
            // Navigator.of(context).pushNamed('/Gradient');
          },
          backgroundColor: Colors.lime,
          height: 50,
        ),
      ),
    );
  }
}
