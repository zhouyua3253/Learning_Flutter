import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

/**
 * Custom Stream
 */
class _CurrentTimeStream {
  final StreamController<DateTime> _controller = StreamController<DateTime>();

  _CurrentTimeStream() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _controller.sink.add(DateTime.now());
    });
  }

  Stream<String> get steam {
    return _controller.stream.map((event) => event.toString());
  }

  Future<void> addNow() async {
    return Future.delayed(Duration.zero, () {
      _controller.sink.add(DateTime.now());
    });
  }

  void close() {
    _controller.close();
  }
}

class StreamBuilderPage extends StatelessWidget {
  static String routeName = 'StreamBuilder';

  final _CurrentTimeStream _timeStream = _CurrentTimeStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.redAccent,
        height: double.infinity,
        child: RefreshIndicator(
          onRefresh: () => _timeStream.addNow(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.cyan,
                  height: 400,
                  alignment: Alignment.center,
                  child: StreamBuilder<String>(
                    stream: _timeStream.steam,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('ConnectionState.waiting');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Text('done');
                      }

                      if (snapshot.hasData) {
                        return Text(snapshot.data);
                      }

                      return null;
                    },
                  ),
                ),
                Center(
                  child: Button(
                      padding: const EdgeInsets.all(16),
                      child: Text('CLOSE'),
                      onPressed: () => _timeStream.close()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
