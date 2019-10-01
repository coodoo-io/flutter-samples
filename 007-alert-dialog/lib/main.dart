import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ModalBarrier(color: Colors.red);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
              //title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)
              )),
      home: MyHomePage(title: 'AlertDialog Demo'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _counterZero() {
    setState(
      () {
        _counter = 0;
      },
    );
  }

  void _showSimpleDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Please select your preferred option'),

          children: <Widget>[
            Container(
              child: SimpleDialogOption(child: Text('Option 1')),
            ),
            Container(
              child: SimpleDialogOption(child: Text('Option 2')),
            ),
            Container(
              child: SimpleDialogOption(child: Text('Option 3')),
            ),
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          //elevation: 0.0,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),)
        );
      },
    );
  }

  void _showAlertDialog() {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Alert!',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.green[900],
            ),
          ),
          content: Text(
            'Bitte Aktion bestätigen.',
            style: TextStyle(color: Colors.purple),
          ),
          backgroundColor: Colors.yellow,
          actions: <Widget>[
            FlatButton(
              child: Text('Abbrechen'),
              color: Colors.blue[100],
              onPressed: () {
                _counterZero();
                Navigator.of(context).pop();
              },
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.orange[800], width: 2.0),
              child: Text('Bestätigen'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }

  void _showEmptyAlertDialog() {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog();
      },
    );
  }

  void _showAlertDialog2() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Counter to high'),
          content: Text(
              'You have pushed the button $_counter times. \n The Counter will be set to Zero.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                _counterZero();
                Navigator.of(context).pop();
              },
            ),
          ],
          //elevation: 0.0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('SimpleDialog'),
              onPressed: _showSimpleDialog,
            ),
            RaisedButton(
              child: Text('AlertDialog'),
              onPressed: _showAlertDialog,
            ),
            RaisedButton(
              child: Text('EmptyAlertDialog'),
              onPressed: _showEmptyAlertDialog,
            ),
          ],
        ),
      ),
    );
  }
}
