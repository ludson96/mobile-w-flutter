// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'HomeStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$storesAtom = Atom(
    name: 'HomeStoreBase.stores',
    context: context,
  );

  @override
  ObservableList<StoreResponse> get stores {
    _$storesAtom.reportRead();
    return super.stores;
  }

  @override
  set stores(ObservableList<StoreResponse> value) {
    _$storesAtom.reportWrite(value, super.stores, () {
      super.stores = value;
    });
  }

  late final _$storesWithDistanceAtom = Atom(
    name: 'HomeStoreBase.storesWithDistance',
    context: context,
  );

  @override
  ObservableList<StoreWithDistance> get storesWithDistance {
    _$storesWithDistanceAtom.reportRead();
    return super.storesWithDistance;
  }

  @override
  set storesWithDistance(ObservableList<StoreWithDistance> value) {
    _$storesWithDistanceAtom.reportWrite(value, super.storesWithDistance, () {
      super.storesWithDistance = value;
    });
  }

  late final _$loadStoresAsyncAction = AsyncAction(
    'HomeStoreBase.loadStores',
    context: context,
  );

  @override
  Future<void> loadStores() {
    return _$loadStoresAsyncAction.run(() => super.loadStores());
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void sortStoresByDistance({required CameraPosition user}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.sortStoresByDistance',
    );
    try {
      return super.sortStoresByDistance(user: user);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Set<Marker> buildMarkers() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.buildMarkers',
    );
    try {
      return super.buildMarkers();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
stores: ${stores},
storesWithDistance: ${storesWithDistance}
    ''';
  }
}
