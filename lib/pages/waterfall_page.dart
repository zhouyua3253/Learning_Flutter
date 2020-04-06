import 'dart:math';

import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WaterfallPage extends StatelessWidget {
  final List<Map<String, int>> _items = List.generate(
      10, (index) => {'index': index, 'height': Random().nextInt(100) + 50});

  @override
  Widget build(BuildContext context) {
    SliverWaterfallFlowDelegate _waterfallDelegate =
        SliverWaterfallFlowDelegate(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            viewportBuilder: _visibleItemsCallback,
            lastChildLayoutTypeBuilder: _childLayoutType);

    return Material(
      child: SafeArea(
        child: WaterfallFlow.builder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            physics: BouncingScrollPhysics(),
            itemCount: _items.length,
            gridDelegate: _waterfallDelegate,
            itemBuilder: _renderItem),
      ),
    );
  }

  Container _renderItem(BuildContext context, int index) {
    Color color = index == _items.length - 1 ? Colors.cyan : Colors.orange;
    String content = index == _items.length - 1
        ? "LastChildLayoutType.\nfullCrossAxisExtend"
        : "Index - $index";
    return Container(
      height: _items[index]['height'].toDouble(),
      color: color,
      alignment: Alignment.center,
      child: Text(content, textScaleFactor: 1.5),
    );
  }

  /// 监听可见的Items
  void _visibleItemsCallback(int firstIndex, int lastIndex) {
    print("Visible items start from $firstIndex to $lastIndex");
  }

  LastChildLayoutType _childLayoutType(int index) {
    /// 普通的
    /// LastChildLayoutType.none,
    /// ./waterfall_layout_1.png

    /// 将最后一个元素绘制在最大主轴Item之后，并且使用横轴大小最为layout size
    /// 主要使用在[ExtendedGridView] and [WaterfallFlow]中，最后一个元素作为loading/no more元素的时候。
    /// LastChildLayoutType.fullCrossAxisExtend,
    /// ./waterfall_layout_2.png

    /// 将最后一个child绘制在trailing of viewport，并且使用横轴大小最为layout size
    /// 这种常用于最后一个元素作为loading/no more元素，并且列表元素没有充满整个viewport的时候
    /// 如果列表元素充满viewport，那么效果跟fullCrossAxisExtend一样
    /// LastChildLayoutType.foot,
    /// ./waterfall_layout_3.png
    return index == _items.length - 1
        ? LastChildLayoutType.fullCrossAxisExtend
        : LastChildLayoutType.none;
  }
}
