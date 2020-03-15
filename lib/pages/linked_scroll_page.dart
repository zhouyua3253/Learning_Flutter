import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class LinkedScrollPage extends StatefulWidget {
  static String routeName = 'LinkedScroll';

  @override
  _LinkedScrollPageState createState() => _LinkedScrollPageState();
}

class _LinkedScrollPageState extends State<LinkedScrollPage> {
  /// https://pub.dev/packages/linked_scroll_controller
  /// 几个ScrollView 滚动相同的偏移
  LinkedScrollControllerGroup _controllers = LinkedScrollControllerGroup();
  ScrollController _controller1;
  ScrollController _controller2;
  ScrollController _controller3;

  @override
  void initState() {
    super.initState();

    _controller1 = _controllers.addAndGet();
    _controller2 = _controllers.addAndGet();
    _controller3 = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LinkedScrollPage.routeName),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                        itemCount: 500,
                        itemBuilder: _renderItem1,
                        controller: _controller1,
                      ),
                    )),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                        itemCount: 999,
                        itemBuilder: _renderItem2,
                        controller: _controller2,
                      ),
                    ))
                  ],
                )),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: _renderItem2,
                controller: _controller3,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItem1(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text("item - $index"),
      alignment: Alignment.center,
    );
  }

  Widget _renderItem2(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text("item - $index"),
      alignment: Alignment.center,
    );
  }
}
