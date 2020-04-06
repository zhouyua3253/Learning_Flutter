import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<int> _items = List<int>.generate(50, (index) => index + 1);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      ScrollPosition position = _scrollController.position;
      double minScrollExtent = position.minScrollExtent;
      double maxScrollExtent = position.maxScrollExtent;
      print("offset -> $offset, range -> [$minScrollExtent, $maxScrollExtent]");
    });
  }

  @override
  void dispose() {
    /* Release _scrollController.listener */
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollToTop() {
    // _scrollController.jumpTo(0);
    _scrollController.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: RefreshIndicator(
                onRefresh: _onFresh,
                color: Colors.red,
                child: CupertinoScrollbar(
                  child: ListView(
                    // Bounces
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    children: <Widget>[
                      // All the children widgets will be rendered at the begining
                      Container(
                        color: Colors.orangeAccent,
                        padding:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                        child: Text(
                            'RefreshIndicator + CupertinoScrollbar + ListView(\nchildren: <Widget>[])'),
                      ),
                      Image.asset(
                        'images/1.jpg',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Container(
                          color: Colors.redAccent[100],
                          height: 500,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 80,
                          )),
                      Image.asset('images/2.jpg'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(5),
                      child: Button(
                          onPressed: _scrollToTop,
                          child: Text('controller: 监听滑动\n点击滑到顶部'))),
                  Expanded(
                      flex: 1,
                      child: CupertinoScrollbar(
                        child: ListView.builder(
                          // Disable bounces
                            physics: ClampingScrollPhysics(),
                            controller: _scrollController,
                            itemCount: _items.length,
                            // 强制每个Item的高度
                            itemExtent: 80,
                            itemBuilder: _renderItemWithBorder),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: RefreshIndicator(
                onRefresh: _onFresh,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: _items.length,
                  itemBuilder: _renderItemWithoutBorder,
                  separatorBuilder: _renderSeparator,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItemWithBorder(BuildContext context, int index) {
    double scale = MediaQuery.of(context).devicePixelRatio;
    return Container(
      alignment: Alignment.centerLeft,
      decoration:
      BoxDecoration(border: Border(bottom: BorderSide(width: 1 / scale))),
      child: Text(
          "ListView.builder()\nitemExtent: 指定高度\n自己渲染border-${_items[index]}"),
    );
  }

  Widget _renderItemWithoutBorder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("ListView.separated()\nseparator-${index + 1}"),
    );
  }

  Widget _renderSeparator(BuildContext context, int index) {
    Color color = index % 2 == 0 ? Colors.red : Colors.tealAccent;

    return Divider(
      color: color,
    );
  }

  Future<void> _onFresh() {
    return Future.delayed(Duration(seconds: 2), () {
      print('On refresh fiished.');
    });
  }
}
