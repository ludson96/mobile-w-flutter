import 'dart:async';

import 'package:desafio_google_maps_in_class/pages/home/store/home.store.dart';
import 'package:desafio_google_maps_in_class/pages/home/widget/error_settings_map.widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  final store = HomeStore();

  late Future<CameraPosition> _positionFuture;

  Future<CameraPosition> _determinePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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

    return cameraPosition;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _positionFuture = _determinePosition();
    locateStore();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      if (!_mapController.isCompleted) {
        setState(() {
          _positionFuture = _determinePosition();
        });
      }
    }
  }

  Future<void> locateStore() async {
    await store.loadStores();

    final userPosition = await _positionFuture;

    store.sortStoresByDistance(user: userPosition);
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

          return Observer(
            builder: (context) {
              print(store.storesWithDistance.length);
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: snapshot.data!,
                myLocationEnabled: true,
                markers: store.buildMarkers(),
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
              );
            },
          );
        },
      ),
    );
  }
}
