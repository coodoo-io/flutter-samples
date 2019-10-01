import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardStackPage extends StatelessWidget {
  const CardStackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karte Beispiel'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/forest.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            right: 10.0,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(30.0),
                elevation: 9.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Dies ist ein Wald',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'Necessitatibus dolorem explicabo nobis nulla. Rerum autem quis dolores in. Error et ut officiis deserunt nemo velit consequatur voluptates. Similique eveniet quidem quos qui et sequi sequi molestiae. Atque non et quia qui tempore dicta reprehenderit. Porro ut et tenetur molestiae quia praesentium voluptatum eos.',
                          textAlign: TextAlign.center),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
