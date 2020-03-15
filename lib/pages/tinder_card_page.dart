import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class TinderCardPage extends StatelessWidget {
  static String routeName = 'TinderCard';

  final List<String> _images = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            animDuration: 300,
            orientation: AmassOrientation.LEFT,
            totalNum: _images.length,
            stackNum: 4,
            swipeEdge: 4,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                '${_images[index]}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
