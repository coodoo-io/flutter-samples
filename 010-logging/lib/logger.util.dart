import 'package:logger/logger.dart';

Logger getLogger() {
  // Farbdarstellung funktioniert leider noch nicht für den iOS Simulator.
  // Bis dahin deaktiviert.
  return Logger(
    printer: PrettyPrinter(
      lineLength: 160,
      colors: false,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
