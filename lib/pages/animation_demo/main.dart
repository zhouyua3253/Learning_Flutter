import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/pages/animation_demo/animated_cross_fade_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/int_tween_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/route_transition_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/simple_animation_controlled_animation_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/simple_animation_controllerx_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/simple_animation_multi_track_tween_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/tween_page.dart';

import '../../router.dart';
import 'animated_icon_page.dart';
import 'animated_switcher_page.dart';
import 'color_tween_page.dart';
import 'hero_page.dart';
import 'motion_animations.dart';
import 'tween_animation_builder_page.dart';

class AnimationPage extends StatefulWidget {
  static const String routeName = '/animation';

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with RouteAware {
  final List<String> _types = [
    'Tween+AnimatedBuilder',
    'ColorTween+AnimatedBuilder',
    'IntTween+AnimatedBuilder',
    'AnimatedIcon',
    'AnimatedSwitcher 切换控件',
    'AnimatedCrossFade 淡入切换显示控件',
    'TweenAnimationBuilder 一次性动画',
    'MotionAnimations',
    SimpleAnimationMultiTrackTweenPage.routeName,
    SimpleAnimationControllerXPage.routeName,
    SimpleAnimationControlledAnimationPage.routeName,
  ];

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    /// Called when the current route has been popped off.
    print('didPop');

    super.didPop();
  }

  @override
  void didPush() {
    /// Called when the current route has been pushed.
    print('didPush');

    super.didPush();
  }

  @override
  void didPopNext() {
    /// Called when the top route has been popped off, and the current route shows up.
    /// 路由返回到当前页面 可以弥补手势返回不触发
    print('didPopNext');

    super.didPopNext();
  }

  @override
  void didPushNext() {
    /// Called when a new route has been pushed, and the current route is no longer visible.
    print('didPushNext');

    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(children: [
          ..._types.map((type) => Button(
                child: Text(
                  type,
                  textScaleFactor: 1.2,
                ),
                padding: EdgeInsets.all(10),
                onPressed: () {
                  _pushPage(context, type);
                },
              )),
          Hero(
              tag: HeroPage.heroTag,
              child: Column(
                children: <Widget>[
                  Text(
                    'Hero',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  ClipOval(
                    child: Button(
                        child: Image.asset(
                          'images/6.jpg',
                          width: 100,
                        ),
                        onPressed: () {
                          _pushHeroPage(context);
                        }),
                  ),
                ],
              )),
          RaisedButton(
            child: Text(RouteTransitionPage.routeName),
            onPressed: () => _pushPage(context, RouteTransitionPage.routeName),
          )
        ]),
      ),
    );
  }

  void _pushPage(BuildContext context, String tag) {
    switch (tag) {
      case 'Tween+AnimatedBuilder':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => TweenPage()));
        break;
      case 'ColorTween+AnimatedBuilder':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => ColorTweenPage()));
        break;
      case 'IntTween+AnimatedBuilder':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => IntTweenPage()));
        break;

      case 'AnimatedIcon':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => AnimatedIconPage()));
        break;

      case 'AnimatedCrossFade 淡入切换显示控件':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => AnimatedCrossFadePage()));
        break;

      case 'AnimatedSwitcher 切换控件':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => AnimatedSwitcherPage()));
        break;

      case 'TweenAnimationBuilder 一次性动画':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => TweenAnimationBuilderPage()));
        break;

      case "SimpleAnimationMultiTrackTweenPage":
        Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(
            builder: (BuildContext context) => SimpleAnimationMultiTrackTweenPage()));
        break;

      case 'SimpleAnimationControllerX':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => SimpleAnimationControllerXPage()));
        break;

      case 'SimpleAnimationControlledAnimation':
        Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(
            builder: (BuildContext context) => SimpleAnimationControlledAnimationPage()));
        break;

      case 'RouteTransition':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => RouteTransitionPage()));
        break;

      case 'MotionAnimations':
        Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(builder: (BuildContext context) => MotionAnimationsPage()));
        break;
    }
  }

  void _pushHeroPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<MaterialPageRoute>(builder: (BuildContext context) => HeroPage()));
  }
}
