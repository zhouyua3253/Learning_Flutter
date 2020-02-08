import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMAGE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Image.network'),
            Image.network(
                'https://images.unsplash.com/photo-1558981000-f294a6ed32b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
                loadingBuilder: _imageLoadingBuilder,
                width: 300),
            Divider(),
            Text('Image.asset'),
            Text('color + colorBlendMode 改变颜色基调'),
            Image.asset(
              'images/3.jpg',
              width: 200,
              color: Colors.orangeAccent,
              colorBlendMode: BlendMode.softLight// overlay darken softLight
            ),
            Divider(),
            Image.asset(
                'images/3.jpg',
                width: 200,
                color: Colors.orangeAccent,
                colorBlendMode: BlendMode.softLight// overlay darken softLight
            ),
            Divider(),
            Text('FadeInImage.assetNetwork'),
            FadeInImage.assetNetwork(
              height: 200,
              placeholder: 'images/1.jpg',
              image: 'https://static.cnbetacdn.com/thumb/article/2020/0106/5879a79d6dc88b6.jpg',
              fadeInDuration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageLoadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent loadingProgress,
  ) {
    print("child: $child, loadingProgress: $loadingProgress");
    print("loadingProgress $loadingProgress");

    return loadingProgress == null ? child : CupertinoActivityIndicator();
  }
}
