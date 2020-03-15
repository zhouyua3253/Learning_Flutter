import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.redAccent,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: 140,
                  color: Colors.purple,
                  child: Center(
                      child: Text(
                    'Expanded -> flex: 1',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              Text('Spacer -> flex: 1'),
              Spacer(),
              Container(
                width: 80,
                height: 120,
                color: Colors.cyan,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: double.infinity,
                  width: 120,
                  color: Colors.orange,
                  child: Center(
                      child: Text(
                    'Expanded -> flex: 3',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
