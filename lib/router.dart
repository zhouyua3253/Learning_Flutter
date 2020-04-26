import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/absorb_pointer_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/animated_list_page.dart';
import 'package:flutter_tutorial/pages/animation_demo/main.dart';
import 'package:flutter_tutorial/pages/blur_mask_page.dart';
import 'package:flutter_tutorial/pages/blurhash_page.dart';
import 'package:flutter_tutorial/pages/button_page.dart';
import 'package:flutter_tutorial/pages/cal_widget_size_position.dart';
import 'package:flutter_tutorial/pages/clip_page.dart';
import 'package:flutter_tutorial/pages/column_page.dart';
import 'package:flutter_tutorial/pages/container_page.dart';
import 'package:flutter_tutorial/pages/curved_navigation_bar_page.dart';
import 'package:flutter_tutorial/pages/dialog_page.dart';
import 'package:flutter_tutorial/pages/disable_swipe_back_page.dart';
import 'package:flutter_tutorial/pages/dismissible_page.dart';
import 'package:flutter_tutorial/pages/form_validation_page.dart';
import 'package:flutter_tutorial/pages/future_builder_page.dart';
import 'package:flutter_tutorial/pages/global_notification_page.dart';
import 'package:flutter_tutorial/pages/google_nav_bar_page.dart';
import 'package:flutter_tutorial/pages/gradient_page.dart';
import 'package:flutter_tutorial/pages/gridview_page.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/html_js_page.dart';
import 'package:flutter_tutorial/pages/image_page.dart';
import 'package:flutter_tutorial/pages/line_icon_page.dart';
import 'package:flutter_tutorial/pages/linked_scroll_page.dart';
import 'package:flutter_tutorial/pages/list_wheel_scrollview_page.dart';
import 'package:flutter_tutorial/pages/listview_page.dart';
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
import 'package:flutter_tutorial/pages/swiper_page.dart';
import 'package:flutter_tutorial/pages/system_api_page.dart';
import 'package:flutter_tutorial/pages/text_page.dart';
import 'package:flutter_tutorial/pages/textfield_page.dart';
import 'package:flutter_tutorial/pages/tinder_card_page.dart';
import 'package:flutter_tutorial/pages/transform_page.dart';
import 'package:flutter_tutorial/pages/typography_page.dart';
import 'package:flutter_tutorial/pages/view_model_provider/example_page.dart';
import 'package:flutter_tutorial/pages/waterfall_page.dart';
import 'package:flutter_tutorial/pages/wrap_page.dart';

/**
 * Named Routing
 * https://www.filledstacks.com/post/flutter-navigation-cheatsheet-a-guide-to-named-routing/
 *
 * Web Url Navigation
 * https://medium.com/flutter-community/advance-url-navigation-for-flutter-web-d8b5f2d424e6
 */
Route<dynamic> generateRoute(RouteSettings settings) {
  String name = settings.name;
  Object arguments = settings.arguments;
  print("name $name, arguments $arguments");

  /// settings is must for flutter web project to change the url path
  /// /pass-parameters -> /pass-parameters?name=yumin&id=123
  if (name.startsWith(PassParametersPage1.routeName)) {
    String urlName = (arguments as PassParameters).urlParameters(name);
    settings = RouteSettings(name: urlName, arguments: arguments);

    return MaterialPageRoute(builder: (context) => PassParametersPage1(), settings: settings);
  }

  /// Better way
  if (name.startsWith(PassParametersPage2.routeName)) {
    Map data = arguments as Map;
    return MaterialPageRoute(
        builder: (context) =>
            PassParametersPage2(name: data['name'] as String, age: data['age'] as int),
        settings: settings);
  }

  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
          builder: (context) => HomePage(), settings: settings, maintainState: false);
    case ContainerPage.routeName:
      return MaterialPageRoute(builder: (context) => ContainerPage(), settings: settings);
    case ButtonPage.routeName:
      return MaterialPageRoute(builder: (context) => ButtonPage(), settings: settings);
    case ScaffoldPage.routeName:
      return MaterialPageRoute(builder: (context) => ScaffoldPage(), settings: settings);
    case TransformPage.routeName:
      return MaterialPageRoute(builder: (context) => TransformPage(), settings: settings);
    case StackPage.routeName:
      return MaterialPageRoute(builder: (context) => StackPage(), settings: settings);
    case TextPage.routeName:
      return MaterialPageRoute(builder: (context) => TextPage(), settings: settings);
    case TypographyPage.routeName:
      return MaterialPageRoute(builder: (context) => TypographyPage(), settings: settings);
    case ImagePage.routeName:
      return MaterialPageRoute(builder: (context) => ImagePage(), settings: settings);
    case LineIconPage.routeName:
      return MaterialPageRoute(builder: (context) => LineIconPage(), settings: settings);
    case ColumnPage.routeName:
      return MaterialPageRoute(builder: (context) => ColumnPage(), settings: settings);
    case WrapPage.routeName:
      return MaterialPageRoute(builder: (context) => WrapPage(), settings: settings);
    case TextFieldPage.routeName:
      return MaterialPageRoute(builder: (context) => TextFieldPage(), settings: settings);
    case FormValidationPage.routeName:
      return MaterialPageRoute(builder: (context) => FormValidationPage(), settings: settings);
    case ScrollViewPage.routeName:
      return MaterialPageRoute(builder: (context) => ScrollViewPage(), settings: settings);
    case ListViewPage.routeName:
      return MaterialPageRoute(builder: (context) => ListViewPage(), settings: settings);
    case ScrollablePositionedListPage.routeName:
      return MaterialPageRoute(builder: (_) => ScrollablePositionedListPage(), settings: settings);
    case GridViewPage.routeName:
      return MaterialPageRoute(builder: (context) => GridViewPage(), settings: settings);
    case LinkedScrollPage.routeName:
      return MaterialPageRoute(builder: (context) => LinkedScrollPage(), settings: settings);
    case WaterfallPage.routeName:
      return MaterialPageRoute(builder: (context) => WaterfallPage(), settings: settings);
    case ListWheelScrollViewPage.routeName:
      return MaterialPageRoute(builder: (context) => ListWheelScrollViewPage(), settings: settings);
    case AnimatedListPage.routeName:
      return MaterialPageRoute(builder: (context) => AnimatedListPage(), settings: settings);
    case SliverPage.routeName:
      return MaterialPageRoute(builder: (context) => SliverPage(), settings: settings);
    case OpacityPage.routeName:
      return MaterialPageRoute(builder: (context) => OpacityPage(), settings: settings);
    case GradientPage.routeName:
      return MaterialPageRoute(builder: (context) => GradientPage(), settings: settings);
    case DialogPage.routeName:
      return MaterialPageRoute(builder: (context) => DialogPage(), settings: settings);
    case PickerPage.routeName:
      return MaterialPageRoute(builder: (context) => PickerPage(), settings: settings);
    case AnimationPage.routeName:
      return MaterialPageRoute(builder: (context) => AnimationPage(), settings: settings);
    case SlidingUpPanelPage.routeName:
      return MaterialPageRoute(builder: (context) => SlidingUpPanelPage(), settings: settings);
    case DismissiblePage.routeName:
      return MaterialPageRoute(builder: (context) => DismissiblePage(), settings: settings);
    case SliderPage.routeName:
      return MaterialPageRoute(builder: (context) => SliderPage(), settings: settings);
    case ShaderMaskPage.routeName:
      return MaterialPageRoute(builder: (context) => ShaderMaskPage(), settings: settings);
    case AbsorbPointerPage.routeName:
      return MaterialPageRoute(builder: (context) => AbsorbPointerPage(), settings: settings);
    case ClipPage.routeName:
      return MaterialPageRoute(builder: (context) => ClipPage(), settings: settings);
    case BlurPage.routeName:
      return MaterialPageRoute(builder: (context) => BlurPage(), settings: settings);
    case BlurHashPage.routeName:
      return MaterialPageRoute(builder: (context) => BlurHashPage(), settings: settings);
    case PageViewPage.routeName:
      return MaterialPageRoute(builder: (context) => PageViewPage(), settings: settings);
    case SwiperPage.routeName:
      return MaterialPageRoute(builder: (context) => SwiperPage(), settings: settings);
    case TinderCardPage.routeName:
      return MaterialPageRoute(builder: (context) => TinderCardPage(), settings: settings);
    case CurvedNavigationBarPage.routeName:
      return MaterialPageRoute(builder: (context) => CurvedNavigationBarPage(), settings: settings);
    case GlobalNotificationPage.routeName:
      return MaterialPageRoute(builder: (context) => GlobalNotificationPage(), settings: settings);
    case FutureBuilderPage.routeName:
      return MaterialPageRoute(builder: (context) => FutureBuilderPage(), settings: settings);
    case StreamBuilderPage.routeName:
      return MaterialPageRoute(builder: (context) => StreamBuilderPage(), settings: settings);
    case ProviderFirstPage.routeName:
      return MaterialPageRoute(builder: (context) => ProviderFirstPage(), settings: settings);
    case ExampleViewModelPage.routeName:
      return MaterialPageRoute(builder: (context) => ExampleViewModelPage(), settings: settings);
    case HtmlJsPage.routeName:
      return MaterialPageRoute(builder: (context) => HtmlJsPage(), settings: settings);
    case NetworkPage.routeName:
      return MaterialPageRoute(builder: (context) => NetworkPage(), settings: settings);
    case SystemApiPage.routeName:
      return MaterialPageRoute(builder: (context) => SystemApiPage(), settings: settings);
    case CalWidgetSizePositionPage.routeName:
      return MaterialPageRoute(builder: (_) => CalWidgetSizePositionPage(), settings: settings);
    case DisableSwipeBackPage.routeName:
      return MaterialPageRoute(builder: (context) => DisableSwipeBackPage(), settings: settings);
    case GoogleNavBarPage.routeName:
      return MaterialPageRoute(builder: (context) => GoogleNavBarPage(), settings: settings);
    // Avoid 404
    default:
      return MaterialPageRoute(builder: (context) => HomePage(), settings: settings);
  }
}
