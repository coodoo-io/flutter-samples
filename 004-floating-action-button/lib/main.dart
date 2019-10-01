import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Floating Action Button Beispiel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _counterToZero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Button pressed $_counter times'),
                RaisedButton(
                    child: Text('Counter to Zero'), onPressed: _counterToZero),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        //foregroundColor: Colors.yellow,
        //backgroundColor: Colors.red,
        //elevation: 0.0,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      /*bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),*/
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
