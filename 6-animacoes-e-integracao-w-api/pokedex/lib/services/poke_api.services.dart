import 'package:dio/dio.dart';

class PokeApiService {
  late final Dio _dio;

  PokeApiService() {
    _dio = Dio();
  }

  // Retorna um Future com a lista de pokémons para ser usado em FutureBuilder ou Stores
  Future<List<dynamic>> loadPokemons() async {
    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon');
    return response.data['results'];
  }
}
