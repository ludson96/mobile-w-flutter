import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/models/poke_response.model.dart';
import 'package:pokedex/models/pokemon_details.model.dart';

class PokeApiService {
  late final Dio _dio;

  PokeApiService() {
    _dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
  }

  Future<PokemonDetails> getPokemonDetail(String nameOrId) async {
    final response = await _dio.get("/pokemon/$nameOrId");

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar o detalhe do Pokemon");
    }

    return PokemonDetails.fromMap(response.data);
  }

  Future<PokeResponse> loadPokemons({required int offset}) async {
    final response = await _dio.get('/pokemon?offset=$offset&limit=20');

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar pokemons na API");
    }

    return PokeResponse.fromMap(response.data);
  }
}
