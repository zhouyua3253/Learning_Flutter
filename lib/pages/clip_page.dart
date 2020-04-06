import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  static String routeName = 'Clip';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://static.cnbetacdn.com/thumb/mini/article/2020/0205/b978d5b15b72a3c.jpg',
                  width: 60,
                  height: 60,
                ),
                Text('CircleAvatar: 剪裁backgroundColor或\nbackgroundImage为圆形'),
                Center(
                  child: CircleAvatar(
                    // child: FlutterLogo(size: 100),

                    /// 设置child为要显示的Widget时，并不能显示为圆形，只有设置backgroundColor或者backgroundImage时才显示为了圆形
                    backgroundImage: NetworkImage(
                      'https://static.cnbetacdn.com/thumb/mini/article/2020/0205/b978d5b15b72a3c.jpg',
                    ),
                    radius: 30,
                  ),
                ),
                Divider(),
                Text('ClipOval: 子组件为正方形时剪裁为内贴圆形\n为矩形时，剪裁为内贴椭圆'),
                ClipOval(
                  child: Image.asset(
                    'images/1.jpg',
                    width: 100,
                  ),
                ),
                Divider(),
                Text('ClipRRect: 将子组件剪裁为圆角矩形'),
                ClipRRect(
                  child: Image.asset(
                    'images/2.jpg',
                    width: 100,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                Divider(),
                Text('Container -> borderRadius 无法剪裁child控件'),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red),
                  child: Image.asset(
                    'images/3.jpg',
                    width: 100,
                  ),
                ),
                Divider(),
                Text('ClipPath: 自定义剪切'),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[200],
                    ),
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                          width: 200, height: 200, color: Colors.deepOrange),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    /// https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0
    Path path = Path();
    path.lineTo(width, 0.0);
    path.quadraticBezierTo(width, height, width / 2, height);
    path.cubicTo(0, height, width * 0.75, height * 0.25, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
