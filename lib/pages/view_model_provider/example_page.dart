import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/view_model_provider/example_view_model.dart';
import 'package:flutter_tutorial/stores/counter_store.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

/**
 * View Model Provider Architecture
 * https://pub.dev/packages/provider_architecture
 *
 * https://medium.com/flutter-community/a-beginners-guide-to-architecting-a-flutter-app-1e9053211a74
 */
class ExampleViewModelPage extends StatelessWidget {
  static const String routeName = '/provider-view-model';

  @override
  Widget build(BuildContext context) {
    /*
    ViewModelProvider<ExampleViewModel>.withConsumer(
        viewModel: ExampleViewModel(),
        onModelReady: (model) => model.fetchData(),
        staticChild: Text('我是staticChild'),
        builder: (context, model, child) {
          print('局部.builder');
          return Scaffold(
            appBar: AppBar(
              title: Text(routeName),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    child,
                    ...model.data.map((e) => Text('item $e')),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: model.random,
                    )
                  ],
                ),
              ),
            ),
          );
        });
    */
    print('整个页面.build');

    return Scaffold(
        appBar: AppBar(
          title: Text(routeName),
        ),
        body: ViewModelProvider<ExampleViewModel>.withConsumer(
            viewModel: ExampleViewModel(),
            staticChild: Text('View Model Provider'),
            builder: (context, model, child) {
              print('局部.builder');
              return Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    child,
                    ...model.data.map((e) => Text('item $e')),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: model.random,
                    ),
                    Text('Global Provider'),
                    Consumer<CounterStore>(
                      builder: (context, model, child) {
                        print('Consumer.builder');
                        return Text("CounterStore -> ${model.count}");
                      },
                    ),
                    RaisedButton(
                      child: Text('add'),
                      onPressed: () {
                        Provider.of<CounterStore>(context, listen: false).square();
                      },
                    )
                  ],
                ),
              ));
            }));
  }
}
