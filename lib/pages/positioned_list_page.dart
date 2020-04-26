import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// https://pub.dev/packages/scrollable_positioned_list
class ScrollablePositionedListPage extends StatefulWidget {
  static const String routeName = '/scroll-positioned-listView';

  @override
  _ScrollablePositionedListPageState createState() => _ScrollablePositionedListPageState();
}

class _ScrollablePositionedListPageState extends State<ScrollablePositionedListPage> {
  final _itemScrollController = ItemScrollController();
  final _itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    _itemPositionsListener.itemPositions.addListener(_listenVisibleItems);

    super.initState();
  }

  @override
  void dispose() {
    _itemPositionsListener.itemPositions.removeListener(_listenVisibleItems);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScrollablePositionedListPage.routeName),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Scrollbar(
                child: ScrollablePositionedList.builder(
                    itemCount: 5000,
                    itemBuilder: (context, index) => Container(
                          alignment: Alignment.center,
                          child: Text('Item $index'),
                          padding: const EdgeInsets.all(16),
                        ),
                    itemScrollController: _itemScrollController,
                    itemPositionsListener: _itemPositionsListener),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(child: Text('Jump to 999'), onPressed: _jumpTo),
                SizedBox(width: 30),
                RaisedButton(child: Text('Scroll to 3456'), onPressed: _scrollTo),
              ],
            ),
          ],
        )),
      ),
    );
  }

  void _jumpTo() {
    _itemScrollController.jumpTo(index: 999);
  }

  void _scrollTo() {
    _itemScrollController.scrollTo(
        index: 3456, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _listenVisibleItems() {
    print(_itemPositionsListener.itemPositions.value.toList());
  }
}
