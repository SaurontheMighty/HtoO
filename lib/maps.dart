import 'dart:collection';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class Maps extends StatefulWidget {
  final LatLng location;
  
  Maps({this.location});

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  String _mapStyle;
  Set<Marker> _markers = HashSet<Marker>();
  LatLng _center;
  bool call;
  BitmapDescriptor markerIcon;
  final databaseReference = Firestore.instance;

  @override
  void initState() {
    super.initState();
    call = false;
    _center = const LatLng(43.596700, -79.651438);
    setMarkerIcon();
    rootBundle.loadString('assets/mapstyle.txt').then((string) {
      _mapStyle = string;
    });
    databaseReference
        .collection("HtoO")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (f) {
        _markers.add(
          Marker(
            markerId: MarkerId("${f.data["MarkerID"]}"),
            position: LatLng(GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).latitude,GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).longitude),
            infoWindow: InfoWindow(
              title: "${f.data["Name"]}",
              snippet: "Gallons of Water Available: ${f.data["Water Bottle"]} \n Bottles of Hand Sanitizer: ${f.data["Hand Sanitizer"]} \n Rolls of Toilet Paper: ${f.data["Toilet Paper"]}",
              onTap: () async{
                await openMap(f.data["Location"].latitude,f.data["Location"].longitude);
              }
            ),
            onTap: (){
              setState(() {
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).latitude,GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).longitude), zoom: 14)
                ));
              });
            },
            icon: markerIcon
          )
          );
        }
      );
      setState(() {
        print("RESTART");
      });
    });
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  void setMarkerIcon() async{
    markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/bottle.png");
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
    setState(() {
      if(call==true){
        mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: widget.location, zoom: 20)));
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    if(widget.location!=null && _markers.isNotEmpty){
      call = true;
    }

    print("THIS IS MARKERS");
    print(_markers);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Image.asset("assets/logo.png"),
            /* Text(
              'H to O',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ), */
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: false,
            
          ),
        body: Stack(
          children: <Widget>[
            _markers.isNotEmpty?GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.5,
              ),
              myLocationEnabled: true,
              markers: _markers,
            ):Text('LOADING...'),
          ],
        ),
      ),
    );
  }
}