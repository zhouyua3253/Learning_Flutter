import 'package:flutter/foundation.dart';

class NavigationRailViewModel extends ChangeNotifier with DiagnosticableTreeMixin {
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

  /// https://github.com/rrousselGit/provider#can-i-inspect-the-content-of-my-objects
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(IntProperty('selectedIndex', selectedIndex));
    properties.add(DiagnosticsProperty<bool>('isExtended', isExtended));

    // properties.add(StringProperty('isExtended', isExtended));
    // properties.add(DiagnosticsProperty<KitchenModel>('kitchen', _kitchen));
    // properties.add(DiagnosticsProperty<List>('items', _foodsAndCategories));
  }
}
