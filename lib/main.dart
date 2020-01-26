import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/animation_demo/main.dart';
import 'package:flutter_tutorial/pages/column_page.dart';
import 'package:flutter_tutorial/pages/container_page.dart';
import 'package:flutter_tutorial/pages/dialog_page.dart';
import 'package:flutter_tutorial/pages/form_validation_page.dart';
import 'package:flutter_tutorial/pages/gradient_page.dart';
import 'package:flutter_tutorial/pages/gridview_page.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/image_page.dart';
import 'package:flutter_tutorial/pages/inkwell_pae.dart';
import 'package:flutter_tutorial/pages/listview_page.dart';
import 'package:flutter_tutorial/pages/network_page.dart';
import 'package:flutter_tutorial/pages/opacity_page.dart';
import 'package:flutter_tutorial/pages/picker_page.dart';
import 'package:flutter_tutorial/pages/scrollview_page.dart';
import 'package:flutter_tutorial/pages/sliver_page.dart';
import 'package:flutter_tutorial/pages/stack_page.dart';
import 'package:flutter_tutorial/pages/text_page.dart';
import 'package:flutter_tutorial/pages/textfield_page.dart';
import 'package:flutter_tutorial/pages/waterfall_page.dart';
import 'package:flutter_tutorial/pages/wrap_page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => HomePage(),
        '/Container': (context) => ContainerPage(),
        '/Stack': (context) => StackPage(),
        '/Text': (context) => TextPage(),
        '/Image': (context) => ImagePage(),
        '/Column': (context) => ColumnPage(),
        '/Wrap': (context) => WrapPage(),
        '/TextField': (context) => TextFieldPage(),
        '/TextFormField': (context) => FormValidationPage(),
        '/ScrollView': (context) => ScrollViewPage(),
        '/ListView': (context) => ListViewPage(),
        '/GridView': (context) => GridViewPage(),
        '/Waterfall': (context) => WaterfallPage(),
        '/Sliver': (context) => SliverPage(),
        '/Opacity': (context) => OpacityPage(),
        '/Gradient': (context) => GradientPage(),
        '/Dialog': (context) => DialogPage(),
        '/Picker': (context) => PickerPage(),
        '/Animation': (context) => AnimationPage(),
        '/水波纹': (context) => InkWellPage(),
        '/Dio_Network': (context) => NetworkPage(),
      },
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
              minWidth: 0,
              height: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)
      ),
    ));
