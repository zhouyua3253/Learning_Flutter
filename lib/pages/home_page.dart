import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/pages/future_builder_page.dart';
import 'package:flutter_tutorial/pages/network_page.dart';
import 'package:flutter_tutorial/pages/swiper_page.dart';
import 'package:flutter_tutorial/pages/system_api_page.dart';
import 'package:flutter_tutorial/pages/transform_page.dart';

import 'blur_mask_page.dart';
import 'clip_page.dart';

class HomePage extends StatelessWidget {
  final List<String> _items = [
    'Container',
    TransformPage.routeName,
    'Stack',
    'Text',
    'Image',
    'Column',
    'Wrap',
    'TextField',
    'TextFormField',
    'ScrollView',
    'ListView',
    'GridView',
    'Waterfall',
    'Sliver',
    'Opacity',
    'Gradient',
    'Dialog',
    'Picker',
    'Animation',
    '水波纹',
    ClipPage.routeName,
    BlurPage.routeName,
    SwiperPage.routeName,
    FutureBuilderPage.routeName,
    NetworkPage.routeName,
    SystemApiPage.routeName
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text("第一个demo"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.5,
            children: _items.map((e) => _renderItem(context, e)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, String item) {
    return Button(
      child: Text(
        item,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.redAccent[200],
      onPressed: () {
        _onClickButton(context, item);
      },
    );
  }

  void _onClickButton(BuildContext context, String btnName) {
    Navigator.pushNamed(context, "/$btnName");
  }
}
