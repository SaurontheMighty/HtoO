import 'dart:collection';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class Maps extends StatefulWidget {
  final int storeID;
  final LatLng location;
  
  Maps({this.storeID, this.location});

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  String _mapStyle;
  Set<Marker> _markers = HashSet<Marker>();
  LatLng _center;
  BitmapDescriptor markerIcon;

  @override
  void initState() {
    super.initState();
    _center = const LatLng(43.588083, -79.642514);
    setMarkerIcon();
    rootBundle.loadString('assets/mapstyle.txt').then((string) {
      _mapStyle = string;
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
      _markers.add(
        Marker(
          markerId: MarkerId("1"), //firestore
          position: LatLng(43.588083, -79.642514), //firestore
          infoWindow: InfoWindow(
            title: "Store Name", //pull from firestore
            snippet: "Items Available",
            onTap: () async{
              print("hi");
              await openMap(43.588083, -79.642514);
            }
          ),
          onTap: (){
            setState(() {
              CameraPosition(target: LatLng(43.588083, -79.642514), zoom: 20);
            });
          },
          icon: markerIcon
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.storeID!=null && widget.location!=null){
      _center = widget.location;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text(
              'H to O'),
              backgroundColor: Colors.deepPurple[800],
              automaticallyImplyLeading: false,
            
          ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.0,
              ),
              myLocationEnabled: true,
              markers: _markers,
            ),
          ],
        ),
      ),
    );
  }
}