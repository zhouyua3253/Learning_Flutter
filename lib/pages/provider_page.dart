import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/stores/counter_store.dart';
import 'package:flutter_tutorial/stores/user_store.dart';
import 'package:provider/provider.dart';

class ProviderFirstPage extends StatelessWidget {
  static String routeName = '全局Provider';

  @override
  Widget build(BuildContext context) {
    print('Provider.of build!!!!!!!!');
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /**
               * Provider.of(context).value 变化会刷新整个页面
               */
              Text('Provider.of<T>(context).value 变化会刷新整个页面'),
              Text("Provider.of -> ${Provider.of<CounterStore>(context).count}"),
              Divider(),
              Text('Consumer<T>(builder:) 只刷新builder的widget'),
              Consumer<UserStore>(
                builder: (context, store, child) {
                  print('Consumer.builder!!!!!!!!!');
                  return Expanded(
                    child: ListView(
                        children: store.timeStamps
                            .map((e) => ListTile(title: Text(e.toString())))
                            .toList()),
                  );
                },
              ),
              Button(
                child: Text('Update CounterStore'),
                padding: const EdgeInsets.all(20),
                onPressed: () => _onAddCount(context),
              ),
              Button(
                child: Text('Update UserStore'),
                padding: const EdgeInsets.all(20),
                onPressed: () => _onAddTimeStamp(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onAddCount(BuildContext context) {
    Provider.of<CounterStore>(context, listen: false).add(10);
  }

  void _onAddTimeStamp(BuildContext context) async {
    await Provider.of<UserStore>(context, listen: false).addTimeStamps();
  }
}
