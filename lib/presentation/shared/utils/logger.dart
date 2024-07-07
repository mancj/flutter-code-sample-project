import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    colors: false,
    methodCount: 1,
    lineLength: 200,
    noBoxingByDefault: true,
  ),
);