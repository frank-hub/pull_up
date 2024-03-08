import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pull_up/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      )),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: MapWithPermissionRequest(),
        ),
      ),
    );
  }
}

class MapWithPermissionRequest extends StatefulWidget {
  @override
  _MapWithPermissionRequestState createState() =>
      _MapWithPermissionRequestState();
}

class _MapWithPermissionRequestState extends State<MapWithPermissionRequest> {
  late GoogleMapController mapController;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    requestPermissionAndShowMap();
  }

  Future<void> requestPermissionAndShowMap() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle case when user refuses to enable location services
        return;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // Handle case when user refuses to grant location permission
        return;
      }
    }

    // If permission is granted, show the map
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      return CircularProgressIndicator(); // or other loading indicator
    } else {
      return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('GooglePlex'),
            position: LatLng(37.42796133580664, -122.085749655962),
            infoWindow: InfoWindow(title: 'Googleplex'),
          ),
        },
      );
    }
  }
}
