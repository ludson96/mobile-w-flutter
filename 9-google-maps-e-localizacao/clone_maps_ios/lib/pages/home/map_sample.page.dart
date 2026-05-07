import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _initialPosition;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _determinePosition() async {
    // Test if location services are enabled.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('SERVICE_NOT_ENABLE');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('PERMISSION_LOCATION_DENIED');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('PERMISSION_LOCATION_DENIED');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentPosition = await Geolocator.getCurrentPosition();

    _initialPosition = CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 14,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _determinePosition(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            final error = snapshot.error as String;

            if (error == 'SERVICE_NOT_ENABLE') {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "O serviço de localização está desabilitado. Você  precisa habilitar para utilizá-lo",
                        textAlign: .center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () async {
                          await Geolocator.openLocationSettings();
                        },
                        child: Text("Habilitar localização"),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (error == 'PERMISSION_LOCATION_DENIED') {}
          }

          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition!,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );
        },
      ),
    );
  }
}
