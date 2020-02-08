import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';
import 'package:flutter_tutorial/utils/network.dart';

class NetworkPage extends StatelessWidget {
  static const String routeName = 'Network';

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
	          Button(
		          child: Text("POST REQUEST"),
		          padding: EdgeInsets.all(16),
		          onPressed: _testPostRequest,
	          ),
          ],
        ),
      ),
    );
  }

  void _testGetRequest() async {
    try {
      String res = await http.get<String>("/api/v2/versionControl");
    } catch (e) {
      print(e);
    }
  }

  void _testPostRequest() async {
	  try {
		  dynamic data = await http.post("/api/v3/achievement/getUserAchievements");
	  } catch (e) {
		  print(e);
	  }
  }
}
