import 'package:flutter/material.dart';

extension on double {
  Duration get seconds {
    int milliseconds = (this * 1000).toInt();
    return Duration(milliseconds: milliseconds);
  }
}

extension on String {
  String operator <<(int shift) {
    return this.substring(shift, this.length) + this.substring(0, shift);
  }

  Color get toColor {
    String hexColor = this.replaceAll("#", "");

    if (hexColor.length == 6) {
      return Color(int.parse("0xFF$hexColor"));
    }

    if (hexColor.length != 8) {
      return null;
    }
    return Color(int.parse("0x$hexColor"));
  }
}
