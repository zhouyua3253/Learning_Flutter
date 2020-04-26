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
  static const String routeName = '/stream-builder';

  final _CurrentTimeStream _timeStream = _CurrentTimeStream();

  /**
   * factory Stream<T>.periodic() 工厂方法生成Stream
   * https://medium.com/flutter-community/understanding-streams-in-flutter-dart-827340437da6
   */
  Stream<int> get _countDownStream {
    return Stream<int>.periodic(Duration(seconds: 1), (int value) {
      return 10 - value;
    }).take(10);
  }

  /// Stream<T>.periodic()
  /// Stream<T>.take(int count) → Stream<T>
  /// Stream<T>.takeWhile(bool test(T element)) → Stream<T>
  /// Stream<T>.skip(int count)
  /// Stream<T>.skipWhile(bool test(T element))
  /// Stream<T>.distinct([bool equals(T previous, T next)]) 取唯一不同的值
  /// Stream<T>.listen() → StreamSubscription<T>
  /// Stream<T>.toList() → Future<List<T>>
  /// Stream<T>.forEach() → Future

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Container(
        width: double.infinity,
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
                        return Text('StreamController\nConnectionState.waiting');
                      } else if (snapshot.connectionState == ConnectionState.done) {
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
                      child: Text('StreamController\nCLOSE'),
                      onPressed: () => _timeStream.close()),
                ),
                Center(
                    child: StreamBuilder<int>(
                        stream: _countDownStream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Text('done');
                          }

                          if (snapshot.hasData) {
                            return Text('Stream<T>.periodic()\ncountdown ${snapshot.data}s');
                          }

                          return Container();
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
