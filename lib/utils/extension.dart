extension DoubleExtension on double {
  Duration get seconds {
    int milliseconds = (this * 1000).toInt();
    return Duration(milliseconds: milliseconds);
  }
}

extension ShiftString on String {
  String operator <<(int shift) {
    return this.substring(shift, this.length) + this.substring(0, shift);
  }
}