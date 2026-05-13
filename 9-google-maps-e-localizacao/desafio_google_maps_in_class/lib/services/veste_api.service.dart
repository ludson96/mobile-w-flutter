import 'dart:io';

import 'package:desafio_google_maps_in_class/models/store_response.model.dart';
import 'package:dio/dio.dart';

class VesteApiService {
  late final Dio _dio;

  VesteApiService()
    : _dio = Dio(
        BaseOptions(baseUrl: "https://5acf-189-6-235-147.ngrok-free.app"),
      );

  Future<List<StoreResponse>> loadStores() async {
    final response = await _dio.get("/stores");

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar personagens.");
    }

    return (response.data["result"] as List)
        .map((store) => StoreResponse.fromMap(store as Map<String, dynamic>))
        .toList();
  }
}
