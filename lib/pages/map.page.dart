import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:permission/permission.dart';
//import 'package:permission_handler/permission_handler.dart';

import '../style.colors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = 45.52;
  double long = -122.67;
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;

    lat = -23.5023401;
    long = -46.423008;
    LatLng position = LatLng(lat, long);
    mapController.moveCamera(CameraUpdate.newLatLng(position));
    final Marker marker =  Marker(
      markerId: new MarkerId("position-1"),
      position: position,
      infoWindow: InfoWindow(
        title: "UBS Curuçá Velha",
        //snippet: "AV. Flamingo, 61"
      )
    );
    setState(() {
      markers.add(marker);
    });
    
  }

  /*void setPermissions() async{
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
  }*/
/*
  void _getCurrentLocation() {
    //setPermissions()
    debugPrint("teste");
    final Geolocator _geolocator = Geolocator()
      ..forceAndroidLocationManager = true;
    String _stringPosition = "";
    _geolocator.checkGeolocationPermissionStatus().then((
        GeolocationStatus _locationStatus) {
      if (_locationStatus == GeolocationStatus.granted) {
        _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .then((Position position) {
          setState(() {
            _stringPosition =
            'Altitude: ${position.altitude} Longitude: ${position.longitude}';
            debugPrint(_stringPosition);

          });
        }).catchError((e) {
          _stringPosition = e.toString();
          debugPrint(_stringPosition);
        });
      }
    });
  }*/


  @override
  Widget build(BuildContext context) {
    //_getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.AppBarColor,
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data){

          },
          onTap: (position){

          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 18.0,
          ),
          markers: markers,
        ),
      ), 
    );
  }
}