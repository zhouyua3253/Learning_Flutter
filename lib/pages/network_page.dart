import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/utils/network.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network request"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Button(
              child: Text("GET REQUEST"),
              padding: EdgeInsets.all(16),
              onPressed: _testGetRequest,
            ),
          ],
        ),
      ),
    );
  }

  void _testGetRequest() async {
    try {
      String res = await http.get<String>("/api/web-admin/");
      print(res);
    } catch (e) {
      print(e);
    }
  }
}
