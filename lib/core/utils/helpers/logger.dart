import 'dart:io';
import 'package:logger/logger.dart';

class AppLogger {
  static Logger? _instance;
  static File? _logFile;

  static Future<void> init() async {
    if (_instance != null) return;
    _instance = Logger(
      printer: PrettyPrinter(),
      output: ConsoleOutput(),
    );
  }

  static Logger get instance {
    if (_instance == null) {
      throw Exception('Logger not initialized. Call AppLogger.init() first.');
    }
    return _instance!;
  }

  static File? get logFile => _logFile;
}
