import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final dbRef = Firestore.instance;
class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();

}

class _TipsState extends State<Tips> {
_launchURL() async {
  const url = 'https://public.wmo.int/en/bulletin/flood-and-drought-management-through-water-resources-development-india';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    // return new StreamBuilder(
    //   stream: dbRef.collection('HtoO').document('Store 1').snapshots(),
    //   builder: (context, snapshot) {
    //     return new Text(snapshot.data["Name"]);
    //   }
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('H to O'),
        backgroundColor: Colors.deepPurple[800],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (context) {
              _launchURL();
        },
            itemBuilder: (BuildContext context) {
              return {'Learn More'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/appbackground.jpg"), fit: BoxFit.cover)),
          margin: EdgeInsets.symmetric(vertical: 0.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              makeTips("Drinking 8 Glasses", "To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", 0),
              makeTips("Did you know?", "Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", 1),
              makeTips("The Benefits","Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", 0),
              makeTips("Safety Tips For Floods","Avoid driving through flooded areas and standing water. As little as six inches of water can cause you to lose control of your vehicle.", 1),
              makeTips("Efficient Usage of Water","Consider purchasing a low-volume toilet that uses less than half the water of older models. Note: In many areas, low-volume units are required by law.", 0),
              makeTips("Saving Water","A heavy rain eliminates the need for watering for up to two weeks. Most of the year, lawns only need one inch of water per week.", 1),
            ],
          ),
        ),
      
    );
  }

Container makeTips(String header, String main, int color){
  return Container(
      height: 240,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Card(
        color: color == 0? Colors.white : Colors.indigoAccent[400],
        elevation: 5,
        child: 
            Column(
              children: <Widget>[
                Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: Alignment.topCenter,
                child: Text(
                  
                    header,
                    
                  style:  TextStyle(fontWeight: FontWeight.bold,color: color == 0? Colors.black : Colors.white, fontSize: 20.0)
                  ),
         
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: Alignment.topCenter,
                child: Text(
                    main,
                  style:  TextStyle(fontWeight: FontWeight.bold,color: color == 0? Colors.black : Colors.white, fontSize: 20.0)),
         
              ),
            
              ],
            ),
    )
  );
}
}