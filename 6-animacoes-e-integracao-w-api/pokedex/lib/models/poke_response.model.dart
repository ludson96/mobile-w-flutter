import 'package:pokedex/models/pokemon.model.dart';

class PokeResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  PokeResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokeResponse.fromMap(Map<String, dynamic> data){
    return PokeResponse(
      count: data["count"],
      next: data["next"],
      previous: data["previous"],
      results: (data["results"] as List)
          .map((poke) => Pokemon.fromMap(poke))
          .toList(),
    );

  }
}
