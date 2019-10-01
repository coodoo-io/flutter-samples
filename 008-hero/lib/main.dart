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
      home: MyHomePage(title: 'Hero Widget - first page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  FirstPage createState() => FirstPage();
}

class FirstPage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "DemoTag",
        tooltip: 'like',
        onPressed: (){
          Navigator.push(
            context,
            PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (_, __, ___) => SecondPage(
          )));},
        child: Icon(Icons.thumb_up),
        ), 
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Widget - second page'),
      ),
      body: Center(
      child: Hero(
          tag: "DemoTag",
          child: Icon(
            Icons.thumb_up,
            size: 200.0,
            color: Colors.blue,
          ),
          flightShuttleBuilder: (flightContext, animation, direction,
            fromContext, toContext) {
              if(direction == HeroFlightDirection.push) {
              return Icon(
                Icons.favorite,
                size: 150.0,
                color: Colors.blue,
              );
            } else if (direction == HeroFlightDirection.pop){
              return Icon(
                Icons.favorite,
                size: 70.0,
                color: Colors.blue,
              );
            }
            },
          placeholderBuilder: (context, size, widget) {
            return Container(
              height: 200.0,
              width: 200.0,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}