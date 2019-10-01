import 'package:flutter/material.dart';
import 'package:stack/card.dart';
import 'package:stack/profile.dart';
import 'package:stack/stack.dart';

import 'indexed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Stack Beispiele'),
    );
  }

  openStackPage(context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new StackPage(),
      ),
    );
  }

  openCardStackPage(context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new CardStackPage(),
      ),
    );
  }

  openIndexedStackPage(context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new IndexedStackPage(),
      ),
    );
  }

  openProfileStackPage(context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new ProfileStackPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Beispiel'),
              onPressed: () => MyApp().openStackPage(context),
            ),
            RaisedButton(
              child: Text('Beispiel Karte'),
              onPressed: () => MyApp().openCardStackPage(context),
            ),
            RaisedButton(
              child: Text('Beispiel Profil'),
              onPressed: () => MyApp().openProfileStackPage(context),
            ),
            RaisedButton(
              child: Text('Beispiel Indexed Stack'),
              onPressed: () => MyApp().openIndexedStackPage(context),
            ),
          ],
        ),
      ),
    );
  }
}
