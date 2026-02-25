import 'package:pokedex/models/stat.model.dart';

import './type.model.dart';

class PokemonDetails {
  final String name;
  final int id;
  final int height;
  final int weight;
  final int baseExperience;
  final List<Stat>? stats;
  final List<Type>? types;

  PokemonDetails({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.baseExperience,
    this.stats,
    this.types,
  });

  factory PokemonDetails.fromMap(Map<String, dynamic> data) {
    return PokemonDetails(
      name: data["name"],
      id: data["id"],
      height: data["height"],
      weight: data["weight"],
      baseExperience: data["base_experience"],
      stats: data["stats"] != null
          ? (data["stats"] as List).map((stat) => Stat.fromMap(stat)).toList()
          : null,
      types: data["types"] != null
          ? (data["types"] as List).map((type) => Type.fromMap(type)).toList()
          : null,
    );
  }
}
