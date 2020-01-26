import 'dart:math';

import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  final List<Map<String, int>> _items =
      List.generate(6, (index) => {'index': index, 'height': Random().nextInt(100) + 40});

  @override
  Widget build(BuildContext context) {
    SliverChildBuilderDelegate _sliverFixedExtentBuildDelegate =
        SliverChildBuilderDelegate(_renderListFixedExtentItem, childCount: _items.length);
    SliverChildBuilderDelegate _sliverBuildDelegate =
        SliverChildBuilderDelegate(_renderListItem, childCount: _items.length);
    return Material(
      child: SafeArea(
        top: false,
        child: CustomScrollView(
          /// 安卓上超出范围的上下拉
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar( // Based on `SliverPersistentHeader`
              /// 可以向下拉伸
              stretch: true,

              /// 粘滞效果
              pinned: true,
              expandedHeight: 250,
              backgroundColor: Colors.pinkAccent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                centerTitle: true,

                /// 向下拉伸放大时的效果
                stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
                background: Image.asset(
                  'images/3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.orange,
                padding: EdgeInsets.all(20),
                child: Text(
                  'SliverToBoxAdapter()\ncontains a single box widget',
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                height: 120,
                alignment: Alignment.center,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 60,
              delegate: _sliverFixedExtentBuildDelegate,
            ),
            SliverList(
              delegate: _sliverBuildDelegate,
            ),
            SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                  children: _renderGridChildren(Colors.cyan, 'SliverGrid.count')),
            ),
            SliverGrid.extent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
                children: _renderGridChildren(Colors.yellow, 'SliverGrid.extent'))
          ],
        ),
      ),
    );
  }

  Widget _renderListFixedExtentItem(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.all_inclusive),
      title: Text("SliverFixedExtentList()"),
      subtitle: Text("Index - $index"),
    );
  }

  Widget _renderListItem(BuildContext context, int index) {
    return Container(
      height: _items[index]['height'].toDouble(),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: Text("$index - SliverList()\nchildren have different extent"),
    );
  }

  List<Widget> _renderGridChildren(Color color, String type) {
    return _items
        .map((item) => Container(
              color: color,
              alignment: Alignment.center,
              child: Text("$type - ${item['index'] + 1}"),
            ))
        .toList();
  }
}
