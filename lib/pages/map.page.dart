import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:permission/permission.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

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
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    lat = -23.5023401;
    long = -46.423008;
    LatLng position = LatLng(lat, long);
    mapController.moveCamera(CameraUpdate.newLatLng(position));
    final Marker marker = Marker(
        markerId: new MarkerId("position-1"),
        position: position,
        infoWindow: InfoWindow(
          title: "UBS Curuçá Velha",
          //snippet: "AV. Flamingo, 61"
        ));
    setState(() {
      markers.add(marker);
    });
  }

  Future<String> _getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return "";
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return "";
      }
    }
    _locationData = await location.getLocation();
    debugPrint("long lat = " +
        _locationData.latitude.toString() +
        " - " +
        _locationData.latitude.toString());
    return "dcsdc";
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.AppBarColor,
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {},
          onTap: (position) {},
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
