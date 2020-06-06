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
        length: 4,
        child: new Scaffold(
          appBar: AppBar(
            title: Text(
              'H to O',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            backgroundColor: Colors.redAccent,
            automaticallyImplyLeading: false,
          ),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.redAccent[100],
                //child: Maps(), //1
              ),
              Container(
                color: Colors.red[900],
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Friends: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Items()//2
                  ],
                ),
              ),
              new Container(
                color: Colors.lightGreen,
                //child: Tips(),//3
              ),
              new Container(
                color: Colors.red,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.chat_bubble),
            ),
            Tab(
              icon: new Icon(Icons.person),
            ),
            Tab(icon: new Icon(Icons.settings),)
          ],
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.redAccent,
          ),
          backgroundColor: Colors.white,
        ),
      )
    );
  }
}