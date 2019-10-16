import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logging_with_flutter/logger.util.dart';

void main() {
  Logger.level = Level.debug;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = getLogger();

  @override
  Widget build(BuildContext context) {
    log.d('Debug-Nachricht aus der build-Methode.');
    log.i('Info-Nachricht aus der build-Methode.');
    log.e('Error-Nachricht aus der build-Methode.');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: exampleMethod,
          child: Text(
            "Log-Nachricht ausgeben.",
            style: TextStyle(fontSize: 20.0),
          ),
        )),
      ),
    );
  }

  exampleMethod() {
    log.d('Eine Debug-Nachricht aus einer anderen Methode.');
  }
}
