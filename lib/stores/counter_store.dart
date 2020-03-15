import 'package:flutter/foundation.dart';

class CounterStore with ChangeNotifier {
  int _count = 0;

  void add(int num) {
    _count += num;
    notifyListeners();
  }

  void reduce(int num) {
    _count -= num;
    notifyListeners();
  }

  void square() {
    _count *= _count;
    notifyListeners();
  }

  get count => _count;
}