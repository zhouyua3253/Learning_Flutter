import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/pages/blurhash_page.dart';
import 'package:flutter_tutorial/pages/button_page.dart';
import 'package:flutter_tutorial/pages/future_builder_page.dart';
import 'package:flutter_tutorial/pages/global_notification_page.dart';
import 'package:flutter_tutorial/pages/line_icon_page.dart';
import 'package:flutter_tutorial/pages/list_wheel_scrollview_page.dart';
import 'package:flutter_tutorial/pages/network_page.dart';
import 'package:flutter_tutorial/pages/pageview_page.dart';
import 'package:flutter_tutorial/pages/positioned_list_page.dart';
import 'package:flutter_tutorial/pages/provider_page.dart';
import 'package:flutter_tutorial/pages/scaffold_page.dart';
import 'package:flutter_tutorial/pages/shader_mask_page.dart';
import 'package:flutter_tutorial/pages/stream_builder_page.dart';
import 'package:flutter_tutorial/pages/swiper_page.dart';
import 'package:flutter_tutorial/pages/system_api_page.dart';
import 'package:flutter_tutorial/pages/tinder_card_page.dart';
import 'package:flutter_tutorial/pages/transform_page.dart';
import 'package:flutter_tutorial/pages/blur_mask_page.dart';
import 'package:flutter_tutorial/pages/clip_page.dart';
import 'absorb_pointer_page.dart';
import 'animation_demo/animated_list_page.dart';
import 'curved_navigation_bar_page.dart';
import 'dismissible_page.dart';
import 'google_nav_bar_page.dart';
import 'linked_scroll_page.dart';

class HomePage extends StatelessWidget {
  final List<String> _items = [
    'Container',
    ButtonPage.routeName,
    ScaffoldPage.routeName,
    TransformPage.routeName,
    'Stack',
    'Text',
    'Image',
    LineIconPage.routeName,
    'Column',
    'Wrap',
    'TextField',
    'TextFormField',
    'ScrollView',
    'ListView',
    ScrollablePositionedListPage.routeName,
    'GridView',
    LinkedScrollPage.routeName,
    'Waterfall',
    ListWheelScrollViewPage.routeName,
    AnimatedListPage.routeName,
    'Sliver',
    'Opacity',
    'Gradient',
    'Dialog',
    'Picker',
    GoogleNavBarPage.routeName,
    'Animation',
    DismissiblePage.routeName,
    '水波纹',
    ShaderMaskPage.routeName,
    AbsorbPointerPage.routeName,
    ClipPage.routeName,
    BlurPage.routeName,
    BlurHashPage.routeName,
    PageViewPage.routeName,
    SwiperPage.routeName,
    TinderCardPage.routeName,
    CurvedNavigationBarPage.routeName,
    GlobalNotificationPage.routeName,
    FutureBuilderPage.routeName,
    StreamBuilderPage.routeName,
    ProviderFirstPage.routeName,
    NetworkPage.routeName,
    SystemApiPage.routeName
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text("第一个demo"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.5,
            children: _items.map((e) => _renderItem(context, e)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, String item) {
    return FlatButton(
      child: Text(
        item,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.redAccent[200],
      onPressed: () {
        _onClickButton(context, item);
      },
    );
  }

  void _onClickButton(BuildContext context, String btnName) {
    Navigator.pushNamed(context, "/$btnName");
  }
}
