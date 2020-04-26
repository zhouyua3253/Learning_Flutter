import 'package:flutter/material.dart';

class PassParameters {
  int id;
  String name;

  PassParameters({this.name, this.id});

  @override
  String toString() {
    return "name: $name, id: $id";
  }

  String urlParameters(String pathname) {
    return '$pathname?name=$name&id=$id';
  }
}

class PassParametersPage1 extends StatelessWidget {
  static const String routeName = '/pass-parameters-1';

  @override
  Widget build(BuildContext context) {
    /// Get parameters
    Object params = ModalRoute.of(context).settings.arguments;

    String data = '';
    if (params is PassParameters) {
      data = params.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('PassParameters-1'),
      ),
      body: Center(child: Text(data)),
    );
  }
}

class PassParametersPage2 extends StatelessWidget {
  static const String routeName = '/pass-parameters-2';

  final String _name;
  final int _age;

  PassParametersPage2({@required String name, @required int age})
      : _name = name,
        _age = age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PassParameters-2'),
      ),
      body: Center(child: Text("name -> $_name, age -> $_age")),
    );
  }
}
