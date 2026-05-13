import 'package:desafio_google_maps_in_class/models/store_response.model.dart';
import 'package:desafio_google_maps_in_class/models/store_with_distance.model.dart';
import 'package:desafio_google_maps_in_class/services/veste_api.service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _service = VesteApiService();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<StoreResponse> stores =
      <StoreResponse>[].asObservable();

  @observable
  ObservableList<StoreWithDistance> storesWithDistance =
      <StoreWithDistance>[].asObservable();

  @action
  Future<void> loadStores() async {
    isLoading = true;

    final response = await _service.loadStores();

    stores.clear();
    stores.addAll(response);

    isLoading = false;
  }

  @action
  void sortStoresByDistance({
    required CameraPosition user,
  }) {
    final result = stores.map((store) {
      final distance = Geolocator.distanceBetween(
        user.target.latitude,
        user.target.longitude,
        store.latitude,
        store.longitude,
      );

      return StoreWithDistance(
        store: store,
        distance: distance,
      );
    }).toList();

    result.sort(
      (a, b) => a.distance.compareTo(b.distance),
    );

    storesWithDistance.clear();
    storesWithDistance.addAll(result);
  }

  @action
  Set<Marker> buildMarkers() {
  return storesWithDistance.map((item) {
    final unitStore = item.store;

    return Marker(
      markerId: MarkerId(unitStore.id.toString()),

      position: LatLng(
        unitStore.latitude,
        unitStore.longitude,
      ),
    );
  }).toSet();
}
}