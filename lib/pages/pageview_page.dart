import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  static const String routeName = '/pageView';

  final _pageViews = [
    Image.asset(
      'images/1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/3.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/4.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/5.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/6.jpg',
      fit: BoxFit.cover,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView 分页滑动'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Horizontal'),
              ),
              Expanded(
                child: Container(
                  color: Colors.lime,
                  child: PageView(
                    children: _pageViews,
                  ),
                ),
              ),
              Text('Horizontal 无分页效果'),
              Expanded(
                child: Container(
                  color: Colors.lime,
                  child: PageView(children: _pageViews, pageSnapping: false),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Vertical'),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: _pageViews,
                  ),
                ),
              ),
              Text('PageView.builder'),
              Expanded(
                child: PageView.builder(itemCount: _pageViews.length, itemBuilder: _itemBuilder),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: _pageViews[index]),
        Center(
          child: Text(
            'index - $index',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        )
      ],
    );
  }
}
