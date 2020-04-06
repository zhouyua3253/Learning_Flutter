import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TransformPage extends StatelessWidget {
  static String routeName = 'Transform';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Text('RotatedBox的变换是在layout阶\n会影响在子组件的位置和大小'),
              RotatedBox(
                  child: Container(
                    color: Colors.deepPurpleAccent[100],
                    child: Text(
                      'RotatedBox',
                      textScaleFactor: 1.5,
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  quarterTurns: 1),
              Divider(),
              Text('Transform的变换是应用在绘制阶段\n不是应用在布局(layout)阶段'),
              SizedBox(
                height: 16,
              ),
              Transform(
                transform: Matrix4.skewX(0.3),
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.cyan,
                  child: Text(
                    'skewX',
                    textScaleFactor: 3,
                  ),
                ),
              ),
              Divider(),
              Transform(
                transform: Matrix4.rotationZ(0.3),
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    'rotationZ',
                    textScaleFactor: 3,
                  ),
                ),
              ),
              Divider(),
              Transform.translate(
                offset: Offset(50, 80),
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.yellow,
                  child: Text(
                    'Transform.translate',
                    textScaleFactor: 3,
                  ),
                ),
              ),
              Divider(),
              Transform.scale(
                scale: 0.7,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.blueGrey,
                  child: Text(
                    'Transform.scale',
                    textScaleFactor: 3,
                  ),
                ),
              ),
              Divider(),
              Transform.rotate(
                angle: 1,
                alignment: Alignment.center,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text(
                    'Transform.rotate',
                    textScaleFactor: 3,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
