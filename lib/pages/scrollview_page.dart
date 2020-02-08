import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollViewPage extends StatefulWidget {
  @override
  _ScrollViewPageState createState() => _ScrollViewPageState();
}

class _ScrollViewPageState extends State<ScrollViewPage> {
  final _scrollController = ScrollController();

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
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    child: Container(
                      width: 600,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        'physics: BouncingScrollPhysics',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Divider(),
              Expanded(
                flex: 1,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (event) {
                    // print(event);

                    if (event is ScrollStartNotification) {
                      print("ScrollStart ${event.dragDetails}");
                    }
                    if (event is ScrollUpdateNotification) {
                      print("scrolling ${event.scrollDelta}");
                    }
                    if (event is ScrollEndNotification) {
                      print("scrollEnd ${event.dragDetails}");
                    }

                    return true;
                  },
                  child: CupertinoScrollbar(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        width: 600,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text(
                          'physics: ClampingScrollPhysics',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              Divider(),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    width: 600,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      'physics: NeverScrollableScrollPhysics',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Divider(),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    width: 320,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text(
                      'physics: AlwaysScrollableScrollPhysics',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
