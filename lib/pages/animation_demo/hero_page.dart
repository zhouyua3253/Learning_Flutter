import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  static String heroTag = 'HERO_TAG';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero transition'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Hero(tag: HeroPage.heroTag, child: Image.asset('images/6.jpg')),
        ),
      ),
    );
  }
}
