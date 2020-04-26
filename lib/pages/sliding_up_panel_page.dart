import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/// https://pub.dev/packages/sliding_up_panel
class SlidingUpPanelPage extends StatefulWidget {
  static const String routeName = '/sliding-up-panel';

  @override
  _SlidingUpPanelPageState createState() => _SlidingUpPanelPageState();
}

class _SlidingUpPanelPageState extends State<SlidingUpPanelPage> {
  double _panelPosition = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double panelMaxHeight = screenHeight * 0.7;
    double panelMinHeight = 90;
    double bodyHeight =
        screenHeight - panelMinHeight - (panelMaxHeight - panelMinHeight) * _panelPosition;
    double textScale = (2 - _panelPosition) * 0.5 + 1;

    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        maxHeight: panelMaxHeight,
        minHeight: panelMinHeight,
        borderRadius: BorderRadius.circular(20),
        slideDirection: SlideDirection.UP,
        panel: Column(
          children: <Widget>[
            Container(
              width: 30,
              height: 4,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
                  BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(2)),
            ),
            Text(
              "This is the sliding Widget",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, i) => Center(child: Text('index -> ${i + 1}'))),
            )
          ],
        ),

        /// This Widget automatically sizes itself to fill the screen.
        body: Container(
          alignment: Alignment.topCenter,
          color: Colors.grey[200],
          child: Container(
            height: bodyHeight,
            alignment: Alignment.center,
            child: Text('This is the Widget\nbehind the panel', textScaleFactor: textScale),
          ),
        ),
        onPanelSlide: (position) {
          print('sliding to $position');
          if (position != _panelPosition) {
            setState(() {
              _panelPosition = position;
            });
          }
        },
      ),
    );
  }
}
