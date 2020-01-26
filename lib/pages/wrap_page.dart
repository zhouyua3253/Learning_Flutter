import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WRAP'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Text('Wrap with spacing: 10 and runSpacing: 20'),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  // alignment 主轴上怎么分布， 必须指定主轴的size
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 100,
                      color: Colors.cyan,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.redAccent,
                    ),
                    Container(
                      width: 130,
                      height: 50,
                      color: Colors.orangeAccent,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      color: Colors.purple,
                    ),
                    Container(
                      width: 60,
                      height: 140,
                      color: Colors.blueGrey,
                    ),
                    Image.asset(
                      'images/1.jpg',
                      height: 120,
                    )
                  ],
                ),
              ),
              Divider(
                height: 40,
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 100,
                      color: Colors.cyan,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.redAccent,
                    ),
                    Container(
                      width: 130,
                      height: 50,
                      color: Colors.orangeAccent,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      color: Colors.purple,
                    ),
                    Container(
                      width: 60,
                      height: 140,
                      color: Colors.blueGrey,
                    ),
                    Image.asset(
                      'images/1.jpg',
                      height: 120,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
