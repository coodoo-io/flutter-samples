import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Statusbar Farbwechsel Beispiel'),
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
  bool whiteForeground = true;
  Color textColor = Colors.white;
  Color barColor = ThemeData().accentColor;

  String getRecommendedTextColor(Color color) {
    if (useWhiteForeground(color)) {
      return 'Weiß';
    } else {
      return 'Schwarz';
    }
  }

  void changeColors(Color color) {
    this.setState(() {
      FlutterStatusbarcolor.setStatusBarColor(color);
      FlutterStatusbarcolor.setNavigationBarColor(color);
      barColor = color;
    });
  }

  void toggleTextColor() {
    whiteForeground = !whiteForeground;

    if (whiteForeground == true) {
      this.setState(() {
        textColor = Colors.white;
      });
    } else {
      this.setState(() {
        textColor = Colors.black;
      });
    }
    FlutterStatusbarcolor.setStatusBarWhiteForeground(whiteForeground);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: barColor,
        textTheme: Theme.of(context).textTheme.copyWith(
            title:
                Theme.of(context).textTheme.title.copyWith(color: textColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) => RaisedButton(
                    child: Text('Textfarbvorschlag'),
                    textColor: textColor,
                    color: Colors.grey[400],
                    onPressed: () async {
                      Scaffold.of(context).removeCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Empfohlene Textfarbe: ' +
                                getRecommendedTextColor(
                                  await FlutterStatusbarcolor
                                      .getStatusBarColor(),
                                ),
                          ),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 70.0),
              child: RaisedButton(
                child: Text('Weißen Statusbar Vordergrund An/Ausschalten'),
                color: Colors.grey[400],
                onPressed: () => toggleTextColor(),
                textColor: textColor,
              ),
            ),
            RaisedButton(
              child: Text('Orange'),
              onPressed: () => changeColors(Colors.orange),
              color: Colors.orange,
              textColor: textColor,
            ),
            RaisedButton(
              child: Text('Limette'),
              onPressed: () => changeColors(Colors.lime),
              color: Colors.lime,
              textColor: textColor,
            ),
            RaisedButton(
              child: Text('Dunkellila'),
              onPressed: () => changeColors(Colors.deepPurple),
              color: Colors.deepPurple,
              textColor: textColor,
            ),
            RaisedButton(
              child: Text('Schwarz'),
              onPressed: () => changeColors(Colors.black),
              color: Colors.black,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
