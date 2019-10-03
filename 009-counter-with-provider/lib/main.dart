// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Counter()),
      ],
      child: Consumer<Counter>(
        builder: (context, counter, _) {
          return MaterialApp(
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Title()),
      body: const Center(child: CounterLabel()),
      floatingActionButton: const IncrementCounterButton(),
    );
  }
}

class IncrementCounterButton extends StatelessWidget {
  const IncrementCounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<Counter>(context, listen: false).increment();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterLabel extends StatelessWidget {
  const CounterLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${counter.count}',
          style: Theme.of(context).textTheme.display1,
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              margin: EdgeInsets.all(8),
              child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  counter.reset();
                  print("Reset Button pressed");
                },
                child: Text("RESET"),
              ),
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(8),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  counter.increment();
                  print("Increment Button pressed");
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
              ),
            )),
          ],
        ),
        RaisedButton(
          child: Text('Counter Page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounterDetailPage()),
            );
          },
        )
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text('Tapped ${counter.count} times');
  }
}

class CounterDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "${counter.count}",
              style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.w800),
            )),
            FlatButton(
              color: Colors.red,
              onPressed: () {
                counter.reset();
                print("Reset Button pressed");
              },
              child: Text("RESET"),
            )
          ],
        ));
  }
}
