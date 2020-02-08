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
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text('CircleAvatar: 剪裁backgroundColor或\nbackgroundImage为圆形'),
            Center(
              child: CircleAvatar(
                child: Icon(Icons.four_k),

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
                width: 200,
              ),
            ),
            Divider(),
            Text('ClipRRect: 将子组件剪裁为圆角矩形'),
            ClipRRect(
              child: Image.asset(
                'images/2.jpg',
                width: 200,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            Divider(),
            Text('Container -> borderRadius 无法剪裁child控件'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red
              ),
              child: Image.asset(
                'images/3.jpg',
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
