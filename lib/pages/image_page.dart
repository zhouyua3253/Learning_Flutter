import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  static const String routeName = '/image';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMAGE'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Image.network'),
            Tooltip(
              message: '这是网络加载图',
              child: Image.network(
                'https://images.unsplash.com/photo-1558981000-f294a6ed32b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
                loadingBuilder: _imageLoadingBuilder,
                width: 200,
              ),
            ),
            Text('FadeInImage.assetNetwork'),
            FadeInImage.assetNetwork(
              height: 200,
              placeholder: 'images/1.jpg',
              image: 'https://static.cnbetacdn.com/thumb/article/2020/0106/5879a79d6dc88b6.jpg',
              fadeInDuration: Duration(seconds: 1),
            ),
            Divider(),
            Text('Image centerSlice 拉伸图片指定区域'),
            Image.asset('images/dialog_bg.png',
                width: double.infinity, height: 150, fit: BoxFit.fill),
            Image.asset(
              'images/dialog_bg.png',
              width: double.infinity,
              height: 110,
              centerSlice: const Rect.fromLTWH(50, 30, 1, 1),
            ),
            Text('DecorationImage centerSlice 拉伸背景图片指定区域'),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/dialog_bg.png'),
                centerSlice: const Rect.fromLTWH(50, 30, 1, 1),
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 45),
                child: Text(
                    'centerSlice 拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域拉伸图片指定区域'),
              ),
            ),
            Divider(),
            Text('Image.asset'),
            Text('color + colorBlendMode 改变颜色基调'),
            Image.asset('images/3.jpg',
                width: 200,
                color: Colors.orangeAccent,
                colorBlendMode: BlendMode.overlay // overlay darken softLight
                ),
            Image.asset('images/3.jpg',
                width: 200,
                color: Colors.orangeAccent,
                colorBlendMode: BlendMode.darken // overlay darken softLight
                ),
            Image.asset('images/3.jpg',
                width: 200,
                color: Colors.orangeAccent,
                colorBlendMode: BlendMode.softLight // overlay darken softLight
                ),
            Divider(),
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
