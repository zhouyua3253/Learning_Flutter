import 'package:flutter/material.dart';

class ListWheelScrollViewPage extends StatelessWidget {
  static String routeName = 'ListWheelScrollView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListWheelScrollView'),
      ),
      body: Container(
        child: ListWheelScrollView(
          itemExtent: 80,
          children: _renderList(),

          /// 直径
          diameterRatio: 2,

          /// 偏移
          // offAxisFraction: -0.5,
          /// 放大器
          useMagnifier: true,
          magnification: 1.3,
        ),
      ),
    );
  }

  List<Widget> _renderList() {
    List<String> array = List.generate(100, (index) => "Option - ${index + 1}");

    return array
        .map((e) => Container(
              child: Text(e),
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.redAccent[100], borderRadius: BorderRadius.circular(10)),
            ))
        .toList();
  }
}
