import 'dart:async';

import 'package:clone_maps_ios/pages/home/widget/custom_draggable_sheet.widget.dart';
import 'package:clone_maps_ios/pages/home/widget/error_settings_map.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controllerMap =
      Completer<GoogleMapController>();
  late String mapStyle;
  CameraPosition? _initialPosition;
  MapType _currentMapType = MapType.normal;
  late Future<CameraPosition> _positionFuture;

  final pins = ValueNotifier(<Marker>[]);

  Future<CameraPosition> _determinePosition() async {
    // Test if location services are enabled.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('SERVICE_NOT_ENABLE');
    }

    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('PERMISSION_LOCATION_DENIED');
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    final cameraPosition = CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 14,
    );

    _initialPosition = cameraPosition;

    return cameraPosition;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _positionFuture = _determinePosition();
    rootBundle
        .loadString('assets/map/style.json')
        .then((style) => mapStyle = style);
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
        future: _positionFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            final error = snapshot.error as String;

            if (error == 'SERVICE_NOT_ENABLE') {
              return ErrorSettingsMap(
                textButton: "Habilitar localização",
                textError:
                    "O serviço de localização está desabilitado. Você  precisa habilitar para utilizá-lo",
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                },
              );
            }

            if (error == 'PERMISSION_LOCATION_DENIED') {
              return ErrorSettingsMap(
                textButton: "Conceder permissão de localização",
                textError:
                    "O aplicativo precisa de permissão de localização para funcionar.",
                onPressed: () async {
                  final permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.deniedForever) {
                    await Geolocator.openAppSettings();
                  }
                },
              );
            }
          }

          return Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: pins,
                builder: (_, value, _) {
                  return GoogleMap(
                    mapType: _currentMapType,
                    initialCameraPosition: snapshot.data!,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    style: mapStyle,
                    onMapCreated: (GoogleMapController controller) {
                      _controllerMap.complete(controller);
                    },
                    markers: value.toSet(),
                    onLongPress: (latLng) {
                      final newPin = Marker(
                        markerId: MarkerId(
                          DateTime.now().millisecondsSinceEpoch.toString(),
                        ),
                        position: latLng,
                      );

                      pins.value = List.from(value)..add(newPin);
                    },
                  );
                },
              ),
              Positioned(
                right: 20,
                top: kToolbarHeight,
                child: Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentMapType = _currentMapType == MapType.normal
                                ? MapType.satellite
                                : MapType.normal;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.map_fill,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const Divider(color: Colors.grey),
                      GestureDetector(
                        onTap: () async {
                          final cameraUpdate = CameraUpdate.newCameraPosition(
                            _initialPosition!,
                          );

                          final controller = await _controllerMap.future;
                          controller.animateCamera(cameraUpdate);
                        },
                        child: const Icon(
                          CupertinoIcons.location,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomDraggableSheet(),
            ],
          );
        },
      ),
    );
  }
}
