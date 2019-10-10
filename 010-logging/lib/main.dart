import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
import 'package:logging_with_flutter/logger.util.dart';

void main() {
  // Logger: Wählen welches Level angezeigt werden soll.
  Logger.level = Level.verbose;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Logger: In der jeweiligen Klasse erstellen um den Logger nutzen zu können.
  final log = getLogger();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Logger: Log-Nachricht einfügen.
            log.i('Nachricht mit Level: Info.');
          },
        ),
        body: Center(
          child: Text("Lorem ipsum."),
        ),
      ),
    );
  }
}
