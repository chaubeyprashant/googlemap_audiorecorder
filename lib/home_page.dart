import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nineheartz_assignment/record_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = <Marker>[];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(28.494598,77.089720),
        infoWindow: InfoWindow(
            title: 'Current Location'
        )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(28.493240,77.093756),
        infoWindow: InfoWindow(
            title: 'Dlf phase 3'
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(28.497275,77.088775),
        infoWindow: InfoWindow(
            title: 'Cyber City'
        )
    ),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(28.490939,77.088302),
        infoWindow: InfoWindow(
            title: 'Belvader Tower'
        )
    ),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(28.500481,77.094787),
        infoWindow: InfoWindow(
            title: 'Moulsari Avenue'
        )
    ),
    Marker(
        markerId: MarkerId('6'),
        position: LatLng(28.502750,77.090066),
        infoWindow: InfoWindow(
            title: 'Cyber Park'
        )
    ),
  ];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(28.497426, 77.089075),
    zoom: 14,
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(
        _list
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecordPage()));
        },
        child: const Text("Go To Record Screen",style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
      ),),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          trafficEnabled: false,
          rotateGesturesEnabled: true,
          buildingsEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}

// List<Marker> list = const [
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//           title: 'The title of the marker'
//       )
//   ),
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng( 33.738045,73.084488),
//       infoWindow: InfoWindow(
//           title: 'e-11 islamabd'
//       )
//   ),
// ];
//
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _markers.addAll(
//       list);
// }