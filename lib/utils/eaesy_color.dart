import 'package:flutter/material.dart';

const kEaesyColor = 0xFFFF6347;

Map<int, Color> color = {
  50: Color(0x1AFF6347), // Color.fromRGBO(255,99,71, .1)
  100: Color(0x33FF6347), // Color.fromRGBO(255,99,71, .2)
  200: Color(0x4DFF6347), // Color.fromRGBO(255,99,71, .3)
  300: Color(0x66FF6347), // Color.fromRGBO(255,99,71, .4)
  400: Color(0x80FF6347), // Color.fromRGBO(255,99,71, .5)
  500: Color(0x99FF6347), // Color.fromRGBO(255,99,71, .6)
  600: Color(0xB3FF6347), // Color.fromRGBO(255,99,71, .7)
  700: Color(0xCCFF6347), // Color.fromRGBO(255,99,71, .8)
  800: Color(0xE6FF6347), // Color.fromRGBO(255,99,71, .9)
  900: Color(0xFFFF6347) // // Color.fromRGBO(255,99,71, 1)
};

MaterialColor EaesyColor = MaterialColor(kEaesyColor, color);
