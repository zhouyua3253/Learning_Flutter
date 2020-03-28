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

void printDebug(dynamic message) {
  _logger.d(message);
}

void printInfo(dynamic message) {
  _logger.i(message);
}

void printWarn(dynamic message) {
  _logger.w(message);
}

void printError(dynamic message) {
  _logger.e(message);
}
