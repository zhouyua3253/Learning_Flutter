import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'navigation_rail_view_model.dart';

class NavigationRailPage extends StatelessWidget {
  static const routeName = '/navigation-rail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NavigationRail'),
        ),
        body: ViewModelProvider<NavigationRailViewModel>.withConsumer(
            viewModel: NavigationRailViewModel(),
            builder: (context, model, child) {
              final NavigationRail navigationRail = NavigationRail(
                extended: model.isExtended,
                labelType:
                    model.isExtended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
                selectedIndex: model.selectedIndex,
                minExtendedWidth: 250,
                onDestinationSelected: model.updateSelectedIndex,
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: const Text('Avatar').textColor(Colors.white),
                  radius: 30,
                ),
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Icons.add_alert),
                      selectedIcon: Icon(Icons.alarm_add),
                      label: const Text('alert')),
                  NavigationRailDestination(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(Icons.hot_tub),
                      label: const Text('home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.monetization_on),
                      selectedIcon: Icon(Icons.attach_money),
                      label: const Text('money')),
                  NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      selectedIcon: Icon(Icons.settings_applications),
                      label: const Text('settings'))
                ],
                backgroundColor: Colors.blueGrey,
                selectedIconTheme: IconThemeData(color: Colors.yellow),
                selectedLabelTextStyle: TextStyle(color: Colors.yellow),
              );

              return [
                navigationRail,
                Text('selectedIndex ${model.selectedIndex}')
                    .center()
                    .backgroundColor(Colors.white)
                    .gestures(onTap: model.updateExtendedState)
                    .expanded()
              ].toRow();
            }));
  }
}
