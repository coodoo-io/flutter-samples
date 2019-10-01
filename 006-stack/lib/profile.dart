import 'package:flutter/material.dart';

class ProfileStackPage extends StatelessWidget {
  const ProfileStackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Beispiel'),
      ),
      body: Container(
        height: 210.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/landscape.jpg'),
                    fit: BoxFit.fitWidth),
              ),
            ),
            Positioned(
              top: 35.0,
              child: Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/avatar.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130.0,
              child: Card(
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Max Mustermann',
                      style: Theme.of(context).textTheme.subtitle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
