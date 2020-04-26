import 'package:flutter/material.dart';

/// https://flutter.github.io/gallery/#/demo/typography
class TypographyPage extends StatelessWidget {
  static const String routeName = '/typography';

  @override
  Widget build(BuildContext context) {
    /// 2018 NAME   SIZE   WEIGHT   SPACING
    /// headline1   112.0  thin     0.0
    /// headline2   56.0   normal   0.0
    /// headline3   45.0   normal   0.0
    /// headline4   34.0   normal   0.0
    /// headline5   24.0   normal   0.0
    /// headline6   20.0   medium   0.0
    /// subtitle1   16.0   normal   0.0
    /// subtitle2   14.0   medium   0.0
    /// bodyText1   14.0   medium   0.0
    /// bodyText2   14.0   normal   0.0
    /// caption     12.0   normal   0.0
    /// button      14.0   medium   0.0
    /// overline    10.0   normal   0.0
    /// Where "thin" is `FontWeight.w100`, "normal" is `FontWeight.w400` and "medium" is `FontWeight.w500`
    TextTheme textTheme = Theme.of(context).textTheme;
    final List<TextStyle> styles = [
      textTheme.headline1,
      textTheme.headline2,
      textTheme.headline3,
      textTheme.headline4,
      textTheme.headline5,
      textTheme.headline6,
      textTheme.subtitle1,
      textTheme.subtitle2,
      textTheme.bodyText1,
      textTheme.bodyText2,
      textTheme.button,
      textTheme.caption,
      textTheme.overline
    ];
    final List<String> names = [
      'headline1',
      'headline2',
      'headline3',
      'headline4',
      'headline5',
      'headline6',
      'subtitle1',
      'subtitle2',
      'bodyText1',
      'bodyText2',
      'button',
      'caption',
      'overline'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Typography'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: styles.length,
            itemBuilder: (_, index) {
              return Container(
                child: Text(
                  '${names[index]}',
                  maxLines: 1,
                  style: styles[index],
                ),
                padding: const EdgeInsets.all(16),
              );
            }),
      ),
    );
  }
}
