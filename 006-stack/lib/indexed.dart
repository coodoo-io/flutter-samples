import 'dart:math';

import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  IndexedStackPage({Key key}) : super(key: key);

  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  int stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indexed Stack Beispiel'),
      ),
      body: IndexedStack(
        index: stackIndex,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Color(0xff619ff9),
          ),
          Container(
            height: 300.0,
            width: 300.0,
            color: Color(0xFF61c9f9),
          ),
          Container(
            height: 150.0,
            width: 150.0,
            color: Color(0xFF61def9),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          stackIndex = generateNewRandomIndex(stackIndex);
        }),
        tooltip: 'Shuffle elements',
        child: Icon(Icons.shuffle),
      ),
    );
  }

  int generateNewRandomIndex(int index) {
    int oldInt = index;
    int newInt;

    do {
      newInt = new Random().nextInt(3);
    } while (newInt == oldInt);

    return newInt;
  }
}
