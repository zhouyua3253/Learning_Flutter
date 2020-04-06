import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  final _items = List<int>.generate(19, (index) => index + 1);

  /// GridView 必须指定 childAspectRatio
  /// 默认为 1 等宽高
  @override
  Widget build(BuildContext context) {
    /// 指定横轴上子元素的个数
    SliverGridDelegateWithFixedCrossAxisCount _crossAxisCountDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8);

    /// 指定横轴上子元素的最大长度
    SliverGridDelegateWithMaxCrossAxisExtent _maxCrossAxisDelegate =
        SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250, mainAxisSpacing: 10, crossAxisSpacing: 20);

    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                children: _createGridItem(),
              ),
            ),
            Divider(),
            Expanded(
                flex: 1,
                child: CupertinoScrollbar(
                  child: GridView.extent(
                    scrollDirection: Axis.horizontal,
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    children: _createGridItems(),
                    childAspectRatio: 0.75,
                  ),
                )),
            Divider(),
            Expanded(
              flex: 1,
              child: Scrollbar(
                child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: _items.length,
                    gridDelegate: _maxCrossAxisDelegate,
                    itemBuilder: _renderGridItem),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _createGridItem() {
    return _items
        .map((item) => Container(
              color: Colors.cyan,
              alignment: Alignment.center,
              child: Text(
                  "$item\nGridView.count(\nchildren: <Widget>[]) with crossAxisCount：横轴子元素的数量",
                  textAlign: TextAlign.center),
            ))
        .toList();
  }

  List<Widget> _createGridItems() {
    return _items
        .map((item) => Container(
              color: Colors.red[300],
              alignment: Alignment.center,
              child: Text(
                  "$item\nGridView.extent(\nchildren: <Widget>[]) with maxCrossAxisExtent：横轴子元素的最大长度",
                  textAlign: TextAlign.center),
            ))
        .toList();
  }

  Widget _renderGridItem(BuildContext context, int index) => Container(
        color: Colors.orangeAccent,
        alignment: Alignment.center,
        child: Text(
          "${_items[index]}\nGridView.builder() with fixed AspectRatio",
          textAlign: TextAlign.center,
        ),
      );
}
