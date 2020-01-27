import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// https://github.com/best-flutter/flutter_swiper/blob/master/README-ZH.md
class SwiperPage extends StatelessWidget {
  static String routeName = 'Swiper';

  final List<String> _imgUrls = [
    'https://static.cnbetacdn.com/frontend/202001/dd57fac41703f0d_292x177.jpg',
    'https://static.cnbetacdn.com/frontend/202001/d346445f7ead218_292x177.jpg',
    'https://static.cnbetacdn.com/frontend/202001/618754ccf37b050_292x177.jpg',
    'https://static.cnbetacdn.com/frontend/202001/9e961ac0c954dcb_292x177.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) => Image.network(
                _imgUrls[index],
                fit: BoxFit.cover,
              ),
              itemCount: _imgUrls.length,
              autoplay: true,
              onTap: _onTap,
              pagination: SwiperPagination(builder: SwiperPagination.dots),
              indicatorLayout: PageIndicatorLayout.SCALE,
              duration: 1000,
              control: SwiperControl(color: Colors.pink, size: 24),
            ),
          ),
          Divider(),
          Container(
            width: double.infinity,
            height: 250,
            child: Swiper(
                itemBuilder: (BuildContext context, int index) => Image.network(
                      _imgUrls[index],
                      fit: BoxFit.cover,
                    ),
                itemCount: _imgUrls.length,
                loop: false,
                // 主窗口的占比
                viewportFraction: 0.8,
                // 非主窗口的children的缩放系数
                scale: 0.8,
                // 非主窗口的children的透明度
                fade: 0.6,
                onTap: _onTap,
                physics: BouncingScrollPhysics()),
          ),
          Divider(),
          Container(
            width: double.infinity,
            height: 250,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  _imgUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
              itemCount: _imgUrls.length,
              itemWidth: MediaQuery.of(context).size.width - 100,
              layout: SwiperLayout.STACK,
            ),
          ),
	        Divider(),
	        Container(
		        width: double.infinity,
		        height: 250,
		        child: Swiper(
			        itemBuilder: (BuildContext context, int index) => ClipRRect(
				        borderRadius: BorderRadius.circular(20),
				        child: Image.network(
					        _imgUrls[index],
					        fit: BoxFit.cover,
				        ),
			        ),
			        itemCount: _imgUrls.length,
			        itemWidth: MediaQuery.of(context).size.width - 40,
			        itemHeight: 240,
			        layout: SwiperLayout.TINDER,
		        ),
	        ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    print('Clicked the $index-image.');
  }
}
