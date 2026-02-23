import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/models/poke_response.model.dart';

class PokeApiService {
  late final Dio _dio;

  PokeApiService() {
    _dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
  }

  Future<PokeResponse> loadPokemons({required int offset}) async {
    final response = await _dio.get('/pokemon?offset=$offset&limit=20');

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar pokemons na API");
    }

    return PokeResponse.fromMap(response.data);
  }
}
