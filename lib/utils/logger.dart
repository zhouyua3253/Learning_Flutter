import 'package:logger/logger.dart';

Logger _logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: true),
);

Function printDebug(dynamic message) {
  _logger.d(message);
}

Function printInfo(dynamic message) {
  _logger.i(message);
}

Function printWarn(dynamic message) {
  _logger.w(message);
}

Function printError(dynamic message) {
  _logger.e(message);
}
