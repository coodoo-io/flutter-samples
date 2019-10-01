import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Beispiel'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xff619ff9),
          ),
          Container(
            color: Colors.white24,
            height: 300.0,
            width: 300.0,
          ),
          Positioned(
            top: 50.0,
            left: 200.0,
            height: 150.0,
            width: 150.0,
            child: Container(
              color: Colors.white24,
            ),
          ),
        ],
      ),
    );
  }
}
