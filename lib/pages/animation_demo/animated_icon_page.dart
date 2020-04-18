import 'package:flutter/material.dart';

List<AnimatedIconData> _icons = [
  AnimatedIcons.play_pause,
  AnimatedIcons.arrow_menu,
  AnimatedIcons.close_menu,
  AnimatedIcons.ellipsis_search,
  AnimatedIcons.event_add,
  AnimatedIcons.home_menu,
  AnimatedIcons.list_view,
  AnimatedIcons.menu_arrow,
  AnimatedIcons.menu_close,
  AnimatedIcons.menu_home,
  AnimatedIcons.pause_play,
  AnimatedIcons.play_pause,
  AnimatedIcons.search_ellipsis,
  AnimatedIcons.view_list
];

class AnimatedIconPage extends StatefulWidget {
  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  SliverGridDelegate _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 5);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedIcon'),
        ),
        body: GridView.builder(
          gridDelegate: _gridDelegate,
          itemBuilder: this._renderGridItem,
          itemCount: _icons.length,
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.play_arrow,
                size: 40,
              ),
              onPressed: () {
                _controller.forward();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.pause,
                size: 40,
              ),
              onPressed: () {
                _controller.reverse();
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }

  Widget _renderGridItem(BuildContext context, int index) {
    return Center(
      child: AnimatedIcon(
        icon: _icons[index],
        progress: _controller,
        size: 60,
      ),
    );
  }
}
