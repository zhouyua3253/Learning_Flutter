import 'package:flutter/foundation.dart';

class NavigationRailViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  bool _isExtended = false;

  bool get isExtended => _isExtended;

  void updateSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      _isExtended = !_isExtended;
      notifyListeners();
    }
  }

  void updateExtendedState() {
    _isExtended = !_isExtended;
    notifyListeners();
  }
}
