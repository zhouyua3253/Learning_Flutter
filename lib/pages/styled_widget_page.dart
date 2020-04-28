import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

Widget CustomStylesCard({@required Widget child}) => child
    .padding(all: 20)
    .decorated(
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(10),
    )
    .elevation(10);

class StyledWidgetPage extends StatefulWidget {
  static const routeName = '/styled-widget';

  @override
  _StyledWidgetPageState createState() => _StyledWidgetPageState();
}

class _StyledWidgetPageState extends State<StyledWidgetPage> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> columnList = [
      Text('Text bold italic fontSize textColor spacing textAlignment')
          .bold()
          .italic()
          .fontSize(24)
          .letterSpacing(5)
          .wordSpacing(10)
          .textColor(Colors.orange)
          .textAlignment(TextAlign.center),
      Text('Text copyWith').copyWith(textScaleFactor: 3).backgroundColor(Colors.grey[200]),
      Text(
        'textShadow',
        textScaleFactor: 2,
      )
          .textColor(Colors.purple)
          .textShadow(blurRadius: 10, color: Colors.red, offset: Offset(2, 2)),
      Text('textElevation', textScaleFactor: 2.5).textElevation(10, color: Colors.green),

      Text('Icon').padding(top: 20),
      Icon(Icons.language).iconColor(Colors.indigo).iconSize(32),
      Text('width height backgroundColor').padding(top: 20),
      Container().width(300).height(50).backgroundColor(Colors.lime),
      Text('border').padding(top: 20),
      Container().width(300).height(50).border(top: 0.5, left: 4, right: 2, bottom: 5),
      Text('decorated shape/borderRadius').padding(top: 20),
      Container().width(300).height(50).decorated(shape: BoxShape.circle, color: Colors.red),

      Text('aspectRatio').padding(top: 20),
      Text('5: 1')
          .center()
          .backgroundColor(Colors.grey[200])
          .aspectRatio(aspectRatio: 5)
          .width(300),
      Text('backgroundImage').padding(top: 20),
      Container()
          .width(300)
          .height(100)
          .backgroundImage(DecorationImage(image: AssetImage('images/2.jpg'), fit: BoxFit.cover)),

      Text('clipOval').padding(top: 20),
      Container(width: 300, height: 60, color: Colors.greenAccent).clipOval(),

      Text('clipRRect').padding(top: 20),
      Image.asset(
        'images/1.jpg',
        width: 200,
      ).clipRRect(topLeft: 50, topRight: 20, bottomLeft: 30, bottomRight: 100),

      Text('elevation').padding(top: 20),
      Container(width: 300, height: 60, color: Colors.purple).elevation(20),

      Text('boxShadow').padding(top: 20),
      Container(width: 300, height: 60, color: Colors.amberAccent)
          .boxShadow(color: Colors.deepOrangeAccent, blurRadius: 10, offset: Offset(5, 5)),

      Text('constrained width/height max/min width height').padding(top: 20),
      Container(width: 300, height: 100, color: Colors.blueGrey)
          .constrained(width: 200, height: 50),

      Text(
        'rotate',
        textScaleFactor: 2,
      ).textColor(Colors.red).rotate(angle: 1.23).padding(top: 30),

      Text('scale').textColor(Colors.red).scale(7).padding(top: 30),

      Text(
        'translate',
        textScaleFactor: 3,
      ).textColor(Colors.red).translate(offset: Offset(100, 20)).padding(top: 30),

      Text('scrollable').padding(top: 40),
      Text('ScrollView horizontal')
          .padding(all: 40)
          .scrollable(scrollDirection: Axis.horizontal, physics: AlwaysScrollableScrollPhysics())
          .width(double.maxFinite)
          .backgroundColor(Colors.grey[100]),

      Text('toColumn/toRow + expanded').padding(top: 20),
      [
        Container(
          width: 100,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text('width: 100'),
        ),
        Text('Eexpanded: 1').center().backgroundColor(Colors.lime).expanded(),
      ].toRow().height(100),

      Text('toStack + positioned').padding(top: 20),
      [
        Text('stack 1')
            .padding(all: 50)
            .backgroundColor(Colors.deepOrangeAccent)
            .positioned(left: 10, bottom: 20),
        Text('stack 2')
            .padding(all: 50)
            .backgroundColor(Colors.blueAccent)
            .positioned(right: 40, top: 20),
      ].toStack().constrained(width: 300, height: 150).backgroundColor(Colors.grey[200]),

      Text('gestures')
          .padding(all: 40)
          .backgroundColor(Colors.cyan[100])
          .gestures(
              onTapDown: (tapState) => print('onTapDown $tapState'),
              onLongPress: () => print('onLongPress'))
          .padding(top: 20),

      /// Gradient
      Text('backgroundLinearGradient').padding(top: 20),
      Container().width(200).height(100).backgroundLinearGradient(
          colors: [Colors.red, Colors.orange, Colors.greenAccent],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.2, 0.5, 0.9]),
      Text('backgroundRadialGradient').padding(top: 20),
      Container().width(200).height(100).backgroundRadialGradient(
          colors: [Colors.red, Colors.orange, Colors.greenAccent],
          // tileMode: TileMode.mirror,
          radius: 0.6),

      Text('backgroundSweepGradient').padding(top: 20),
      Container().width(100).height(100).backgroundSweepGradient(
          colors: [Colors.red, Colors.orange, Colors.grey, Colors.greenAccent, Colors.red]),

      Text('Card').padding(top: 20),
      FlutterLogo()
          .constrained(width: 300, height: 100)
          .card(color: Colors.blue[50], elevation: 10),

      /// Custom Template
      Text('CustomStyles Widget').padding(top: 40),
      CustomStylesCard(
          child: RaisedButton(
        child: Text('Button'),
        onPressed: null,
      )),

      Text('Animation').padding(top: 40),
      Text('animation')
          .padding(all: _status ? 50 : 100, animate: true)
          .backgroundColor(_status ? Colors.blue : Colors.red, animate: true)
          .clipRRect(all: _status ? 0 : 100, animate: true)
          .animate(Duration(seconds: 2), Curves.linear),

      RaisedButton(
        child: Text('Change status'),
        onPressed: () {
          setState(() {
            _status = !_status;
          });
        },
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('styled_widget'),
      ),
      body: SafeArea(
        child: columnList.toColumn().scrollable().width(double.infinity),
      ),
    );
  }
}
