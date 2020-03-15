import 'package:flutter/foundation.dart';

class UserStore with ChangeNotifier {
  List<DateTime> _timeStamps = [];

  Future<void> addTimeStamps() async {
    _timeStamps.add(DateTime.now());
    notifyListeners();

    return Future.delayed(Duration(seconds: 1), () {
      _timeStamps.add(DateTime.now());
      notifyListeners();
    });
  }

  List<DateTime> get timeStamps => _timeStamps;
}
