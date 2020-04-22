import 'package:flutter/material.dart';

class SliderViewModel extends ChangeNotifier {
  double _sliderValue = 0;

  double get sliderValue => _sliderValue;

  RangeValues _rangeValues = RangeValues(2, 6);

  RangeValues get rangeValues => _rangeValues;

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void setRangeValues(RangeValues values) {
    _rangeValues = values;
    notifyListeners();
  }
}
