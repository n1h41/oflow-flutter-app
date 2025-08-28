import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class AppLogger {
  static Logger? _instance;
  static File? _logFile;

  static Future<void> init() async {
    if (_instance != null) return;
    final directory = await getApplicationDocumentsDirectory();
    _logFile = File('${directory.path}/debugLog.txt');
    _instance = Logger(
      printer: PrettyPrinter(),
      output: MultiOutput(
        [
          ConsoleOutput(),
          FileOutput(file: _logFile!),
        ],
      ),
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
