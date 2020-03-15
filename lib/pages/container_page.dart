import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<Color> colors = [
    Colors.red[200],
    Colors.orange,
    Colors.cyan,
    Colors.grey,
    Colors.purple
  ];
  Color _color = Colors.grey[200];

  List<double> sizes = [100, 200, 150, 40, 250, 80];
  double _size = 220;

  List<double> borderRadius = [10, 20, 30, 40, 50];
  double _radius = 10;

  List<Alignment> aligns = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center
  ];
  Alignment _alignment = Alignment.topLeft;

  List<Widget> _children = [
    Icon(Icons.view_list),
    FlutterLogo(),
    Text('child'),
    Image.asset('images/2.jpg')
  ];
  int _childIndex = 0;

  void _changeContainerColor() {
    this.setState(() {
      int index = Random().nextInt(3);
      List<Color> validColors = colors.where((c) => c != _color).toList();
      _color = validColors[index];
    });
  }

  void _changeContainerSize() {
    this.setState(() {
      int index = Random().nextInt(4);
      List<double> validSizes = sizes.where((e) => e != _size).toList();
      _size = validSizes[index];
    });
  }

  void _changeContainerRadius() {
    this.setState(() {
      int index = Random().nextInt(4);
      List<double> validSizes =
          borderRadius.where((e) => e != _radius).toList();
      _radius = validSizes[index];
    });
  }

  void _startAlignmentAnimation() {
    this.setState(() {
      int index = Random().nextInt(3);
      List<Alignment> validAligns =
          aligns.where((e) => e != _alignment).toList();
      _alignment = validAligns[index];
    });
  }

  void _startChildAnimation() {
    int newChildIndex = _childIndex + 1;
    if (newChildIndex >= _children.length) {
      newChildIndex = 0;
    }
    this.setState(() {
      _childIndex = newChildIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text('Material: 使用elevation实现阴影效果\nborderRadius实现圆角，无法剪切child'),
              Material(
                elevation: 20,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
                color: Colors.cyan,
                child: Container(width: 100, height: 100),
              ),
              Material(
                elevation: 20,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
                child: Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              Material(
                elevation: 20,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
                child: Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueAccent,
                          offset: Offset(10, 20),
                          blurRadius: 15),
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(-10, -10),
                          blurRadius: 10),
                    ],
                    border: Border.all(color: Colors.blueGrey, width: 10),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    color: Colors.orange,
                    transform: Matrix4.rotationZ(-0.2),
                    child: Text('CONTAINER'),
                  ),
                ),
              ),
              Divider(
                height: 40,
              ),
              Text(
                'AnimatedContainer',
                textScaleFactor: 1.5,
              ),
              AnimatedContainer(
                width: _size,
                height: _size,
                child: _children[_childIndex],
                alignment: _alignment,
                // color: _color,
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                    color: _color,
                    border: Border.all(width: _radius, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(_radius))),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: <Widget>[
                  Button(
                    child: Text("Change color"),
                    padding: EdgeInsets.all(10),
                    onPressed: _changeContainerColor,
                  ),
                  Button(
                    child: Text("Change width & height"),
                    padding: EdgeInsets.all(10),
                    onPressed: _changeContainerSize,
                  ),
                  Button(
                    child: Text("Change border & radius"),
                    padding: EdgeInsets.all(10),
                    onPressed: _changeContainerRadius,
                  ),
                  Button(
                    child: Text("Alignment animation"),
                    padding: EdgeInsets.all(10),
                    onPressed: _startAlignmentAnimation,
                  ),
                  Button(
                    child: Text("Child animation 没有动画效果"),
                    padding: EdgeInsets.all(10),
                    onPressed: _startChildAnimation,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
