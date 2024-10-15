// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_widget/google_maps_widget.dart' as GM;
import 'dart:math';

class GMapWidget2 extends StatefulWidget {
  const GMapWidget2({
    super.key,
    this.width,
    this.height,
    required this.ordersDocRef,
    required this.ordersDoc,
  });

  final double? width;
  final double? height;
  final DocumentReference ordersDocRef;
  final BookingRecord ordersDoc;

  @override
  State<GMapWidget2> createState() => _GMapWidget2State();
}

class _GMapWidget2State extends State<GMapWidget2> {
  final _mapsWidgetController = GlobalKey<GM.GoogleMapsWidgetState>();

  // same as origin
  List<GM.LatLng> _driverPositions = [];
  @override
  void initState() {
    super.initState();

    // add initial source point
    _driverPositions.add(GM.LatLng(
        widget.ordersDoc.source!.latitude, widget.ordersDoc.source!.longitude));

    // add all the points
    _driverPositions.addAll(widget.ordersDoc.driversPositions!
        .map((element) => GM.LatLng(element.latitude, element.longitude)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GM.GoogleMapsWidget(
                  apiKey: "YOUR GOOGLE MAPS API KEY HERE",
                  key: _mapsWidgetController,
                  sourceLatLng: GM.LatLng(
                    widget.ordersDoc.source!.latitude,
                    widget.ordersDoc.source!.longitude,
                  ),
                  destinationLatLng: GM.LatLng(
                    widget.ordersDoc.destination!.latitude,
                    widget.ordersDoc.destination!.longitude,
                  ),

                  ///////////////////////////////////////////////////////
                  //////////////    OPTIONAL PARAMETERS    //////////////
                  ///////////////////////////////////////////////////////

                  routeWidth: 2,
                  sourceMarkerIconInfo: GM.MarkerIconInfo(
                    infoWindowTitle: "This is source name",
                    onTapInfoWindow: (_) {
                      print("Tapped on source info window");
                    },
                    assetPath: "assets/images/house-marker-icon.png",
                  ),
                  destinationMarkerIconInfo: GM.MarkerIconInfo(
                    assetPath: "assets/images/restaurant-marker-icon.png",
                  ),
                  driverMarkerIconInfo: GM.MarkerIconInfo(
                    infoWindowTitle: "Alex",
                    assetPath: "assets/images/driver-marker-icon.png",
                    onTapMarker: (currentLocation) {
                      print("Driver is currently at $currentLocation");
                    },
                    //assetMarkerSize: GM.Size.square(125),
                    rotation: 90,
                  ),
                  onPolylineUpdate: (p) {
                    print("Polyline updated: ${p.points}");
                  },
                  updatePolylinesOnDriverLocUpdate: true,
                  // mock stream
                  driverCoordinatesStream: Stream.periodic(
                    Duration(milliseconds: 500),
                    (i) => GM.LatLng(
                      _driverPositions[i].latitude,
                      _driverPositions[i].longitude,
                    ),
                  ).takeWhile((element) =>
                      element.latitude != 0 && element?.longitude != 0),

                  totalTimeCallback: (time) => {
                    widget.ordersDocRef.update({"timeleft": time})
                  },
                  totalDistanceCallback: (distance) => {
                    widget.ordersDocRef.update({"distanceleft": distance})
                  },
                ),
              ),
              // demonstrates how to interact with the controller
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _mapsWidgetController.currentState!.setSourceLatLng(
                            GM.LatLng(
                              40.484000837597925 * (Random().nextDouble()),
                              -3.369978368282318,
                            ),
                          );
                        },
                        child: Text('Update source'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final googleMapsCon = await _mapsWidgetController
                              .currentState!
                              .getGoogleMapsController();
                          googleMapsCon.showMarkerInfoWindow(
                            GM.MarkerIconInfo.sourceMarkerId,
                          );
                        },
                        child: Text('Show source info'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
