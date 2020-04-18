import 'package:flutter/foundation.dart';
import 'dart:math' show Random;

class ExampleViewModel extends ChangeNotifier {
  List<int> _data = [];

  List<int> get data => _data;

  void fetchData() {
    _data = List<int>.generate(3, (index) => index + 1);
    notifyListeners();
  }

  void random() {
    _data.add(Random().nextInt(1000));
    notifyListeners();
  }
}
