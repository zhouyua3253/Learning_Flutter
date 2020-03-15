import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/animation_demo/main.dart';
import 'package:flutter_tutorial/pages/blur_mask_page.dart';
import 'package:flutter_tutorial/pages/blurhash_page.dart';
import 'package:flutter_tutorial/pages/clip_page.dart';
import 'package:flutter_tutorial/pages/column_page.dart';
import 'package:flutter_tutorial/pages/container_page.dart';
import 'package:flutter_tutorial/pages/curved_navigation_bar_page.dart';
import 'package:flutter_tutorial/pages/dialog_page.dart';
import 'package:flutter_tutorial/pages/form_validation_page.dart';
import 'package:flutter_tutorial/pages/future_builder_page.dart';
import 'package:flutter_tutorial/pages/global_notification_page.dart';
import 'package:flutter_tutorial/pages/google_nav_bar_page.dart';
import 'package:flutter_tutorial/pages/gradient_page.dart';
import 'package:flutter_tutorial/pages/gridview_page.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/image_page.dart';
import 'package:flutter_tutorial/pages/inkwell_pae.dart';
import 'package:flutter_tutorial/pages/line_icon_page.dart';
import 'package:flutter_tutorial/pages/linked_scroll_page.dart';
import 'package:flutter_tutorial/pages/list_wheel_scrollview_page.dart';
import 'package:flutter_tutorial/pages/listview_page.dart';
import 'package:flutter_tutorial/pages/network_page.dart';
import 'package:flutter_tutorial/pages/opacity_page.dart';
import 'package:flutter_tutorial/pages/pageview_page.dart';
import 'package:flutter_tutorial/pages/picker_page.dart';
import 'package:flutter_tutorial/pages/positioned_list_page.dart';
import 'package:flutter_tutorial/pages/provider_page.dart';
import 'package:flutter_tutorial/pages/scaffold_page.dart';
import 'package:flutter_tutorial/pages/scrollview_page.dart';
import 'package:flutter_tutorial/pages/shader_mask_page.dart';
import 'package:flutter_tutorial/pages/sliver_page.dart';
import 'package:flutter_tutorial/pages/stack_page.dart';
import 'package:flutter_tutorial/pages/stream_builder_page.dart';
import 'package:flutter_tutorial/pages/swiper_page.dart';
import 'package:flutter_tutorial/pages/system_api_page.dart';
import 'package:flutter_tutorial/pages/text_page.dart';
import 'package:flutter_tutorial/pages/textfield_page.dart';
import 'package:flutter_tutorial/pages/tinder_card_page.dart';
import 'package:flutter_tutorial/pages/transform_page.dart';
import 'package:flutter_tutorial/pages/waterfall_page.dart';
import 'package:flutter_tutorial/pages/wrap_page.dart';
import 'package:flutter_tutorial/stores/counter_store.dart';
import 'package:flutter_tutorial/stores/user_store.dart';
import 'pages/absorb_pointer_page.dart';
import 'pages/animation_demo/animated_list_page.dart';
import 'pages/button_page.dart';
import 'pages/dismissible_page.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider providerWrapApp = MultiProvider(
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
  title: 'Flutter 学习',
  initialRoute: '/Home',
  routes: {
    '/Home': (context) => HomePage(),
    '/Container': (context) => ContainerPage(),
    '/${ButtonPage.routeName}': (context) => ButtonPage(),
    '/${ScaffoldPage.routeName}': (context) => ScaffoldPage(),
    '/${TransformPage.routeName}': (context) => TransformPage(),
    '/Stack': (context) => StackPage(),
    '/Text': (context) => TextPage(),
    '/Image': (context) => ImagePage(),
    '/${LineIconPage.routeName}': (context) => LineIconPage(),
    '/Column': (context) => ColumnPage(),
    '/Wrap': (context) => WrapPage(),
    '/TextField': (context) => TextFieldPage(),
    '/TextFormField': (context) => FormValidationPage(),
    '/ScrollView': (context) => ScrollViewPage(),
    '/ListView': (context) => ListViewPage(),
    '/${ScrollablePositionedListPage.routeName}': (context) => ScrollablePositionedListPage(),
    '/GridView': (context) => GridViewPage(),
    '/${LinkedScrollPage.routeName}': (context) => LinkedScrollPage(),
    '/Waterfall': (context) => WaterfallPage(),
    '/${ListWheelScrollViewPage.routeName}': (context) =>
        ListWheelScrollViewPage(),
    '/Sliver': (context) => SliverPage(),
    '/${AnimatedListPage.routeName}': (context) => AnimatedListPage(),
    '/Opacity': (context) => OpacityPage(),
    '/Gradient': (context) => GradientPage(),
    '/Dialog': (context) => DialogPage(),
    '/Picker': (context) => PickerPage(),
    '/${GoogleNavBarPage.routeName}': (_) => GoogleNavBarPage(),
    '/Animation': (context) => AnimationPage(),
    '/${DismissiblePage.routeName}': (context) => DismissiblePage(),
    '/水波纹': (context) => InkWellPage(),
    '/${ShaderMaskPage.routeName}': (context) => ShaderMaskPage(),
    "/${AbsorbPointerPage.routeName}": (context) => AbsorbPointerPage(),
    "/${ClipPage.routeName}": (context) => ClipPage(),
    "/${BlurPage.routeName}": (context) => BlurPage(),
    "/${BlurHashPage.routeName}": (context) => BlurHashPage(),
    "/${PageViewPage.routeName}": (context) => PageViewPage(),
    "/${SwiperPage.routeName}": (context) => SwiperPage(),
    "/${TinderCardPage.routeName}": (context) => TinderCardPage(),
    "/${CurvedNavigationBarPage.routeName}": (context) =>
        CurvedNavigationBarPage(),
    "/${GlobalNotificationPage.routeName}": (context) =>
        GlobalNotificationPage(),
    "/${FutureBuilderPage.routeName}": (context) => FutureBuilderPage(),
    "/${StreamBuilderPage.routeName}": (context) => StreamBuilderPage(),
    "/${NetworkPage.routeName}": (context) => NetworkPage(),
    "/${ProviderFirstPage.routeName}": (context) => ProviderFirstPage(),
    "/${SystemApiPage.routeName}": (context) => SystemApiPage(),
  },
  theme: ThemeData(
    // fontFamily: 'CourierPrime',
    // 统一使用iOS style
    platform: TargetPlatform.iOS,
    /**
     * Customized in customWidget/button.dart, instead of the global themeData
        buttonTheme: ButtonThemeData(
        minWidth: 0,
        height: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)
     */
  ),
);
