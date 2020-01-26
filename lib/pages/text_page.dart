import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEXT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BOLD',
              style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'BOLD & ITALIC',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'LETTER SPACING 字母间距',
              style: TextStyle(letterSpacing: 5, fontStyle: FontStyle.italic),
            ),
            Text(
              'WORD SPACING 单词间距',
              style: TextStyle(wordSpacing: 10, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'TEXT ALIGN: RIGHT',
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'TEXT ALIGN: CENTER',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'SOFT WRAP: TRUE 消息称马斯克将出席特斯拉上海工厂Model 3交付仪式',
              softWrap: true,
            ),
            Text(
              'SOFT WRAP: FALSE 消息称马斯克将出席特斯拉上海工厂Model 3交付仪式',
              softWrap: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "MAXLINES: 3 + OVERFLOW: ellipsis. Thanks for attending Flutter Interact 2019—you can still watch the session recordings!Flutter 1.12 is live! Check out the latest announcement and see what's new on the site.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Text('UNDERLINE',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                )),
            Text('UNDERLINE: dotted',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dotted)),
            Text('UNDERLINE: wavy',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationColor: Colors.redAccent)),
            Text('LINE THROUGH',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Custom font FLUTTER tuturial',
              style: TextStyle(fontFamily: 'CourierPrime'),
            ),
            Text(
              'Custom font FLUTTER tuturial',
              style: TextStyle(fontFamily: 'CourierPrime', fontStyle: FontStyle.italic),
            ),
            Text(
              'Custom font FLUTTER tuturial',
              style: TextStyle(
                  fontFamily: 'CourierPrime',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  // Default style for the rich text
                  style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'CourierPrime'),
                  text: 'RichText: Thanks for attending ',
                  children: [
                    TextSpan(
                        text: 'Flutter Interact 2019',
                        style: TextStyle(
                            color: Colors.blue[800],
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic)),
                    TextSpan(text: ' — you can still watch the video.'),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
