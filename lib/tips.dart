import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();

}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 800.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: Text("Tip#1 drink water pls"),
              width: 400.0,
              height: 50.0,
              color: Colors.blue[100],
            ),
            Container(
              child: Text("Tip#1 drink water pls"),
              width: 400.0,
              height: 50.0,
              color: Colors.blue,
            ),
            Container(
              child: Text("Tip#1 drink water pls"),
              width: 400.0,
              height: 50.0,
              color: Colors.green,
            ),
            Container(
              child: Text("Tip#1 drink water pls"),
              width: 400.0,
              height: 50.0,
              color: Colors.yellow,
            ),
            Container(
              child: Text("Tip#1 drink water pls"),
              width: 400.0,
              height: 50.0,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}