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

void debug(dynamic message) {
  _logger.d(message);
}

void info(dynamic message) {
  _logger.i(message);
}

void warn(dynamic message) {
  _logger.w(message);
}

void error(dynamic message) {
  _logger.e(message);
}
