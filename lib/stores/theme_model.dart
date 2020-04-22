import 'package:flutter/material.dart';

final _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final _lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

/**
 * Dynamic change theme
 * https://medium.com/better-programming/how-to-create-a-dynamic-theme-in-flutter-using-provider-e6ad1f023899
 */
class ThemeModel extends ChangeNotifier {
  ThemeModel(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      _themeData = _darkTheme;
    } else {
      _themeData = _lightTheme;
    }
  }

  ThemeData _themeData;

  ThemeData get theme => _themeData;

  void changeTheme() {
    if (_themeData == _darkTheme) {
      _themeData = _lightTheme;
    } else {
      _themeData = _darkTheme;
    }

    notifyListeners();
  }
}
