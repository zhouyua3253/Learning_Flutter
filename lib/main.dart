import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/router.dart';
import 'package:flutter_tutorial/stores/counter_store.dart';
import 'package:flutter_tutorial/stores/user_store.dart';
import 'package:flutter_tutorial/utils/eaesy_color.dart' show kEaesyColor;
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final MultiProvider providerWrapApp = MultiProvider(
    providers: [
      ChangeNotifierProvider<CounterStore>(
        create: (_) => CounterStore(),
      ),
      ChangeNotifierProvider<UserStore>(
        create: (_) => UserStore(),
      )
    ],
    child: app,
  );

  runApp(providerWrapApp);
}

MaterialApp app = MaterialApp(
  title: 'Flutter',

  /// initialRoute is better to be '/'
  initialRoute: HomePage.routeName,

  /// Advanced route navigation, could format the url parameters
  onGenerateRoute: generateRoute,

  /// The basic route navigation
//   home: HomePage(),
//  routes: {
//    '/Home': (context) => HomePage(),
//    '/Container': (context) => ContainerPage(),
//    '/${ButtonPage.routeName}': (context) => ButtonPage(),
//    '/${ScaffoldPage.routeName}': (context) => ScaffoldPage()
//  },

  /// 监听路由变化
  navigatorObservers: [routeObserver],

  /**
   * set theme 和 darkTheme的brightness
   * 根据系统的light mode、dark mode 自动选择应用theme
   */
  themeMode: ThemeMode.system,
  theme: ThemeData(
      primaryColor: const Color(kEaesyColor),
      brightness: Brightness.light,
      // 视觉密度 影响所有的button和chip的默认padding
      // visualDensity: const VisualDensity(vertical: 3, horizontal: 3),
      visualDensity: VisualDensity.standard, // VisualDensity.compact, VisualDensity.comfortable

      // fontFamily: 'CourierPrime',

      /// 统一控件默认风格
      /// ios style 在mobile web上会导致swipe back issue
      /// platform: TargetPlatform.android

      /// set an entire text theme to use google font.
      textTheme: GoogleFonts.andikaTextTheme()),
  darkTheme: ThemeData(
      brightness: Brightness.dark,
      // 统一使用iOS style
      platform: TargetPlatform.iOS),
);
