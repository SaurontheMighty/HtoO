import 'dart:collection';

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

  void setMarkerIcon() async{
    markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/bottle.png");
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(43.588083, -79.642514),
          infoWindow: InfoWindow(
            title: "Store Name",
            snippet: "Items Available",
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