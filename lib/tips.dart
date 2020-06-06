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
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("Drinking 8 Glasses", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.white,
            // ),
          
            makeTips("Drinking 8 Glasses", "To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", 0),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.blue[100],
            // ),
            makeTips("Did you know?", "Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", 1),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("The Benefits", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.white,
            // ),
            makeTips("The Benefits","Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", 0),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.blue[100],
            // ),
            makeTips("The Benefits","Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", 1),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("Drinking 8 Glasses", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("To prevent dehydration, you need to drink adequate amounts of water. Health authorities commonly recommend eight 8-ounce glasses, which equals about 2 liters. Remember to drink your water!", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.white,
            // ),
            makeTips("The Benefits","Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", 0),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //     Text(""),
            //     Text("Did you know?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            //     Text(""),
            //     Text("Today, 785 million people – 1 in 9 – lack access to safe water and 2 billion people. HtoO works to help people find sources of water, and other essentials items near them.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            //   ]),
            //   width: 400.0,
            //   height: 160.0,
            //   color: Colors.blue[100],
            // ),
            makeTips("The Benefits","Drinking water has numerous health benefits. Not only does it cure annoying headaches, but drinking the recommended amount of watr daily is shown to help with constipation as well.", 1),
          ],
        ),
      ),
    );
  }
//   Card listSectionMethod(String text) {
//     return new Card(
//       child: ListTile(
//          // title: Text(title.toString()),
//           subtitle: Text("AAA"),
//           leading: 
//             // CircleAvatar(
//             //   backgroundImage: add image for later maybe??,
//             // ) : 
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     color1,
//                     color2,
//                   ],
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight
//                 )
//               ),
//               child: CircleAvatar(
//                 child: Text(
//                   title[0],
//                   style: TextStyle(
//                     color: Colors.white
//                   )
//                 ),
//                 backgroundColor: Colors.transparent
//               )
//             ),
//         //     trailing: Row(
//         //       mainAxisSize: MainAxisSize.min,
//         //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //       children: <Widget>[
//         //         FlatButton(
//         //           onPressed: (){ countSubtract(title);}, 
//         //           child: Icon(Icons.remove)),
//         //         FlatButton(
//         //           onPressed: (){countAdd(title);
//         //           print(count.toString());}, 
//         //           child: Icon(Icons.add)),
//         //       ],            
//         // ),
        
        
//     )
//     );
// }

Container makeTips(String header, String main, int color){
  return new Container(
    color: Colors.blue[400],
      height: 240,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Card(
        color: color == 0? Colors.white : Colors.blue[800],
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
                        
            // Positioned(
            //   bottom: 0,
            //   left: 10,
            //   right: 150,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text('Date: 18-Sep-2019'),
            //       Text('Category: Sport')
            //     ],
            //   ),
            ),
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: Container(
            //     child: Image.network('https://picsum.photos/250?image=9',
            //         width: 150),
            //   ),
            // )
    )
  );
}
}