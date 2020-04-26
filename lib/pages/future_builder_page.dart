import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  final bool _mockError = false;
  final bool _mockResponse = true;

  static const String routeName = '/future-builder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: FutureBuilder(
            initialData: 'The initialData loaded.',
            future: _mockFetchData(),
            builder: _buildWidget,
          ),
        ));
  }

  Widget _buildWidget(BuildContext context, AsyncSnapshot<String> snapshot) {
    print(snapshot);

    /// show default initialData
    if (snapshot.hasData) {
      // AsyncSnapshot<String>(ConnectionState.waiting, The first time loading..., null)
      return Text(
        snapshot.data,
        textScaleFactor: 1.3,
      );
    } else if (snapshot.hasError) {
      // AsyncSnapshot<String>(ConnectionState.done, null, FormatException: Something goes wrong.)
      return Text(
        (snapshot.error as FormatException).message,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  Future<String> _mockFetchData() {
    if (_mockError) {
      return Future.delayed(Duration(seconds: 3), () {
        throw FormatException('Something goes wrong.');
      });
    } else if (_mockResponse) {
      return Future.delayed(Duration(seconds: 3), () {
        return "LOADED DATA FROM SERVER";
      });
    }

    return null;
  }
}
