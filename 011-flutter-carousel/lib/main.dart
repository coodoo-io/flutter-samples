import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Carousel'),
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
  final slider1 = CarouselSlider(
    height: 150,
    items: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.blue,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.red,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.green,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.yellow,
          )),
    ],
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    autoPlayAnimationDuration: Duration(seconds: 2),
    autoPlayCurve: Curves.easeInOutBack,
    enlargeCenterPage: true,
  );

  final slider2 = CarouselSlider(
    height: 150,
    items: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.blue,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.red,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.green,
          )),
      Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.yellow,
          )),
    ],
    enlargeCenterPage: true,
    enableInfiniteScroll: false,
  );

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
            Container(
              child: slider1,
            ),
            Container(
              height: 100,
            ),
            Container(child: slider2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () => slider2.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear),
                    child: Text('Back')),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('1'),
                      onPressed: () => slider2.animateToPage(0,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('2'),
                      onPressed: () => slider2.animateToPage(1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('3'),
                      onPressed: () => slider2.animateToPage(2,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Text('4'),
                      onPressed: () => slider2.animateToPage(3,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear),
                    )),
                RaisedButton(
                    onPressed: () => slider2.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear),
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
