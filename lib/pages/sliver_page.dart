import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class SliverPage extends StatelessWidget {
  static const String routeName = '/sliver-scroll-view';

  final List<Map<String, int>> _items =
      List.generate(12, (index) => {'index': index, 'height': Random().nextInt(100) + 40});

  @override
  Widget build(BuildContext context) {
    final SliverChildBuilderDelegate _sliverFixedExtentBuildDelegate =
        SliverChildBuilderDelegate(_renderListFixedExtentItem, childCount: _items.length);
    final SliverChildBuilderDelegate _sliverBuildDelegate =
        SliverChildBuilderDelegate(_renderListItem, childCount: _items.length);

    return Material(
      child: SafeArea(
        top: false,
        child: NotificationListener(
          child: CustomScrollView(
            /// 安卓上超出范围的上下拉
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              /// 自己实现 SliverPersistentHeader
//              SliverPersistentHeader(
//                pinned: true,
//                // floating: true,
//                delegate: MySliverPersistentHeader(minExtent: 70, maxExtent: 240),
//              ),
              SliverAppBar(
                // Based on `SliverPersistentHeader`
                /// 可以向下拉伸
                stretch: true,

                /// 下拉时立即出现
                floating: true,

                /// 粘滞效果
                pinned: false,
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

              /// 包裹普通Widget为Sliver Widget
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

              /// item高度固定的ListView
              SliverFixedExtentList(
                itemExtent: 60,
                delegate: _sliverFixedExtentBuildDelegate,
              ),

              /// 自己实现 SliverPersistentHeader
              SliverPersistentHeader(
                pinned: true,
                // floating: true,
                delegate: MySliverPersistentHeader(minExtent: 70, maxExtent: 240),
              ),

              /// item高度可变的ListView
              SliverList(
                delegate: _sliverBuildDelegate,
              ),

              SliverPadding(
                padding: const EdgeInsets.all(25),
                sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2,
                    children: _renderGridChildren(Colors.cyan, 'SliverGrid.count')),
              ),
              SliverGrid.extent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                  children: _renderGridChildren(Colors.yellow, 'SliverGrid.extent')),
            ],
          ),
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

/// The custom SliverPersistentHeader
class MySliverPersistentHeader implements SliverPersistentHeaderDelegate {
  MySliverPersistentHeader({@required double minExtent, @required double maxExtent})
      : _minExtent = minExtent,
        _maxExtent = maxExtent;

  final double _minExtent;
  final double _maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);

    /// 0 ~ 1
    double offsetPercentage = shrinkOffset / _maxExtent;
    double textOpacity = offsetPercentage * 0.5 + 0.5;
    double fontSize = 16 + offsetPercentage * 10;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('images/5.jpg', fit: BoxFit.cover),
        Container().backgroundLinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.deepOrangeAccent],
            stops: [0.4, 1]),
        Positioned(
          bottom: 16,
          right: 10,
          child: const Text('MySliverPersistentHeader')
              .textColor(Colors.white)
              .fontSize(fontSize)
              .opacity(textOpacity),
        )
      ],
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
