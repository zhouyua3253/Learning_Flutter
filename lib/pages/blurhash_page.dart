import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class BlurHashPage extends StatelessWidget {
  static String routeName = 'BlurHash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlurHash'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
                'Blurhash: gQJsI7^iIW=^tPNIIq~Ct7niR+WVoKo00:R+t3IqnPt5t6E8NHovjZWCj[kBX8I;V[xZbHjZWC'),
            AspectRatio(
              aspectRatio: 69 / 50,

              /// https://github.com/Solido/Flutter-BlurHash

              /// https://blurha.sh Create blur hash from a image
              /// The more components you pick, the more information is retained in the placeholder
              child: BlurHash(
                hash:
                    'gQJsI7^iIW=^tPNIIq~Ct7niR+WVoKo00:R+t3IqnPt5t6E8NHovjZWCj[kBX8I;V[xZbHjZWC',
              ),
            ),
            Divider(),
            Text('Original image'),
            Image.asset('images/6.jpg')
          ],
        ),
      ),
    );
  }
}
