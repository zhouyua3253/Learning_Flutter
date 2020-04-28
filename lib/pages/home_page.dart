import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/animation_demo/main.dart';
import 'package:flutter_tutorial/pages/blurhash_page.dart';
import 'package:flutter_tutorial/pages/button_page.dart';
import 'package:flutter_tutorial/pages/column_page.dart';
import 'package:flutter_tutorial/pages/container_page.dart';
import 'package:flutter_tutorial/pages/dialog_page.dart';
import 'package:flutter_tutorial/pages/form_validation_page.dart';
import 'package:flutter_tutorial/pages/future_builder_page.dart';
import 'package:flutter_tutorial/pages/global_notification_page.dart';
import 'package:flutter_tutorial/pages/gradient_page.dart';
import 'package:flutter_tutorial/pages/html_js_page.dart';
import 'package:flutter_tutorial/pages/image_page.dart';
import 'package:flutter_tutorial/pages/line_icon_page.dart';
import 'package:flutter_tutorial/pages/list_wheel_scrollview_page.dart';
import 'package:flutter_tutorial/pages/network_page.dart';
import 'package:flutter_tutorial/pages/opacity_page.dart';
import 'package:flutter_tutorial/pages/pageview_page.dart';
import 'package:flutter_tutorial/pages/pass_parameters_page.dart';
import 'package:flutter_tutorial/pages/picker_page.dart';
import 'package:flutter_tutorial/pages/positioned_list_page.dart';
import 'package:flutter_tutorial/pages/provider_page.dart';
import 'package:flutter_tutorial/pages/scaffold_page.dart';
import 'package:flutter_tutorial/pages/scrollview_page.dart';
import 'package:flutter_tutorial/pages/shader_mask_page.dart';
import 'package:flutter_tutorial/pages/slider_page/slider_page.dart';
import 'package:flutter_tutorial/pages/sliding_up_panel_page.dart';
import 'package:flutter_tutorial/pages/sliver_page.dart';
import 'package:flutter_tutorial/pages/stack_page.dart';
import 'package:flutter_tutorial/pages/stream_builder_page.dart';
import 'package:flutter_tutorial/pages/styled_widget_page.dart';
import 'package:flutter_tutorial/pages/swiper_page.dart';
import 'package:flutter_tutorial/pages/system_api_page.dart';
import 'package:flutter_tutorial/pages/text_page.dart';
import 'package:flutter_tutorial/pages/textfield_page.dart';
import 'package:flutter_tutorial/pages/tinder_card_page.dart';
import 'package:flutter_tutorial/pages/transform_page.dart';
import 'package:flutter_tutorial/pages/blur_mask_page.dart';
import 'package:flutter_tutorial/pages/clip_page.dart';
import 'package:flutter_tutorial/pages/typography_page.dart';
import 'package:flutter_tutorial/pages/view_model_provider/example_page.dart';
import 'package:flutter_tutorial/pages/waterfall_page.dart';
import 'package:flutter_tutorial/pages/wrap_page.dart';
import 'absorb_pointer_page.dart';
import 'animated_text_page.dart';
import 'animation_demo/animated_list_page.dart';
import 'cal_widget_size_position.dart';
import 'curved_navigation_bar_page.dart';
import 'disable_swipe_back_page.dart';
import 'dismissible_page.dart';
import 'google_nav_bar_page.dart';
import 'gridview_page.dart';
import 'linked_scroll_page.dart';
import 'listview_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  final List<String> _items = [
    PassParametersPage1.routeName,
    PassParametersPage2.routeName,
    '/pass-parameters-3',
    StyledWidgetPage.routeName,
    ContainerPage.routeName,
    ButtonPage.routeName,
    ScaffoldPage.routeName,
    TransformPage.routeName,
    StackPage.routeName,
    TextPage.routeName,
    TypographyPage.routeName,
    AnimatedTextKitPage.routeName,
    ImagePage.routeName,
    LineIconPage.routeName,
    ColumnPage.routeName,
    WrapPage.routeName,
    TextFieldPage.routeName,
    FormValidationPage.routeName,
    ScrollViewPage.routeName,
    ListViewPage.routeName,
    ScrollablePositionedListPage.routeName,
    GridViewPage.routeName,
    LinkedScrollPage.routeName,
    WaterfallPage.routeName,
    ListWheelScrollViewPage.routeName,
    AnimatedListPage.routeName,
    SliverPage.routeName,
    OpacityPage.routeName,
    GradientPage.routeName,
    DialogPage.routeName,
    PickerPage.routeName,
    GoogleNavBarPage.routeName,
    AnimationPage.routeName,
    SlidingUpPanelPage.routeName,
    DismissiblePage.routeName,
    SliderPage.routeName,
    ShaderMaskPage.routeName,
    AbsorbPointerPage.routeName,
    ClipPage.routeName,
    BlurPage.routeName,
    BlurHashPage.routeName,
    PageViewPage.routeName,
    SwiperPage.routeName,
    TinderCardPage.routeName,
    CurvedNavigationBarPage.routeName,
    GlobalNotificationPage.routeName,
    FutureBuilderPage.routeName,
    StreamBuilderPage.routeName,
    ProviderFirstPage.routeName,
    ExampleViewModelPage.routeName,
    HtmlJsPage.routeName,
    NetworkPage.routeName,
    SystemApiPage.routeName,
    CalWidgetSizePositionPage.routeName,
    DisableSwipeBackPage.routeName
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEMO"),
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.shortestSide,
          padding: EdgeInsets.all(5),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 2,
            children: _items.map((e) => _renderItem(context, e)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, String item) {
    String routeName = item;
    if (routeName.startsWith('/')) {
      routeName = item.substring(1);
    }

    return FlatButton(
      padding: EdgeInsets.zero,
      child: Text(
        routeName,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        _onClickButton(context, item);
      },
    );
  }

  void _onClickButton(BuildContext context, String routeName) {
    /**
     * Pass parameters
     */
    if (routeName == PassParametersPage1.routeName) {
      PassParameters arguments = PassParameters(name: "yumin", id: 123);
      Navigator.pushNamed(context, routeName, arguments: arguments);
    } else if (routeName == PassParametersPage2.routeName) {
      Navigator.pushNamed(context, routeName, arguments: {"name": "pass-parameters-2", "age": 30});
    } else if (routeName == '/pass-parameters-3') {
      final route = MaterialPageRoute(
          builder: (_) =>
              PassParametersPage2(
                name: "pass-parameters-3",
                age: 31,
              ),
          settings: RouteSettings(name: '/pass-parameters-3'));

      /// Directly push a new screen
      Navigator.of(context).push(route);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }
}
