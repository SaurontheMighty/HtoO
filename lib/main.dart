import 'package:flutter/material.dart';
import 'package:htoo/items.dart';
import 'package:htoo/maps.dart';
import 'package:htoo/tips.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'H to O'),
              backgroundColor: Colors.deepPurple[800],
              automaticallyImplyLeading: false,
            
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Maps(),
              Items(),
              Tips()
            ],
          ),
          bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.map),
            ),
            Tab(
              icon: new Icon(Icons.search),
            ),
            Tab(
              icon: new Icon(Icons.info),
            ),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blue[900],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
      )
    );
  }
}