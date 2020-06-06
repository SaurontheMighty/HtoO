import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final dbRef = Firestore.instance;

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();

}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    // return new StreamBuilder(
    //   stream: dbRef.collection('HtoO').document('Store 1').snapshots(),
    //   builder: (context, snapshot) {
    //     return new Text(snapshot.data["Name"]);
    //   }
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 800.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            RaisedButton(
              child: Text("Get Data"),
              onPressed: () {
                getData();
              }
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("Drinking 8 Glasses", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.white,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.blue[100],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("The Benefits", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.white,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.blue[100],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("Drinking 8 Glasses", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.white,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(""),
                Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text(""),
                Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
              ]),
              width: 400.0,
              height: 160.0,
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}

// return new StreamBuilder(
//   stream: dbRef.collection('HtoO').document('Store 1').snapshots(),
//   builder: (context, snapshot) {
//     return new Text(snapshot.data["Name"]);
//   }
// );

void getData() {
  dbRef
        .collection("HtoO")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data["Name"]}}'));
    });
}